import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Styles/font.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/common_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../Styles/my_colors.dart';
import '../../../Styles/my_icons.dart';
import '../../../Utils/preference_utils.dart';
import '../../../Utils/share_predata.dart';
import 'user_list_for_chat_controller.dart';
import 'chat_page.dart';
import 'my_db.dart';

class FriendListScreen extends StatefulWidget {
//  final String mixId; // this is only when mix is shared to multiple users
//   final List<AdmireList>
//       selectedUsersList; // this is only when mix is shared to multiple users
//   final String sharedMessage;

  var isAdmireListGet = false;

  FriendListScreen({
    Key? key,
  }) : super(key: key);

  @override
  _FriendListScreenState createState() => _FriendListScreenState();
}

class _FriendListScreenState extends State<FriendListScreen> {
  List<Map<String, String>> myAllFriends = [];
  List<Map<String, String>> mySearchedFriends = [];
  String searchValue = "";
  UserLIstForChatController userListController =
      Get.put(UserLIstForChatController());

  // String roomId = "";
  late UserDetails userObj;
  bool isLoading = false;

  SignupModel? signupModel;

  var myDB = MyDB();

  @override
  void initState() {
    initiateSignUpModel();
    super.initState();
  }

  setLoading(isLoad) {
    setState(() {
      isLoading = isLoad;
    });
  }

  initiateSignUpModel() async {
    var preferences = MySharedPref();
    signupModel =
        (await preferences.getSignupModel(SharePreData.keySignupModel))!;
    var userId = signupModel?.data?.id?.toInt();
    dynamic body = {'user_id': userId.toString()};
    await userListController.admireListAPI(context, body);
    setState(() {});
  }

  init() async {
    // var preferences = MySharedPref();
    // signupModel =
    // (await preferences.getSignupModel(SharePreData.keySignupModel))!;

    if (!widget.isAdmireListGet) {
      widget.isAdmireListGet = true;

      if (userListController.admireList.isNotEmpty) {

        // setLoading(true);

        for (int i = 0; i < userListController.admireList.length; i++) {
          if (userListController.admireList[i].admireId !=
              signupModel?.data?.id) {
            Map<String, dynamic> receiverData = {
              "id": userListController.admireList[i].admireId.toString(),
              "name": userListController.admireList[i].admireDetails?.fullName
                      .toString() ??
                  userListController.admireList[i].admireDetails?.userName,
              "image":
                  userListController.admireList[i].admireDetails?.image ?? "",
              "email":
                  userListController.admireList[i].admireDetails?.email ?? ""
            };

            var isAvailable = false;
            for (int j = 0; j < myRooms.length; j++) {

              var roomData = myRooms[j].data() as Map<dynamic, dynamic>;

              if (roomData["user"] == userListController.admireList[i].userId) {
                isAvailable = true;


              }
            }
            if (!isAvailable) {
              await shareMix(receiverData, "");
            }
          }
        }
        // setLoading(false);
      }
    }
  }

  Future<void> shareMix(receiverData, message) async {
    String roomId = await initDB(receiverData);
    if (roomId != null && roomId.isNotEmpty) {
      // type 0 = Text, 1 = Image, 2 = pin Id(For Mix Details)
      await MyDB().sendMessageToDB(roomId, 2, message, "", "",
          receiverData["id"].toString(), signupModel!.data!);
    }
  }

  Future<String> initDB(receiverData) async {
    print("ChatBoxView under initDB");
    var value = await MyDB()
        .prepareToSendMessage(receiverData, signupModel!.data!, context);
    print("ChatBoxView under prepareToSendMessage $value");
    String roomId = "";
    if (value != null) {
      roomId = value;
      // setIsLoading(false);
      // var value1 = await MyDB().updateReadStatusOfMessagesSentToMe(
      //     roomId, receiverData["id"].toString(), widget.userObj);
      // print("ChatBoxView under updateReadStatusOfMessagesSentToMe $value1");

      // if (widget.mixId != null) {
      //   await shareMix(receiverData, roomId, widget.sharedMessage);
      // }

    }
    return roomId;

    // await initTypingStatusDB();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        myBody(),
        isLoading
            ? Expanded(child: myLoader())
            : Expanded(
                child: mySearchedFriends.isEmpty
                    ? searchValue.isNotEmpty
                        ? Padding(
                            padding: EdgeInsets.all(50),
                            child: Center(child: noDataWidget()))
                        : signupModel != null
                            ? myConvo2()
                            : initiateSignUpModel()
                    : myAllFriends.isEmpty
                        ? Padding(
                            padding: EdgeInsets.all(50),
                            child: Center(child: noDataWidget()))
                        : searchListColumn())
        // mySearchedFriends.length > 0 ? searchListColumn() : myConvo2(),
      ],
      // ),
    ));
  }

  Widget myLoader() {
    return const Center(
      child:
          SizedBox(height: 50, width: 50, child: CircularProgressIndicator()),
    );
  }

  noDataWidget() {
    return Text(
      "No data available",
      softWrap: true,
      style: TextStyle(
          fontSize: 15.sp,
          fontFamily: AppFont.mediumFont,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          height: 1,
          fontStyle: FontStyle.normal),
    );
  }

  Widget myBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            height: 24.h,
          ), // Conversations

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                "Chats",
                style: TextStyle(
                  color: black,
                  fontWeight: FontWeight.w900,
                  fontFamily: helvetica_neu_bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 22.sp,
                ),
                textAlign: TextAlign.left,
          ),
               Container(
                 width: 48.w,
                 height: 48.h,
                 decoration: BoxDecoration(
                   color: Colors.white,
                   shape: BoxShape.circle,
                   boxShadow: [
                     BoxShadow(
                       color: Color(0x14121212),
                       spreadRadius: 3,
                       blurRadius: 10,
                       offset:  Offset(0, 4), // changes position of shadow
                     ),
                   ],
                 ),
                 child: Padding(
                   padding:  EdgeInsets.all(10.r),
                   child: SvgPicture.asset(icon_plus_chat),
                 ),
               )
             ],
           ),

           SizedBox(
            height: 20.h,
          ),
          // Rectangle 1775

          searchBox(),

           SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  DateTime checkIfDateNull(date) {
    DateTime returnDate = DateTime.now().subtract(Duration(days: 365 * 10));

    if (date != null) {
      returnDate = (date as Timestamp).toDate();
    }

    return returnDate;
  }

  Widget searchListColumn() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(mySearchedFriends.length,
          (index) => friendTile(mySearchedFriends[index])),
      // children: List.generate(100, (index) => Text("Hi $index")),
    );
  }

  List<QueryDocumentSnapshot> myRooms = [];

  Widget myConvo2() {
    return StreamBuilder(
      stream: MyDB().getFriendsList2(signupModel?.data),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: myLoader());
        }

        if (snapshot.hasData) {
          myAllFriends.clear();
          mySearchedFriends.clear();
          myRooms.clear();

          myRooms.addAll(snapshot.data!.docs);

          print("myrooms, get");
          init();
          return handleChatListItem();

          print("Number of total friends: ${myRooms.length}");
        }
        //  else if (myRooms.isNotEmpty) {
        //   return handleChatListItem();
        // }
        else {
          return Container();
        }
      },
    );
  }

  handleChatListItem() {
    //---------_Sorting_-------------
    // Last seen sorting
    myRooms.sort((docA, docB) {
      var a = docA.data() as Map<dynamic, dynamic>;
      var b = docB.data() as Map<dynamic, dynamic>;
      DateTime a1 = DateTime.now();
      DateTime b1 = DateTime.now();
      // if (a["last_seen"] != null && b["last_seen"] != null) {
      //   a1 = checkIfDateNull(a["last_seen"] ?? "");
      //   b1 = checkIfDateNull(b["last_seen"] ?? "");
      // }
      if (a["last_message_time"] != null && b["last_message_time"] != null) {
        a1 = checkIfDateNull(a["last_message_time"] ?? "");
        b1 = checkIfDateNull(b["last_message_time"] ?? "");
      }
      return b1.compareTo(a1);
      // return b["last_seen"].compareTo(a["last_seen"]);
    });
    // Unread messages sorting
    // myRooms.sort((docA, docB) {
    //   var a = docA.data() as Map<dynamic, dynamic>;
    //   var b = docB.data() as Map<dynamic, dynamic>;

    //   return b["unread_message_count"] ??
    //       0.compareTo(a["unread_message_count"] ?? 0);
    // });
    // return Container()

    return ListView.builder(
      // reverse: true,
      // shrinkWrap: true,

      // physics: NeverScrollableScrollPhysics(),
      itemCount: myRooms.length,
      itemBuilder: (BuildContext context, int index) {
        var room = myRooms[index];
        var roomData = room.data() as Map<dynamic, dynamic>;
        print("roomData -->  ${roomData.toString()}");
        String timeDifference = "";

        // if (roomData["last_seen"] != null) {
        //   DateTime sentAt = (roomData["last_seen"] as Timestamp).toDate();
        // if (roomData["last_seen"] != null) {
        if (roomData["last_message_time"] != null) {
          DateTime sentAt =
              (roomData["last_message_time"] as Timestamp).toDate();
          timeDifference =
              calculateTimeDifference(start: sentAt, end: DateTime.now());
          print("--> " + timeDifference);
        }
        print(
            "roomDatatimeStamp ${roomData["last_message_time"]} timeDifference $timeDifference");

        return fetchFriendTile(
            userId: roomData["user"].toString(),
            unreadCount: checkIfNull(roomData["unread_message_count"]),
            lastSeen: checkIfNull(roomData["last_seen"]),
            lastMessage: checkIfNull(
              roomData["last_message"],
            ),
            lastMessageType: checkIfNull(
              roomData["last_message_type"],
            ),
            timeDifference: timeDifference);
      },
    );
  }

  Widget searchBox() {
    return Container(
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.7.r)),
          color: light_grey_f2f2f2),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          SvgPicture.asset(
            light_search_icon,
            width: 15.w,
            height: 15.h,
            color: grey_aaaaaa,
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(6.r),
              child: TextField(
                style: TextStyle(
                  color: txt_color,
                  fontWeight: FontWeight.w500,
                  fontFamily: helveticaNeueNeue_medium,
                  fontStyle: FontStyle.normal,
                  fontSize: 14.sp,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  hintText: "Search Chat",
                  hintStyle: TextStyle(
                    color: grey_aaaaaa,
                    fontWeight: FontWeight.w500,
                    fontFamily: helveticaNeueNeue_medium,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    color: txt_color,
                    fontWeight: FontWeight.w500,
                    fontFamily: helveticaNeueNeue_medium,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.sp,
                  ),
                ),
                keyboardType: TextInputType.text,
                onChanged: onSearchTextChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    // var myText = text.toLowerCase();

    // mySearchedFriends.clear();
    // if (myText.isEmpty) {
    //   setState(() {});
    //   return;
    // }

    // myAllFriends.forEach((user) {
    //   String fname = user["name"];
    //   if (fname.toLowerCase().contains(myText)) mySearchedFriends.add(user);
    // });

    print("Searched friends list: ${mySearchedFriends.length}");

    searchValue = text;
    mySearchedFriends.clear();
    for (int i = 0; i < myAllFriends.length; i++) {
      if (myAllFriends[i]["name"] != null &&
          myAllFriends[i]["name"]!.toLowerCase().contains(text)) {
        mySearchedFriends.add(myAllFriends[i]);
      }
    }
    print("value $text mySearchedFriends.length ${mySearchedFriends.length}");
    setState(() {});

    setState(() {});
  }

  Widget friendTile(Map<String, String> user) {
    bool _isImageAvailable = user["image"]!.isNotEmpty;
    String lastMessageType = user["last_message_type"] ?? "0";
    print("lastMessageType $lastMessageType");

    return GestureDetector(
      onTap: () {
        sendMessageToFriend({
          "id": user["id"].toString(),
          "name": user["name"].toString(),
          "image": user["image"].toString()
        });
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            // boxShadow: [
            //   BoxShadow(
            //       color: Color(0x144343b2),
            //       offset: Offset(0, 0),
            //       blurRadius: 20,
            //       spreadRadius: 2)
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                radius: 26.r,
                backgroundImage: _isImageAvailable
                    ? NetworkImage(user["image"] ?? "")
                    : null,
                backgroundColor: grey_f4f6f6,
                child: _isImageAvailable
                    ? Container()
                    : Icon(
                        Icons.person,
                        size: 30.r,
                      ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user["name"] ?? "",
                      maxLines: 1,
                      style:  TextStyle(
                          color: txt_color,
                          fontWeight: FontWeight.w600,
                          fontFamily: helveticaNeueNeue_medium,
                          fontStyle: FontStyle.normal,
                          fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    if (lastMessageType == "0" || lastMessageType == "1" || lastMessageType == "2")
                      Text(
                        user["last_message"] ?? "",
                        maxLines: 1,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: EdTxtBg,
                          fontSize: 11.sp,
                          fontFamily: helveticaNeueNeue_medium,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    // if (lastMessageType == "1" || lastMessageType == "2")
                    //   Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         // if (lastMessageType == "1")
                    //         Icon(
                    //           Icons.audio_file,
                    //           size: 12,
                    //           color: EdTxtBg,
                    //           // height: 12,
                    //           // width: 12,
                    //         ),
                    //         SizedBox(
                    //           width: 4,
                    //         ),
                    //         Text(
                    //           // lastMessageType == "1" ? "Mix" : "Mix",
                    //           "Mix",
                    //           maxLines: 1,
                    //           style: TextStyle(
                    //             overflow: TextOverflow.ellipsis,
                    //             fontFamily: AppFont.mediumFont,
                    //             fontSize: 12,
                    //             color: EdTxtBg,
                    //             fontWeight: FontWeight.w500,
                    //             fontStyle: FontStyle.normal,
                    //           ),
                    //         ),
                    //       ]),
                  ],
                ),
                flex: 1,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    user["timeStamp"] ?? "",
                    style: TextStyle(
                      fontFamily: helveticaNeueNeue_medium,
                      fontSize: 11.sp,
                      color: grey_aaaaaa,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  user["unread_message_count"]!.isEmpty ||
                          user["unread_message_count"].toString() == "0"
                      ? Container()
                      : Container(
                          height: 21.h,
                          width: 21.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            // borderRadius: BorderRadius.circular(
                            //   25.0,
                            // ),
                          ),
                          child: Center(
                            child: Text(
                              user["unread_message_count"] ?? "",
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontFamily:helveticaNeueNeue_medium,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white),
                            ),
                          ),
                        )
                ],
              )
            ],
          )),
    );
  }

  Widget friendListTile(Map<String, String> user) {
    bool _isImageAvailable = user["image"]!.isNotEmpty;

    return ListTile(
      contentPadding:
          const EdgeInsets.only(top: 8, bottom: 0, left: 16, right: 16),
      leading: CircleAvatar(
        radius: 26.0,
        backgroundImage:
            _isImageAvailable ? NetworkImage(user["image"] ?? "") : null,
        backgroundColor: Colors.transparent,
        child: _isImageAvailable
            ? Container()
            : Icon(
                Icons.person,
                size: 30,
              ),
      ),
      title: Text(
        user["name"] ?? "",
        style: const TextStyle(
            color: white,
            fontWeight: FontWeight.w400,
            fontFamily: AppFont.sfProMediumFont,
            fontStyle: FontStyle.normal,
            fontSize: 13.5),
        textAlign: TextAlign.left,
      ),
      onTap: () => sendMessageToFriend({
        "id": user["id"].toString(),
        "name": user["name"].toString(),
      }),
      trailing: user["unread_message_count"]!.isEmpty ||
              user["unread_message_count"].toString() == "0"
          ? null
          : CircleAvatar(
              child: Text(
                user["unread_message_count"] ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: AppFont.mediumFont,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: Color.fromRGBO(0, 182, 136, 1),
              radius: 12,
            ),
    );
  }

  Widget fetchFriendTile(
      {String? userId,
      String? unreadCount,
      String? lastSeen,
      String? lastMessage,
      String? lastMessageType,
      String? timeDifference}) {
    return FutureBuilder(
      future: MyDB().getParticularUserData(userId ?? ""),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();

          return myLoader();
        }

        if (snapshot.hasData) {
          var userData = snapshot.data?.data() ?? {} as Map;
          print("UserId: ${snapshot.data?.id},\nUser Data: $userData");

          Map<String, String> userMap = {
            "id": checkIfNull(snapshot.data?.id),
            "name": checkIfNull(userData["name"]),
            "image": checkIfNull(userData["image"]),
            "email": checkIfNull(userData["email"]),
            "last_message": lastMessage ?? "",
            "last_message_type": lastMessageType ?? "",
            "unread_message_count": unreadCount ?? "",
            "last_seen": lastSeen ?? "",
            "timeStamp": timeDifference ?? ""
          };

          myAllFriends.add(userMap);

          return friendTile(userMap);
        }
        return Text("Error");
      },
    );
  }

  sendMessageToFriend(Map<String, dynamic> mySnap) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatPage(
            receiver: mySnap,
            userObj: signupModel!.data!,
            message: null,
            mixId: null),
      ),
    );
  }

  String checkIfNull(v) {
    if (v == null) {
      return "";
    } else {
      return v.toString();
    }
  }

// Widget myLoader() {
//   return Container(
//     width: 50,
//     child: Center(child: CircularProgressIndicator.adaptive()),
//     margin: EdgeInsets.symmetric(vertical: 5),
//   );
// }
}

/*Widget myConvo() {
    List<Map<String, String>> myList = mySearchedFriends.isEmpty ? myAllFriends : mySearchedFriends;
    return _isLoading
        ? Center(child: CircularProgressIndicator.adaptive())
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: myList.length,
            itemBuilder: (ctx, index) => friendTile(myList[index]),
          );
  }*/
