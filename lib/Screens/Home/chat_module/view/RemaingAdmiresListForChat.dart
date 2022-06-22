import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/ReplaceWith.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../../../../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../../../../Utils/preference_utils.dart';
import '../chat_page.dart';
import '../my_db.dart';

class RemaingAdmiresListForChat extends StatefulWidget {
  final List<AdmireList> admireList;

  const RemaingAdmiresListForChat({Key? key, required this.admireList})
      : super(key: key);

  @override
  State<RemaingAdmiresListForChat> createState() =>
      _RemaingAdmiresListForChatState();
}

class _RemaingAdmiresListForChatState extends State<RemaingAdmiresListForChat> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  int userId = 0;
  SignupModel? signupModel;

  var isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    var preferences = MySharedPref();
    signupModel = await preferences.getSignupModel(SharePreData.keySignupModel);
    userId = signupModel!.data!.id!.toInt();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          ToolbarWithHeaderCenterTitle("Select Admires"),
          SizedBox(
            height: 20.h,
          ),

          Expanded(
            child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0),
                        itemCount: widget.admireList.length,
                        itemBuilder: (context, i) => Material(
                          color: white,
                          child: GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: widget.admireList.isNotEmpty
                                            ? widget.admireList[i].admireDetails
                                            ?.image ==
                                            null
                                            ? SvgPicture.asset(
                                          placeholder,
                                          height: 40.h,
                                          width: 40.w,
                                          fit: BoxFit.cover,
                                        )
                                            : CachedNetworkImage(
                                          imageUrl: widget.admireList[i]
                                              .admireDetails!.image!,
                                          height: 40.h,
                                          width: 40.w,
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder:
                                              (context, url,
                                              downloadProgress) =>
                                              SvgPicture.asset(
                                                placeholder,
                                                height: 40.h,
                                                width: 40.w,
                                                fit: BoxFit.cover,
                                              ),
                                          errorWidget:
                                              (context, url, error) =>
                                              SvgPicture.asset(
                                                placeholder,
                                                height: 40.h,
                                                width: 40.w,
                                                fit: BoxFit.cover,
                                              ),
                                        )
                                            : SvgPicture.asset(
                                          placeholder,
                                          height: 40.h,
                                          width: 40.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            // claireroman
                                            Text(
                                                widget.admireList[i].admireDetails
                                                    ?.userName !=
                                                    null
                                                    ? widget.admireList[i]
                                                    .admireDetails!.userName!
                                                    : "",
                                                style: TextStyle(
                                                    color: grey_aaaaaa,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                    helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            // Claire Roman
                                            Text(
                                                widget.admireList[i].admireDetails
                                                    ?.firstName !=
                                                    null
                                                    ? (widget
                                                    .admireList[i]
                                                    ?.admireDetails
                                                    ?.firstName
                                                    ?.capitalizeFirst ??
                                                    "") +
                                                    " " +
                                                    (widget
                                                        .admireList[i]
                                                        ?.admireDetails
                                                        ?.lastName
                                                        ?.capitalizeFirst ??
                                                        "")
                                                    : "",
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily:
                                                    helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left)
                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Map<String, dynamic> receiverData = {
                                            "id": widget.admireList[i].admireId
                                                .toString(),
                                            "name": widget.admireList[i]
                                                .admireDetails?.fullName
                                                .toString() ??
                                                widget.admireList[i].admireDetails
                                                    ?.userName,
                                            "image": widget.admireList[i]
                                                .admireDetails?.image ??
                                                "",
                                            "email": widget.admireList[i]
                                                .admireDetails?.email ??
                                                ""
                                          };

                                          isLoading = true;
                                          shareMix(receiverData, "");
                                          setState(() {});
                                        },
                                        child: SvgPicture.asset(
                                          add_icon,
                                          width: 25.w,
                                          height: 25.h,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      isLoading == true
                          ? Container(height: MediaQuery.of(context).size.height * 0.75,child: Center(child: CircularProgressIndicator(color: black, strokeWidth: 2,),)):SizedBox()
                    ],
                  ),
                ),
          ),
        ],
      ),
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

  Future<void> shareMix(receiverData, message) async {
    String roomId = await initDB(receiverData);
    if (roomId != null && roomId.isNotEmpty) {
      // type 0 = Text, 1 = Image, 2 = pin Id(For Mix Details)
      await MyDB().sendMessageToDB(roomId, 2, message, "", "",
          receiverData["id"].toString(), signupModel!.data!);

      Navigator.pop(context);
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
}
