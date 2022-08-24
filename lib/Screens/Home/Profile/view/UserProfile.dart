// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/Profile.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/SeeAllAdmires.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/AdmireProfileList.dart';
import 'package:blackchecktech/Widget/AllAdmireList.dart';
import 'package:blackchecktech/Widget/OtherUserList.dart';
import 'package:blackchecktech/Widget/ReportBottomSheet.dart';
import 'package:blackchecktech/Widget/UserProfileDetail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../Utilities/Constant.dart';
import '../../../../Widget/CreateBottomSheet.dart';
import 'SelectedUserProfile.dart';

// class UserProfile extends StatefulWidget {

//   final String selectedUserId;
//   const UserProfile({Key? key, required this.selectedUserId,
//   }) : super(key: key);

//   @override
//   State<UserProfile> createState() => _UserProfileState();
// }

// class _UserProfileState extends State<UserProfile> {
//   AdmireProfileController controller = Get.put(AdmireProfileController());
//   VideoController videoController = Get.put(VideoController());
//   PageController pageController = PageController();
//   List<Widget>? list;
//   bool hadReachedEnd = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     checkNet(context).then(
//       (value) {
//         videoController.userListAPI(context, widget.selectedUserId);
//         dynamic body = {'user_id': widget.selectedUserId};
//         controller.admireListAPI(context, body);
//       },
//     );
//     controller.addListener(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: white_ffffff,
//       body: Obx(
//         () => videoController.userList.isEmpty
//             ? SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.75,
//                 child: Center(
//                   child: CircularProgressIndicator(
//                     color: black,
//                     strokeWidth: 2
//                   )
//                 ),
//               )
//             : Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Expanded(
//                     child:

//                     Stack(
//                       children: [
//                         controller.details.value.image == null
//                             ? SvgPicture.asset(
//                           placeholder,
//                           height: controller.otherAdmireList.isEmpty ?  MediaQuery.of(context).size.height :  MediaQuery.of(context).size.height * .83,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         )
//                             : CachedNetworkImage(
//                           imageUrl: controller.details.value.image??"",
//                           // widget.admireList.admireDetails!.image!,
//                           height: controller.otherAdmireList.isEmpty ?  MediaQuery.of(context).size.height :  MediaQuery.of(context).size.height * .83,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                           progressIndicatorBuilder: (context, url, downloadProgress) =>
//                               SvgPicture.asset(
//                                 placeholder,
//                                 height: controller.otherAdmireList.isEmpty ?  MediaQuery.of(context).size.height : MediaQuery.of(context).size.height * .83,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                           errorWidget: (context, url, error) => SvgPicture.asset(
//                             placeholder,
//                             height: controller.otherAdmireList.isEmpty ?  MediaQuery.of(context).size.height :  MediaQuery.of(context).size.height * .83,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Container(
//                           color: Colors.black.withOpacity(0.3),
//                           height: controller.otherAdmireList.isEmpty ?  MediaQuery.of(context).size.height :  MediaQuery.of(context).size.height * .83,
//                         ),
//                         Padding(
//                           padding:  EdgeInsets.only(left: 24.w,top: 50.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               GestureDetector(
//                                   onTap: () {
//                                     Get.back();
//                                   },
//                                   child: SvgPicture.asset(
//                                     icon_back_black_arrow,
//                                     width: 24.w,
//                                     height: 24.h,
//                                     color: white_ffffff,
//                                   )),
//                               const Spacer(),
//                               GestureDetector(
//                                   onTap: () {
//                                     createBottomSheet(context, controller.details.value.id);
//                                   },
//                                   child:
//                                   // userId == widget.admireList.admireDetails!.id ?
//                                   Container(
//                                       height: 48.h,
//                                       width: 48.w,
//                                       child: Padding(
//                                         padding:  EdgeInsets.all(10.r),
//                                         child: SvgPicture.asset(
//                                           add_icon,width: 24.w,height: 24.h,),
//                                       ))
//                                 // : Container(
//                                 //     height: 48,
//                                 //     width: 48,
//                                 //   )
//                               ),

//                               GestureDetector(
//                                   onTap: () {
//                                     // Get.to(ProfileSetting());
//                                   },
//                                   child:
//                                   // userId == widget.admireList.admireDetails!.id ?
//                                   SvgPicture.asset(
//                                     settings_icon,
//                                     height: 48.h,
//                                     width: 48.w,
//                                   )
//                                 // : GestureDetector(
//                                 //     onTap: () {
//                                 //       displayBottomSheet(context);
//                                 //     },
//                                 //     child: Container(
//                                 //       height: 48,
//                                 //       width: 48,
//                                 //       child: Icon(Icons.more_horiz, color: Colors.white),
//                                 //     ),
//                                 //   ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding:  EdgeInsets.only(top: 60.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width * 0.50,
//                                 height: MediaQuery.of(context).size.width * 0.068,
//                                 child: FittedBox(
//                                   child: setHelceticaBold(
//                                     // widget.admireList.admireDetails!.userName != null
//                                     //     ? "@" + widget.admireList.admireDetails!.userName!
//                                     //     : "@" + widget.admireList.admireDetails!.firstName!,
//                                       controller.details.value.userName != null
//                                           ? "@" + (controller.details.value.userName??"")
//                                           : "@" + (controller.details.value.firstName??""),
//                                       20.sp,
//                                       white_ffffff,
//                                       FontWeight.w600,
//                                       FontStyle.normal,
//                                       -0.8),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding:  EdgeInsets.only(left: 24.w, right: 24.w),
//                           child: Column(
//                             children: [
//                               SizedBox(height: MediaQuery.of(context).size.height * .52),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(
//                                     width: MediaQuery.of(context).size.width * 0.80,
//                                     height: MediaQuery.of(context).size.width * 0.10,
//                                     child: FittedBox(
//                                       child: setHelceticaBold(
//                                         // widget.admireList.admireDetails!.fullName != null
//                                         //     ? widget.admireList.admireDetails!.fullName!
//                                         //         .toUpperCase()
//                                         //     : "",
//                                           controller.details.value.fullName??""
//                                               .toUpperCase()
//                                           ,
//                                           40.sp,
//                                           white_ffffff,
//                                           FontWeight.w600,
//                                           FontStyle.normal,
//                                           -1.6),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 24.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Expanded(
//                                     child: Text(
//                                       // widget.admireList.admireDetails!.currentJobs != null
//                                       //     ? widget.admireList.admireDetails!.currentJobs!.title!
//                                       //             .toUpperCase() +
//                                       //         ' - ' +
//                                       //         widget.admireList.admireDetails!.currentJobs!
//                                       //             .companyName!
//                                       //             .toUpperCase()
//                                       //     : "",
//                                       controller.details.value.currentJobs != null
//                                           ? controller.details.value.currentJobs!.title!
//                                           .toUpperCase() +
//                                           ' - ' +
//                                           controller.details.value.currentJobs!
//                                               .companyName!
//                                               .toUpperCase()
//                                           : "",
//                                       softWrap: true,
//                                       textAlign: TextAlign.center,
//                                       style:  TextStyle(
//                                         fontSize: 16.sp,
//                                         fontFamily: helveticaNeueNeue_medium,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.white70,
//                                         fontStyle: FontStyle.normal,
//                                         letterSpacing: 6.4,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding:  EdgeInsets.only(left: 24.w, right: 24.w),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: MediaQuery.of(context).size.height * .69,
//                               ),
//                               GestureDetector(
//                                 onTap: (){
//                                   // var preferences = MySharedPref();
//                                   // SignupModel? modelM =
//                                   //     await preferences.getSignupModel(SharePreData.keySignupModel);

//                                   // if (modelM!.data!.id == widget.admireList.admireId) {
//                                   //   controller.userProfileAPI(context);

//                                   // Get.to(SelectedUserProfile(userDetails: controller.details.value));

//                                   // }
//                                   //  else {
//                                   controller.admireProfileAPI(
//                                     context, controller.details.value.id
//                                   );
//                                   // }

//                                 },
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                         BorderRadius.circular(4.r),
//                                         color: grey_94ffffff,
//                                       ),
//                                       child: Padding(
//                                         padding:  EdgeInsets.only(top: 8.h, bottom: 8.h, left: 16.w, right: 16.w),
//                                         child: setHelveticaMedium(
//                                             'View Profile',
//                                             16.sp,
//                                             black_121212,
//                                             FontWeight.w500,
//                                             FontStyle.normal),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding:  EdgeInsets.only(left: 24.w, right: 24.w),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: MediaQuery.of(context).size.height * .76,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   // widget.admireList.admireDetails!.cityDetails != null
//                                   controller.details.value.cityDetails != null
//                                       ? const Icon(
//                                     Icons.location_on,
//                                     size: 12,
//                                     color: orange_ff881a,
//                                   )
//                                       : Container(),
//                                   setHelveticaMedium(
//                                     // widget.admireList.admireDetails!.cityDetails != null
//                                     //     ? widget.admireList.admireDetails!.cityDetails!.name! +
//                                     //         ', ' +
//                                     //         widget
//                                     //             .admireList.admireDetails!.stateDetails!.name! +
//                                     //         ', ' +
//                                     //         widget
//                                     //             .admireList.admireDetails!.countryDetails!.name!
//                                     //     : "",
//                                     controller.details.value.cityDetails != null
//                                         ? controller.details.value.cityDetails!.name! +
//                                         ', ' +
//                                         controller.details.value.stateDetails!.name! +
//                                         ', ' +
//                                         controller.details.value.countryDetails!.name!
//                                         : "",
//                                     10.sp,
//                                     Colors.white70,
//                                     FontWeight.w600,
//                                     FontStyle.normal,
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),

//                     // Stack(
//                     //   children: [
//                     //     PageView.builder(
//                     //         physics: const NeverScrollableScrollPhysics(),
//                     //         controller: pageController,
//                     //         itemCount: 1,
//                     //         onPageChanged: (v) {
//                     //           // if (v == controller.admireList.length - 1) {
//                     //           //   hadReachedEnd = true;
//                     //           // }
//                     //         },
//                     //         itemBuilder: (BuildContext context, int index) {
//                     //           return UserProfileDetails(
//                     //               userDetails: controller.details.value);
//                     //         }),
//                     //     // Padding(
//                     //     //   padding:
//                     //     //       const EdgeInsets.only(left: 15.0, right: 15.0),
//                     //     //   child: Center(
//                     //     //     child: Row(
//                     //     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     //     //       children: [
//                     //     //         GestureDetector(
//                     //     //           onTap: () {
//                     //     //             pageController.previousPage(
//                     //     //                 duration: Duration(milliseconds: 300),
//                     //     //                 curve: Curves.fastOutSlowIn);
//                     //     //           },
//                     //     //           child: Container(
//                     //     //             height: 80,
//                     //     //             width: 50,
//                     //     //             decoration: BoxDecoration(
//                     //     //               borderRadius: BorderRadius.circular(5.0),
//                     //     //               color: white_ffffff,
//                     //     //             ),
//                     //     //             child: Icon(
//                     //     //               Icons.arrow_back,
//                     //     //               color: grey_aaaaaa,
//                     //     //               size: 35,
//                     //     //             ),
//                     //     //           ),
//                     //     //         ),
//                     //     //         GestureDetector(
//                     //     //           onTap: () {
//                     //     //             if (hadReachedEnd == true) {
//                     //     //               pageController.jumpToPage(0);
//                     //     //               hadReachedEnd = false;
//                     //     //             } else {
//                     //     //               pageController.nextPage(
//                     //     //                   duration: Duration(milliseconds: 300),
//                     //     //                   curve: Curves.fastOutSlowIn);
//                     //     //             }
//                     //     //           },
//                     //     //           child: Container(
//                     //     //             height: 80,
//                     //     //             width: 50,
//                     //     //             decoration: BoxDecoration(
//                     //     //               borderRadius: BorderRadius.circular(5.0),
//                     //     //               color: white_ffffff,
//                     //     //             ),
//                     //     //             child: Icon(
//                     //     //               Icons.arrow_forward,
//                     //     //               color: grey_aaaaaa,
//                     //     //               size: 35,
//                     //     //             ),
//                     //     //           ),
//                     //     //         )
//                     //     //       ],
//                     //     //     ),
//                     //     //   ),
//                     //     // )
//                     //   ],
//                     // ),
//                   ),
// controller.otherAdmireList.isEmpty ?  Container() :
// Padding(
//   padding:  EdgeInsets.only(left: 24.w, right: 24.w),
//   child: Row(
//     children: [
//       setHelceticaBold(
//           '${controller.details.value.firstName.toString().capitalizeFirst} Admires',
//           14.sp,
//           black_121212,
//           FontWeight.w500,
//           FontStyle.normal,
//           -0.28),
//       const Spacer(),
//       GestureDetector(
//         onTap: () {
//           Get.to( SeeAllAdmires(type: 'other'));
//         },
//         child: setHelveticaMedium('See More', 12.sp, grey_aaaaaa,
//             FontWeight.w500, FontStyle.normal, -0.24),
//       ),
//        SizedBox(
//         width: 5.w,
//       ),
//       const Icon(
//         Icons.arrow_forward,
//         color: grey_aaaaaa,
//         size: 12,
//       )
//     ],
//   ),
// ),
// controller.otherAdmireList.isEmpty ?  Container() :
// Padding(
//   padding:
//        EdgeInsets.only( top: 16.h),
//   child: SizedBox(
//     height: MediaQuery.of(context).size.height * 0.11,
//     width: double.infinity,
//     child: ListView.separated(
//       primary: false,
//       shrinkWrap: true,
//       separatorBuilder: (context, index) => SizedBox(
//         width: 16.w,
//       ),
//       padding: EdgeInsets.only(left: 24.w, right: 24.w,),
//       scrollDirection: Axis.horizontal,
//       itemCount: controller.otherAdmireList.length,
//       itemBuilder: ((context, index) {
//         return Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircularProfileAvatar(
//               '',
//               radius: 24,
//               child: controller.otherAdmireList[index]
//                           .admireDetails!.image ==
//                       null
//                   ? SvgPicture.asset(
//                       placeholder,
//                       height: 48.h,
//                       width: 48.w,
//                     )
//                   : CachedNetworkImage(
//                       imageUrl: controller
//                           .otherAdmireList[index]
//                           .admireDetails!
//                           .image!,
//                 height: 48.h,
//                 width: 48.w,
//                       fit: BoxFit.cover,
//                       progressIndicatorBuilder: (context,
//                               url, downloadProgress) =>
//                           SvgPicture.asset(
//                         placeholder,
//                             height: 48.h,
//                             width: 48.w,
//                       ),
//                       errorWidget: (context, url, error) =>
//                           SvgPicture.asset(
//                         placeholder,
//                             height: 48.h,
//                             width: 48.w,
//                       ),
//                     ),
//             ),
//              SizedBox(
//               height: 4.h,
//             ),
//             setHelveticaMedium(
//                 controller.otherAdmireList[index]
//                         .admireDetails!.firstName ??
//                     "",
//                 12.sp,
//                 black_121212,
//                 FontWeight.w500,
//                 FontStyle.normal,
//                 -0.24),
//           ],
//         );
//       }),
//     ),
//   ),
// )
//                 ],
//               ),
//       ),
//     );
//   }
// }

class UserProfile extends StatefulWidget {
  final String selectedUserId;
  final isFrom;
  final index;
  const UserProfile(
      {Key? key,
      required this.selectedUserId,
      required this.isFrom,
      this.index})
      : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  VideoController videoController = Get.put(VideoController());
  PageController pageController = PageController();
  List<Widget>? list;
  bool hadReachedEnd = false;
  int i = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Page No ::" + widget.index.toString());
    checkNet(context).then(
      (value) {
        if (widget.index != null) {
          i = widget.index;
        }
        videoController.PageNumber.value = i;
        // videoController.userListAPI(context, false, widget.selectedUserId);
        videoController.userListAPI(context, false);
        controller.admireListAPI(context, widget.selectedUserId);
        checkNet(context).then((value) => controller.admireProfileAPI(
            context, widget.selectedUserId, null, 'transaction'));
      },
    );
    pageController = PageController(initialPage: widget.index);
    controller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => videoController.userList.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                    child: CircularProgressIndicator(
                        color: black, strokeWidth: 2)),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  videoController.userList.isEmpty
                      ? Container()
                      : Expanded(
                          child: Stack(
                            children: [
                              PageView.builder(
                                  onPageChanged: (index) {
                                    setState(() {
                                      i = index;
                                    });
                                    print("Page No :: " +
                                        i.toString() +
                                        " :: " +
                                        videoController.userList[i].userName
                                            .toString());
                                    controller.admireListAPI(
                                        context,
                                        videoController.userList[i].id
                                            .toString());
                                    checkNet(context).then((value) =>
                                        controller.admireProfileAPI(
                                            context,
                                            videoController.userList[i].id,
                                            null,
                                            'transaction'));
                                    //   return;
                                    // } else if (dragEndDetails
                                    //         .velocity.pixelsPerSecond.dx <
                                    //     1) {
                                    //   setState(() {
                                    //     if (i <=
                                    //         videoController.userList.length) {
                                    //       i++; //right swipe
                                    //       controller.admireListAPI(
                                    //           context,
                                    //           videoController.userList[i].id
                                    //               .toString());
                                    //       checkNet(context).then((value) =>
                                    //           controller.admireProfileAPI(
                                    //               context,
                                    //               videoController
                                    //                   .userList[i].id,
                                    //               null,
                                    //               'transaction'));
                                    //       return;
                                    //     }
                                    //   });
                                    // } else {
                                    //   setState(() {
                                    //     if (i != 0) {
                                    //       i--; //left swipe
                                    //       controller.admireListAPI(
                                    //           context,
                                    //           videoController.userList[i].id
                                    //               .toString());
                                    //       checkNet(context).then((value) =>
                                    //           controller.admireProfileAPI(
                                    //               context,
                                    //               videoController
                                    //                   .userList[i].id,
                                    //               null,
                                    //               'transaction'));
                                    //       return;
                                    //     }
                                    //   });
                                    // }
                                  },
                                  //  physics: const NeverScrollableScrollPhysics(),
                                  controller: pageController,
                                  itemCount: videoController.userList.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {});
                                        checkNet(context)
                                            .then((value) =>
                                                controller.admireProfileAPI(
                                                    context,
                                                    videoController
                                                        .userList[index].id,
                                                    null,
                                                    'transaction'))
                                            .then(
                                              (value) => Get.to(Profile(),
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  transition:
                                                      Transition.downToUp),
                                            );
                                      },
                                      child: Stack(
                                        children: [
                                          videoController
                                                      .userList[index].image ==
                                                  null
                                              ? SvgPicture.asset(
                                                  placeholder,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .83,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                )
                                              : CachedNetworkImage(
                                                  imageUrl: videoController
                                                      .userList[index].image!,
                                                  // widget.admireList.admireDetails!.image!,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .83,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              downloadProgress) =>
                                                          SvgPicture.asset(
                                                    placeholder,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .83,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          SvgPicture.asset(
                                                    placeholder,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .83,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                          Container(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .83,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 60.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.50,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.068,
                                                  child: FittedBox(
                                                    child: setHelceticaBold(
                                                        videoController
                                                                    .userList[
                                                                        index]
                                                                    .userName !=
                                                                null
                                                            ? videoController
                                                                .userList[index]
                                                                .userName!
                                                                .replaceAll(
                                                                    '@', '')
                                                            : videoController
                                                                .userList[index]
                                                                .firstName!,
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
                                            padding: EdgeInsets.only(
                                                left: 24.w, right: 24.w),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            .52),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.80,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.13,
                                                      child: FittedBox(
                                                        child:
                                                            setInterExtraBold(
                                                                videoController.userList[index].firstName !=
                                                                            null &&
                                                                        videoController.userList[index].lastName !=
                                                                            null
                                                                    ? videoController
                                                                            .userList[
                                                                                index]
                                                                            .firstName!
                                                                            .toUpperCase() +
                                                                        " " +
                                                                        videoController
                                                                            .userList[
                                                                                index]
                                                                            .lastName!
                                                                            .toUpperCase()
                                                                    : videoController.userList[index].firstName !=
                                                                            null
                                                                        ? videoController
                                                                            .userList[
                                                                                index]
                                                                            .firstName!
                                                                            .toUpperCase()
                                                                        : videoController.userList[index].lastName !=
                                                                                null
                                                                            ? videoController.userList[index].lastName!
                                                                                .toUpperCase()
                                                                            : "",
                                                                40.sp,
                                                                white_ffffff,
                                                                FontWeight.w600,
                                                                FontStyle
                                                                    .normal,
                                                                -1.6),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 24.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        videoController
                                                                    .userList[
                                                                        index]
                                                                    .currentJobs !=
                                                                null
                                                            ? videoController
                                                                            .userList[
                                                                                index]
                                                                            .currentJobs!
                                                                            .title !=
                                                                        null &&
                                                                    videoController
                                                                            .userList[
                                                                                index]
                                                                            .currentJobs!
                                                                            .companyName !=
                                                                        null
                                                                ? "${videoController.userList[index].currentJobs!.title!.toUpperCase()} - ${videoController.userList[index].currentJobs!.companyName!.toUpperCase()}"
                                                                // widget.otherUser.currentJobs!
                                                                //     .companyName!
                                                                //     .toUpperCase()
                                                                : videoController
                                                                            .userList[
                                                                                index]
                                                                            .currentJobs!
                                                                            .title !=
                                                                        null
                                                                    ? videoController
                                                                        .userList[
                                                                            index]
                                                                        .currentJobs!
                                                                        .title!
                                                                        .toUpperCase()
                                                                    : videoController.userList[index].currentJobs!.companyName !=
                                                                            null
                                                                        ? videoController
                                                                            .userList[index]
                                                                            .currentJobs!
                                                                            .companyName!
                                                                            .toUpperCase()
                                                                        : ""
                                                            : "",
                                                        softWrap: true,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontFamily:
                                                              interMedium,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white60,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          letterSpacing: 6.4,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 24.w, right: 24.w),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .76,
                                                  // height: MediaQuery.of(context).size.height * .69,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    videoController
                                                                .userList[index]
                                                                .cityDetails !=
                                                            null
                                                        ? const Icon(
                                                            Icons.location_on,
                                                            size: 12,
                                                            color:
                                                                orange_ff881a,
                                                          )
                                                        : Container(),
                                                    setInterRegular(
                                                      videoController
                                                                  .userList[
                                                                      index]
                                                                  .cityDetails !=
                                                              null
                                                          ?
                                                          //  widget.otherUser.cityDetails!.name! +
                                                          //     ', ' +
                                                          videoController
                                                                  .userList[
                                                                      index]
                                                                  .stateDetails!
                                                                  .name! +
                                                              ', ' +
                                                              videoController
                                                                  .userList[
                                                                      index]
                                                                  .countryDetails!
                                                                  .name!
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
                                  }),
                              Padding(
                                padding: EdgeInsets.only(left: 24.w, top: 50.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: SvgPicture.asset(
                                          icon_back_black_arrow,
                                          width: 24.w,
                                          height: 24.h,
                                          color: white_ffffff,
                                        )),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        displayBottomSheet(context,
                                            videoController.userList[i].id);
                                      },
                                      child: Container(
                                        height: 48,
                                        width: 48,
                                        child: Icon(Icons.more_horiz,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       left: 15.0, right: 15.0),
                              //   child: Center(
                              //     child: Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         widget.isFrom == true
                              //             ? Container()
                              //             : GestureDetector(
                              //                 onTap: () {
                              //                   // if (index > 0) {
                              //                     // index--;
                              //                     // dynamic body = {'user_id': videoController.userList[index].id.toString()};
                              //                     controller.admireListAPI(
                              //                         context,
                              //                         videoController
                              //                             .userList[index].id
                              //                             .toString());
                              //                   // }
                              //                   pageController.previousPage(
                              //                       duration: Duration(
                              //                           milliseconds: 300),
                              //                       curve:
                              //                           Curves.fastOutSlowIn);
                              //                 },
                              //                 child: Container(
                              //                   decoration: BoxDecoration(
                              //                     borderRadius:
                              //                         BorderRadius.circular(
                              //                             4.0),
                              //                     color: grey_94ffffff,
                              //                   ),
                              //                   child: Padding(
                              //                     padding: EdgeInsets.only(
                              //                         left: 6.w,
                              //                         right: 6.w,
                              //                         top: 16.h,
                              //                         bottom: 16.h),
                              //                     child: Icon(
                              //                       Icons
                              //                           .arrow_back_ios_new_rounded,
                              //                       color: black,
                              //                       size: 21,
                              //                     ),
                              //                   ),
                              //                 ),
                              //               ),
                              //         widget.isFrom == true
                              //             ? Container()
                              //             : GestureDetector(
                              //                 onTap: () {
                              //                   if (index + 1 == videoController.userList.length) {
                              //                     pageController.jumpToPage(0);
                              //                     // dynamic body = {'user_id': widget.selectedUserId.toString()};
                              //                     controller.admireListAPI(
                              //                         context,
                              //                         widget.selectedUserId
                              //                             .toString());
                              //                   } else {
                              //                     // if (index !=
                              //                     //     videoController
                              //                     //         .userList.length) {
                              //                     //   index++;
                              //                       // dynamic body = {'user_id': videoController.userList[index].id.toString()};
                              //                       controller.admireListAPI(
                              //                           context,
                              //                           videoController
                              //                               .userList[index].id
                              //                               .toString());
                              //                       pageController.nextPage(
                              //                           duration: Duration(
                              //                               milliseconds: 300),
                              //                           curve: Curves
                              //                               .fastOutSlowIn);
                              //                     // }
                              //                   }
                              //                 },
                              //                 child: Container(
                              //                   decoration: BoxDecoration(
                              //                     borderRadius:
                              //                         BorderRadius.circular(
                              //                             4.0),
                              //                     color: grey_94ffffff,
                              //                   ),
                              //                   child: Padding(
                              //                     padding: EdgeInsets.only(
                              //                         left: 6.w,
                              //                         right: 6.w,
                              //                         top: 16.h,
                              //                         bottom: 16.h),
                              //                     child: Icon(
                              //                       Icons
                              //                           .arrow_forward_ios_rounded,
                              //                       color: black,
                              //                       size: 21,
                              //                     ),
                              //                   ),
                              //                 ),
                              //               )
                              //       ],
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                  GestureDetector(
                    onVerticalDragStart: (val) {
                      Get.to(Profile(),
                          duration: Duration(milliseconds: 500),
                          transition: Transition.downToUp);
                    },
                    child: Container(
                      color: white,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w, right: 24.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                setHelceticaBold(
                                    '${videoController.userList[i].firstName.toString().capitalizeFirst} Admires',
                                    14.sp,
                                    black_121212,
                                    FontWeight.w500,
                                    FontStyle.normal,
                                    -0.28),
                                const Spacer(),
                                controller.otherAdmireList.isEmpty
                                    ? Container()
                                    : GestureDetector(
                                        onTap: () {
                                          displayAdmireBottomSheet();
                                        },
                                        child: setHelveticaMedium(
                                            'See More',
                                            12.sp,
                                            grey_aaaaaa,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            -0.24),
                                      ),
                                controller.otherAdmireList.isEmpty
                                    ? Container()
                                    : SizedBox(
                                        width: 5.w,
                                      ),
                                controller.otherAdmireList.isEmpty
                                    ? Container()
                                    : const Icon(
                                        Icons.arrow_forward,
                                        color: grey_aaaaaa,
                                        size: 12,
                                      )
                              ],
                            ),
                          ),
                          controller.otherAdmireList.isEmpty
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.13,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      setHelveticaBoldCenter(
                                          'No Admires',
                                          16.sp,
                                          black,
                                          FontWeight.w300,
                                          FontStyle.normal,
                                          TextAlign.center)
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(top: 16.h),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.11,
                                    width: double.infinity,
                                    child: ListView.separated(
                                      primary: false,
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        width: 16.w,
                                      ),
                                      padding: EdgeInsets.only(
                                        left: 24.w,
                                        right: 24.w,
                                      ),
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          controller.otherAdmireList.length,
                                      itemBuilder: ((context, index) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if (widget.selectedUserId ==
                                                    controller
                                                        .otherAdmireList[index]
                                                        .admireDetails!
                                                        .id
                                                        .toString()) {
                                                  controller
                                                      .userProfileAPI(
                                                          context, false)
                                                      .then((value) =>
                                                          setState(() {
                                                            Get.to(Profile(),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1100),
                                                                    transition:
                                                                        Transition
                                                                            .downToUp)!
                                                                .then((value) {
                                                              checkNet(context)
                                                                  .then(
                                                                      (value) {
                                                                controller.admireListAPI(
                                                                    context,
                                                                    videoController
                                                                        .userList[
                                                                            i]
                                                                        .id
                                                                        .toString());
                                                                setState(() {});
                                                              }).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                            });
                                                          }));
                                                } else {
                                                  controller
                                                      .admireProfileAPI(
                                                          context,
                                                          controller
                                                              .otherAdmireList[
                                                                  index]
                                                              .admireDetails!
                                                              .id)
                                                      .then((value) =>
                                                          setState(() {
                                                            Get.to(Profile(),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1100),
                                                                    transition:
                                                                        Transition
                                                                            .downToUp)!
                                                                .then((value) {
                                                              checkNet(context)
                                                                  .then(
                                                                      (value) {
                                                                controller.admireListAPI(
                                                                    context,
                                                                    videoController
                                                                        .userList[
                                                                            i]
                                                                        .id
                                                                        .toString());
                                                                setState(() {});
                                                              }).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                            });
                                                          }));
                                                }
                                              },
                                              child: CircularProfileAvatar(
                                                '',
                                                radius: 24,
                                                child: controller
                                                            .otherAdmireList[
                                                                index]
                                                            .admireDetails!
                                                            .image ==
                                                        null
                                                    ? SvgPicture.asset(
                                                        placeholder,
                                                        height: 48.h,
                                                        width: 48.w,
                                                      )
                                                    : CachedNetworkImage(
                                                        imageUrl: controller
                                                            .otherAdmireList[
                                                                index]
                                                            .admireDetails!
                                                            .image!,
                                                        height: 48.h,
                                                        width: 48.w,
                                                        fit: BoxFit.cover,
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    downloadProgress) =>
                                                                SvgPicture
                                                                    .asset(
                                                          placeholder,
                                                          height: 48.h,
                                                          width: 48.w,
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            SvgPicture.asset(
                                                          placeholder,
                                                          height: 48.h,
                                                          width: 48.w,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4.h,
                                            ),
                                            setHelveticaMedium(
                                                controller
                                                        .otherAdmireList[index]
                                                        .admireDetails!
                                                        .firstName ??
                                                    "",
                                                12.sp,
                                                black_121212,
                                                FontWeight.w500,
                                                FontStyle.normal,
                                                -0.24),
                                          ],
                                        );
                                      }),
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  displayAdmireBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0))),
              child: SingleChildScrollView(
                child: controller.otherAdmireList.length >= 15
                    ? Container(
                        height: MediaQuery.of(context).size.height - 120.h,
                        child: Admire(),
                      )
                    : Admire(),
              ));
        });
  }

  Wrap Admire() {
    return Wrap(
      children: [
        StatefulBuilder(builder: (context, setState) {
          return Column(
            children: [
              SizedBox(
                height: 12.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 3,
                    decoration: BoxDecoration(
                        color: grey_3f3f3f.withOpacity(0.4),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.r),
                        )),
                  )),
              SizedBox(
                height: 24.h,
              ),
              LayoutBuilder(builder: (context, constraints) {
                return GridView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                        left: 8.w, right: 8.w, bottom: 10.h, top: 16.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 0,
                      crossAxisCount: constraints.maxWidth == 310
                          ? 3
                          : constraints.maxWidth > 310 &&
                                  constraints.maxWidth < 520
                              ? 4
                              : constraints.maxWidth > 520 &&
                                      constraints.maxWidth < 720
                                  ? 5
                                  : 6,
                      childAspectRatio: constraints.maxWidth == 310
                          ? 0.85.w
                          : constraints.maxWidth > 310 &&
                                  constraints.maxWidth < 520
                              ? 0.70.w
                              : constraints.maxWidth > 520 &&
                                      constraints.maxWidth < 720
                                  ? 0.75.w
                                  : 0.9.w,
                    ),
                    itemCount: controller.otherAdmireList.length,
                    itemBuilder: (context, i) => AllAdmireList(
                        controller.otherAdmireList[i],
                        'other',
                        null,
                        controller.details.value.id));
              }),
            ],
          );
        }),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    videoController.searchController.value.text = "";
  }
}
