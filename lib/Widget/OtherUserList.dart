import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/UserListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/Profile.dart';
import 'package:blackchecktech/Screens/Home/Settings/view/ProfileSetting.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/CreateBottomSheet.dart';
import 'package:blackchecktech/Widget/ReportBottomSheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OtherUserList extends StatefulWidget {
  UserList otherUser;
  OtherUserList(this.otherUser);

  @override
  State<OtherUserList> createState() => _OtherUserListState();
}

class _OtherUserListState extends State<OtherUserList> {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
        checkNet(context)
            .then((value) => controller.admireProfileAPI(
                context, widget.otherUser.id, null, 'transaction'))
            .then(
              (value) => Get.to(Profile(),
                  duration: Duration(milliseconds: 500),
                  transition: Transition.downToUp),
            );
      },
      child: Stack(
        children: [
          widget.otherUser.image == null
              ? SvgPicture.asset(
                  placeholder,
                  height: MediaQuery.of(context).size.height * .83,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : CachedNetworkImage(
                  imageUrl: widget.otherUser.image!,
                  // widget.admireList.admireDetails!.image!,
                  height: MediaQuery.of(context).size.height * .83,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SvgPicture.asset(
                    placeholder,
                    height: MediaQuery.of(context).size.height * .83,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => SvgPicture.asset(
                    placeholder,
                    height: MediaQuery.of(context).size.height * .83,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
          Container(
            color: Colors.black.withOpacity(0.3),
            height: MediaQuery.of(context).size.height * .83,
          ),

          Padding(
            padding: EdgeInsets.only(top: 60.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  height: MediaQuery.of(context).size.width * 0.068,
                  child: FittedBox(
                    child: setHelceticaBold(
                        widget.otherUser.userName != null
                            ? widget.otherUser.userName!.replaceAll('@', '')
                            : widget.otherUser.firstName!,
                        20.sp,
                        white_ffffff,
                        FontWeight.w600,
                        FontStyle.normal,
                        -0.8),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .52),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      height: MediaQuery.of(context).size.width * 0.13,
                      child: FittedBox(
                        child: setInterExtraBold(
                            widget.otherUser.firstName != null &&
                                    widget.otherUser.lastName != null
                                ? widget.otherUser.firstName!.toUpperCase() +
                                    " " +
                                    widget.otherUser.lastName!.toUpperCase()
                                : widget.otherUser.firstName != null
                                    ? widget.otherUser.firstName!.toUpperCase()
                                    : widget.otherUser.lastName != null
                                        ? widget.otherUser.lastName!
                                            .toUpperCase()
                                        : "",
                            40.sp,
                            white_ffffff,
                            FontWeight.w600,
                            FontStyle.normal,
                            -1.6),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.otherUser.currentJobs != null
                            ? widget.otherUser.currentJobs!.title != null &&
                                    widget.otherUser.currentJobs!.companyName !=
                                        null
                                ? "${widget.otherUser.currentJobs!.title!.toUpperCase()} - ${widget.otherUser.currentJobs!.companyName!.toUpperCase()}"
                                // widget.otherUser.currentJobs!
                                //     .companyName!
                                //     .toUpperCase()
                                : widget.otherUser.currentJobs!.title != null
                                    ? widget.otherUser.currentJobs!.title!
                                        .toUpperCase()
                                    : widget.otherUser.currentJobs!
                                                .companyName !=
                                            null
                                        ? widget
                                            .otherUser.currentJobs!.companyName!
                                            .toUpperCase()
                                        : ""
                            : "",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: interMedium,
                          fontWeight: FontWeight.w600,
                          color: Colors.white60,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 6.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Padding(
          //   padding:  EdgeInsets.only(left: 24.w, right: 24.w),
          //   child: Column(
          //     children: [
          //       SizedBox(
          //         height: MediaQuery.of(context).size.height * .69,
          //       ),
          //       GestureDetector(
          //         onTap: (){
          //           // var preferences = MySharedPref();
          //           // SignupModel? modelM =
          //           //     await preferences.getSignupModel(SharePreData.keySignupModel);

          //           // if (modelM!.data!.id == widget.admireList.admireId) {
          //             // controller.userProfileAPI(context);
          //           // }
          //           //  else {
          //             setState(() {});
          //             controller.admireProfileAPI(
          //               context, widget.otherUser.id
          //             );
          //           // }
          //         },
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Container(
          //               decoration: BoxDecoration(
          //                 borderRadius:
          //                     BorderRadius.circular(4.r),
          //                 color: grey_94ffffff,
          //               ),
          //               child: Padding(
          //                 padding:  EdgeInsets.only(top: 8.h, bottom: 8.h, left: 16.w, right: 16.w),
          //                 child: setHelveticaMedium(
          //                     'View Profile',
          //                     16.sp,
          //                     black_121212,
          //                     FontWeight.w500,
          //                     FontStyle.normal),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .76,
                  // height: MediaQuery.of(context).size.height * .69,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.otherUser.cityDetails != null
                        ? const Icon(
                            Icons.location_on,
                            size: 12,
                            color: orange_ff881a,
                          )
                        : Container(),
                    setInterRegular(
                      widget.otherUser.cityDetails != null
                          ?
                          //  widget.otherUser.cityDetails!.name! +
                          //     ', ' +
                          widget.otherUser.stateDetails!.name! +
                              ', ' +
                              widget.otherUser.countryDetails!.name!
                          : "",
                      10.sp,
                      Colors.white70,
                      FontWeight.w600,
                      FontStyle.normal,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
