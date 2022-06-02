import 'dart:async';
import 'dart:convert';

import 'package:blackchecktech/Utilities/common_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';


import '../../../Styles/font.dart';
import '../../../Styles/my_colors.dart';
import '../../../Utils/preference_utils.dart';
import '../../../Utils/share_predata.dart';
import '../../Authentication/login/model/SignupModel.dart';
import 'my_db.dart';

class ChatPage extends StatefulWidget {
  final Map<String, dynamic> receiver;
  final UserDetails userObj;

  final String? mixId; // only when mix is shared
  final String? message; // only when mix is shared


   ChatPage({
     Key? key,
    required this.receiver,
    required this.userObj,
    required this.mixId,
    required this.message,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var message = "";
  var roomId = "";
  var _isLoading = true;
  var messageEditingController = TextEditingController();
  late Size size;
  final _firestore = FirebaseFirestore.instance;

  StreamController<bool> _typingStatusController = StreamController<bool>();
  Stream<bool> get typingStatusStream => _typingStatusController.stream;

  StreamController<String> _chatDateController = StreamController<String>();
  Stream<String> get chatDateStream => _chatDateController.stream;
  SignupModel? myModel;
  setIsLoading(bool val) {
    setState(() {
      _isLoading = val;
    });
  }

  @override
  void initState() {
    init();

    super.initState();
  }




  init() async {

    var preferences = MySharedPref();
    myModel =
    await preferences.getSignupModel(SharePreData.keySignupModel);

    if (widget.mixId != null) {
      initDB(); // initializing all the firebase methods when direct pin share
    } else {
      // checking for room existence
      MyDB()
          .findCommonChatroom(widget.receiver["id"], widget.userObj)
          .then((value) {
        roomId = value;
        if (roomId.isNotEmpty) initDB();
      });
      // Only if room is available then initiolizing firebase
    }
  }

  @override
  void dispose() {
    if (roomId.isNotEmpty)
      MyDB().updateMyTypingStatus(
          false, widget.receiver["id"].toString(), widget.userObj);

    // _chatDateController.close();

    _typingStatusController.close();
    super.dispose();
  }

  initDB() async {
    print("ChatBoxView under initDB");
    var value = await MyDB()
        .prepareToSendMessage(widget.receiver, widget.userObj, context);
    print("ChatBoxView under prepareToSendMessage $value");

    if (value != null) {
      roomId = value;
      setIsLoading(false);
      var value1 = await MyDB().updateReadStatusOfMessagesSentToMe(
          roomId, widget.receiver["id"].toString(), widget.userObj);
      print("ChatBoxView under updateReadStatusOfMessagesSentToMe $value1");

      if (widget.mixId != null) {
        shareMix();
      }
    }
    await initTypingStatusDB();
  }

  initTypingStatusDB() async {
    _firestore
        .collection("users")
        .doc(widget.receiver["id"])
        .collection("rooms")
        .doc(widget.userObj.id.toString())
        .snapshots()
        .listen((event) {
      print("ChatBoxView under initTypingStatusDB--- > ${event}");

      if (event != null) {
        if (event.data() != null) {
          Map<dynamic, dynamic> map = event.data() ?? Map<dynamic, dynamic>();

          if (map["is_typing"] != null)
            print("ChatBoxView map is_typing ${map["is_typing"]}");
          if (mounted) _typingStatusController.add(map["is_typing"]);
        }
      }
    });
    print("initState => ${widget.receiver["id"]}");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(widget.receiver["name"], style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.w600,
          fontFamily: AppFont.circularBookFont,
          fontStyle: FontStyle.normal,),),
        backgroundColor: white,
      ),
      body: SafeArea(
          child: Column(children: [
        Expanded(
            child: roomId.isEmpty
                ? Container()
                // _isLoading ? myLoader() :
                : chatStream()),
        roomId.isEmpty || roomId == null ? Container() : _typingStatus(),
        sendMessageForm2(),
      ])),
    );
  }

  Widget _typingStatus() {
    return Container(
      // height: 70,
      width: double.infinity,
      child: StreamBuilder(
          stream: typingStatusStream,
          builder: (BuildContext context, AsyncSnapshot<bool> typingStatus) {
            print("isImageLoading value --> " + typingStatus.data.toString());
            if (typingStatus.connectionState == ConnectionState.waiting) {
              return Container();
            }

            if (typingStatus.hasData) {
              if (typingStatus.data??false) {
                print("under isImageLoading.data ${typingStatus.data}");

                return typingStatusBubble();
              } else
                return Container();
            }

            return Container();
          }),
    );
  }

  Widget typingStatusBubble() {
    var decor = const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10)),
      color: grey_acacac,
    );

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 7, bottom: 7),
        decoration: decor,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.6,
                ),
                child: Text(
                  "Typing...",
                  softWrap: true,
                  style: TextStyle(
                    color: green,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFont.circularBookFont,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myLoader() {
    return const Center(
      child:
          SizedBox(height: 50, width: 50, child: CircularProgressIndicator()),
    );
  }

  Widget chatStream() {
    return StreamBuilder(
      stream: MyDB().getChatStreamByRoomId(roomId),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        print("snapshot.connectionState -->  ${snapshot.connectionState}");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
          // return myLoader();
        }

        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.hasData) {
// updating all the message read status
          MyDB().updateReadStatusOfMessagesSentToMe(roomId, widget.receiver["id"].toString(), widget.userObj);

          final chatDocs = snapshot.data?.docs;

          return ListView.builder(
            padding: EdgeInsets.only(top: 50),
            reverse: true,
            itemCount: chatDocs?.length,
            itemBuilder: (ctx, index) {
              print("-->> index $index == ${chatDocs?.length}");

              // if (index == chatDocs.length - 1) {
              //   _typingStatusController.add(false); // strem to
              // }
              var myData = chatDocs?[index].data() as Map;
              DateTime sentAt = (myData["timeStamp"] as Timestamp).toDate();

              _chatDateController.add(sentAt.toString());

              String? date;
              if (index == (chatDocs?.length??1) - 1) {
                date = formatDateddmmmmyyy(sentAt.toString());
              } else if (index >= 0) {
                String messageDate = formatDateddmmmmyyy(sentAt.toString());

                var myData2 = chatDocs?[index + 1].data() as Map;
                DateTime sentAt2 = (myData2["timeStamp"] as Timestamp).toDate();
                String previousMessageDat =
                    formatDateddmmmmyyy(sentAt2.toString());

                print("index -->  ${index} $previousMessageDat $messageDate");
                if (previousMessageDat != messageDate) {
                  print("--> Under ");
                  date = messageDate;
                } else {
                  date = null;
                }
                // date = formatDateddmmyyyy(sentAt);
              } else {
                date = formatDateddmmmmyyy(sentAt.toString());
              }

              print("index -----------> $date");

              return Column(
                children: [
                  if (date != null)
                    Center(
                      child: _chatDateView(date),
                    ),
                  if (date != null)
                    SizedBox(
                      height: 10,
                    ),
                  _chatItem(myData, chatDocs, index)
                ],
              );
            },
          );
        }

        return SizedBox();
      },
    );
  }

  Widget _chatItem(myData, chatDocs, index) {
    // type 0 = text, 1= image, 2 = pin id (Pin Detail)
    if (myData["type"] != null && myData["type"] == 0) {
      return Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 7, bottom: 7),
        child: messageBubble(chatDocs[index]),
      );
    } else if (myData["type"] != null && myData["type"] == 1) {
      return Container();
      // return getChatImage(chatDocs[index]);
    } else if (myData["type"] != null && myData["type"] == 2) {
      // return Container();
      return getMixItem(chatDocs[index]);
    } else {
      return Container();
    }
  }

  Widget _chatDateView(_date) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 19, right: 19),
      decoration: BoxDecoration(
        color: grey_88898d,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(_date,
          style: TextStyle(
            fontSize: 11,
            fontFamily: AppFont.regularFont,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.start),
    );
  }

  Widget messageBubble(QueryDocumentSnapshot snap) {
    var myData = snap.data();
    // print(myData);

    bool isMe = myData["senderId"].toString() == myModel?.data?.id.toString();
    // bool isMe = false;
    String message = myData["message"];
    DateTime sentAt = (myData["timeStamp"] as Timestamp).toDate();
    final DateFormat formatter = DateFormat('jm');
    final String formattedTime = formatter.format(sentAt);

    BoxDecoration decor = isMe
        ? const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(0),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: black,
          )
        : const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: light_grey_f2f2f2,
          );

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: decor,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.6,
                ),
                child: isMe?Text(
                  message,
                  softWrap: true,
                  style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFont.circularBookFont,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ):Text(
                  message,
                  softWrap: true,
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFont.boldFont,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Opacity(
                opacity: isMe ? 0.69 : 1,
                child: Text(
                  formattedTime,
                  softWrap: true,
                  style: TextStyle(
                    color: isMe ? white : EdTxtBg,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFont.sfProRegularFont,
                    fontStyle: FontStyle.normal,
                    fontSize: 11.7,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getMixItem(QueryDocumentSnapshot snap) {
    print("pinId $snap");
    print("snap.data() " + snap.data().toString());

    var myData = snap.data();
    // print(myData);

    bool isMe = myData["senderId"].toString() == myModel?.data?.id.toString();
    // bool isMe = false;
    String messageWithMix = myData["message"];
    DateTime sentAt = (myData["timeStamp"] as Timestamp).toDate();
    final DateFormat formatter = DateFormat('jm');
    final String formattedTime = formatter.format(sentAt);

    BoxDecoration decor = isMe
        ? const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(0),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: grey_88898d,
          )
        : const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: black_282828,
          );

    return GestureDetector(
      onLongPress: () {
        print(snap.id + " myData " + myData.toString());

        print("myData.keys" + myData.keys.toString());

        // if (isMe)
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) => CommonDialog(
        //           interface: this,
        //           title: str_confirmation,
        //           bodyMessage: str_do_you_want_to_delete_this_item,
        //           positiveButtonText: str_yes,
        //           negativeButtonText: str_no,
        //           value: snap.id,
        //         ));
      },
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: FutureBuilder(
            future: getMixDetail(myData["mixId"]),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              print(snapshot.toString());
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  // height: MediaQuery.of(context).size.width,
                  height: 120,
                  width: size.width * 0.7,
                  margin: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: isMe ? 60 : 20,
                      right: !isMe ? 60 : 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(isMe ? 10 : 0),
                        topRight: Radius.circular(isMe ? 0 : 10),
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    color: isMe ? black : white,
                  ),
                  child: Center(
                      child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ))
                      //  myLoader()
                      ),
                );
              }

              if (snapshot.hasData) {
                DateTime sentAt = (myData["timeStamp"] as Timestamp).toDate();
                // String formattedTime = formatDateddmmhhmss(sentAt);
                String formattedTime = formatDatehhmm(sentAt);
                if (snapshot.data is Map) {
                  return Container(
                      width: size.width * 0.7,
                      // constraints: BoxConstraints(
                      //   maxWidth: size.width * 0.6,
                      // ),
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      margin: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: isMe ? 40 : 20,
                          right: !isMe ? 40 : 20),
                      padding: EdgeInsets.all(10),
                      decoration: decor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: isMe
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  print("widget.mixId ${widget.mixId}");
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Artist_1(
                                  //       mixID: int.parse(myData["mixId"]),
                                  //       artistID: snapshot.data['artist_id'],
                                  //       artistName:
                                  //           snapshot.data['artist_details']
                                  //               ['full_name'],
                                  //     ),
                                  //   ),
                                  // );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "https://madhouse-app.s3.amazonaws.com/mixes/" +
                                                        snapshot.data[
                                                            "mix_image"]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child:
                                            null /* add child content here */,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, right: 8.0),
                                          child: Column(
                                              // constraints: BoxConstraints(
                                              //   maxWidth: size.width * 0.6,
                                              // ),
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data[
                                                          'description'] ??
                                                      "",
                                                  //  snapshot.data["mix_file"]??"",
                                                  softWrap: true,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: white,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: AppFont
                                                        .sfProRegularFont,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 15.0,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  // artistName = value['artist_details']['full_name'],

                                                  "by ${snapshot.data['artist_details']['full_name']}",
                                                  //  snapshot.data["mix_file"]??"",
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    color: white,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: AppFont
                                                        .circularBookFont,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12.0,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ]),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (messageWithMix != null &&
                                  messageWithMix != "")
                                Expanded(
                                    child: Text(
                                  messageWithMix,
                                  style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFont.circularBookFont,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0,
                                  ),
                                  textAlign: TextAlign.left,
                                )),
                              Opacity(
                                opacity: isMe ? 0.69 : 1,
                                child: Text(
                                  formattedTime,
                                  softWrap: true,
                                  style: TextStyle(
                                    color: isMe ? white : EdTxtBg,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFont.sfProRegularFont,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 11.7,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ));
                } else
                  return Container();
              }

              return Text("");
            }),
      ),
    );
  }

  Widget sendMessageForm2() {
    return Container(
      decoration: const BoxDecoration(color: Color(0xffffffff)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.7, top: 21.7, bottom: 21.7),
        child: Row(
          children: [
            // Rectangle 1697
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(33)),
                    color: light_grey_f2f2f2,),
                child: TextField(
                  controller: messageEditingController,
                  style: const TextStyle(
                      color: txt_color,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFont.circularBookFont,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: "Type a message here... ",
                    hintStyle: TextStyle(
                      color: EdTxtBg,
                      fontWeight: FontWeight.w500,
                      fontFamily: AppFont.circularBookFont,
                      fontStyle: FontStyle.normal,
                      fontSize: 14.0,
                    ),
                    border: InputBorder.none,

                    labelStyle: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFont.circularBookFont,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    // hintStyle: TextStyle(
                    //     fontSize: 18.0, color: Colors.black87,fontFamily: 'Poppins',fontWeight: FontWeight.w600
                    // ),
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (val) {
                    message = val;
                    MyDB().updateMyTypingStatus(val.isEmpty ? false : true,
                        widget.receiver["id"].toString(), widget.userObj);
                  },
                  onEditingComplete: () {
                    MyDB().updateMyTypingStatus(false,
                        widget.receiver["id"].toString(), widget.userObj);
                  },
                  onSubmitted: (val) {
                    message = val;
                    MyDB().updateMyTypingStatus(false,
                        widget.receiver["id"].toString(), widget.userObj);
                  },
                ),
              ),
            ),
            RawMaterialButton(
              onPressed: () => sendMessage(),
              fillColor: white,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: const Icon(
                  Icons.send,
                ),
              ),
              padding: const EdgeInsets.all(12.0),
              shape: const CircleBorder(),
            )
          ],
        ),
      ),
    );
  }

  sendMessage() async {
    if (roomId.isEmpty) await initDB();

    message = messageEditingController.text;

    MyDB().sendMessageToDB(roomId, 0, message, "", "",
        widget.receiver["id"].toString(), widget.userObj);
    messageEditingController.clear();
  }

  shareMix() async {
    if (roomId.isEmpty) await initDB();
    // type 0 = Text, 1 = Image, 2 = pin Id(For Pinned Details)
    print("widget.message ${widget.message}");
    MyDB().sendMessageToDB(
        roomId,
        2,
        widget.message,
        "",
        widget.mixId.toString(),
        widget.receiver["id"].toString(),
        widget.userObj);
  }

  Future<dynamic> getMixDetail(mixId) async {
    // FormData params = FormData.fromMap({
    //   "mix_id": mixId,
    // });
    //
    // dynamic mapValue =
    //     await postDataRequestWithToken(getmixDetailApi, params, context);
    //
    // return mapValue;
    // if (value is Map)
    //   {

    //     print("ARTIST DETAIL IMAGE : ${value.toString()}"),

    //     artist_id = value['artist_id'],
    //     description = value['description'],
    //     artistDescription = value['artist_details']['description'],
    //     artistName = value['artist_details']['full_name'],
    //     artistImage = value['artist_details']['image'],
    //     title = value['mix_title'],
    //     mixTotalDuration = value['duration'],
    //     mixFileName = value['mix_file'],
    //     print("$mixFileName"),
    //     mixImageName = value['mix_image'],
    //     colorCode = value['colorcode'],
    //     newColorCode = colorCode.substring(1),
    //     firstotherartists = value['other_artist'],

    //     print(player.playerState.playing),

    //     if (player.playerState.playing == false)
    //       {
    //         mixId = widget.mixID,
    //         playlist = audio.ConcatenatingAudioSource(children: [
    //           audio.AudioSource.uri(
    //             Uri.parse("https://madhouse-app.s3.amazonaws.com/mixes/" +
    //                 mixFileName),
    //             tag: MediaItem(
    //               id: widget.mixID.toString(),
    //               album: artistName,
    //               title: title,
    //               extras: {
    //                 'color': int.parse('0xff$newColorCode'),
    //                 'screen': 'mix',
    //                 'songFile': mixFileName,
    //                 'songImge': mixImageName,
    //                 'artistId': widget.artistID
    //               },
    //               artUri: Uri.parse(
    //                   "https://madhouse-app.s3.amazonaws.com/mixes/$mixImageName"),
    //             ),
    //           ),
    //         ]),
    //         init(),
    //       },

    //     print("NEW COLOR CODE : $newColorCode"),
    //     // play(),

    //     if (value['songs'].length != 0)
    //       {
    //         handleSongResponse(value['songs']),
    //       }
    //     else
    //       {
    //         print("No Song Found"),
    //       },

    //     if (value['genre'] != null)
    //       {
    //         handleGenreResponse(value['genre']),
    //       },
    //     if (value['culture'] != null)
    //       {
    //         handlecultureResponse(value['culture']),
    //       },
    //     if (value['mood'] != null)
    //       {
    //         handlemoodResponse(value['mood']),
    //       },
    //     if (value['timeframes'] != null)
    //       {
    //         handletimeframesResponse(value['timeframes']),
    //       }
    //     else
    //       {print("object")}
    //   }
    // else
    //   {
    //     //showCustomToast("Enable to get mix detail", context),
    //   }
    // });
  }
}
