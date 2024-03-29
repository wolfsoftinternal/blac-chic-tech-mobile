import 'package:blackchecktech/Layout/BcConnectFilter.dart';
import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/InputTextLayout.dart';
import 'package:blackchecktech/Layout/InputTextStatic.dart';
import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Screens/Home/BCConnect/controller/BCConnectController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/UserProfile.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../../Model/FollowFriendModel.dart';
import '../../../../Styles/my_strings.dart';
import '../../Profile/view/AdmireProfile.dart';

class BcConnect extends StatefulWidget {
  const BcConnect({Key? key}) : super(key: key);

  @override
  _BcConnectState createState() => _BcConnectState();
}

class _BcConnectState extends State<BcConnect> {
  BCConnectController bcConnectController = Get.put(BCConnectController());
  VideoController videoController = Get.put(VideoController());
  StepsController stepsController = Get.put(StepsController());

  String? dropdownValue;

  List<FollowFriendModel> onFollowFriendModel = [
    FollowFriendModel('assets/images/grid_img_one.png', 'Queen South'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Jessica J'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Queen South'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Jessica J'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Queen South'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Jessica J'),
  ];

  var _firstnameController = TextEditingController();

  // bool isFollow = true;
  // bool isFollowed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController.initScrolling(context, true);
    checkNet(context).then((value) {
      videoController.userListAPI(context, true);
      stepsController.countryListApi();
      stepsController.industryListAPI(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            ToolbarWithHeaderCenterTitle('BC-CONNECT'),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: BcConnectFilter(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 24.h, bottom: 12.h),
              child: Text("${videoController.userCount.toString()} Results",
                  style: TextStyle(
                      color: black_121212,
                      fontWeight: FontWeight.w900,
                      fontFamily: helveticaNeue,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.sp),
                  textAlign: TextAlign.left),
            ),
            videoController.userList.isEmpty
                ? Expanded(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.50,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: black,
                        ))),
                  )
                : Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      controller: videoController.scrollController,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GridView.builder(
                            primary: false,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(
                                left: 8.w, right: 8.w, bottom: 10.h, top: 10.h),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 2.r,
                                    childAspectRatio: 0.84,
                                    crossAxisSpacing: 0.r),
                            itemCount: videoController.userList.length,
                            itemBuilder: (context, i) => Container(
                              // height: 215.h,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 8.w, right: 8.w, bottom: 18),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: white_ffffff,
                                    // color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.r)),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0x19121212),
                                          offset: Offset(0, 30),
                                          blurRadius: 60,
                                          spreadRadius: 0)
                                    ],
                                  ),
                                  child: Stack(
                                    //    alignment: Alignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(UserProfile(
                                            selectedUserId: videoController
                                                .userList[i].id
                                                .toString(),
                                            isFrom: false,
                                            index: i,
                                          ));
                                          // !.then((value) {
                                          //   checkNet(context).then((value) => {
                                          //         videoController
                                          //             .PageNumber.value = 0,
                                          //         videoController.userListAPI(
                                          //             context, true)
                                          //       });
                                          // });
                                          videoController.userList.clear();
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4.r),
                                                            topRight: Radius
                                                                .circular(4.r)),
                                                    child: videoController
                                                                .userList[i]
                                                                .image !=
                                                            null
                                                        ? CachedNetworkImage(
                                                            imageUrl:
                                                                videoController
                                                                    .userList[i]
                                                                    .image!,
                                                            fit: BoxFit.cover,
                                                            height: 134,
                                                            width:
                                                                double.infinity,
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        downloadProgress) =>
                                                                    Image.asset(
                                                              greyPlaceholder,
                                                              height: 134,
                                                              width: double
                                                                  .infinity,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Image.asset(
                                                              greyPlaceholder,
                                                              height: 134,
                                                              width: double
                                                                  .infinity,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          )
                                                        : Image.asset(
                                                            greyPlaceholder,
                                                            height: 134,
                                                            width:
                                                                double.infinity,
                                                            fit: BoxFit.fill,
                                                          )),
                                                videoController.userList[i]
                                                            .image !=
                                                        null
                                                    ? Image.asset(
                                                        bctShadow,
                                                        fit: BoxFit.cover,
                                                        height: 134,
                                                        width: double.infinity,
                                                      )
                                                    : Container(),
                                                // unsplash:27xbM3bF9_s
                                                // Container(
                                                //   width: double.infinity,
                                                //   height: 134.h,
                                                //   // decoration:
                                                //   //     BoxDecoration(
                                                //   //   gradient: LinearGradient(
                                                //   //       begin: Alignment
                                                //   //           .topCenter,
                                                //   //       end: Alignment
                                                //   //           .bottomCenter,
                                                //   //       colors: [
                                                //   //         Color.fromARGB(
                                                //   //                 0,
                                                //   //                 42,
                                                //   //                 41,
                                                //   //                 41)
                                                //   //             .withOpacity(
                                                //   //                 0.0),
                                                //   //         Color.fromARGB(
                                                //   //                 255,
                                                //   //                 31,
                                                //   //                 31,
                                                //   //                 31)
                                                //   //             .withOpacity(
                                                //   //                 0.7)
                                                //   //       ]),
                                                //   // )
                                                // ),

                                                // Jessie J
                                                Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 15),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            "${videoController.userList[i].firstName == null ? "" : videoController.userList[i].firstName!.capitalizeFirst!} ${videoController.userList[i].lastName == null ? "" : videoController.userList[i].lastName!.capitalizeFirst!}",
                                                            style: TextStyle(
                                                                color:
                                                                    white_ffffff,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                                fontFamily:
                                                                    helveticaNeue,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontSize:
                                                                    13.sp),
                                                            textAlign:
                                                                TextAlign.left),
                                                        SizedBox(
                                                          height: 3,
                                                        ),
                                                        Opacity(
                                                          opacity: 0.9,
                                                          child: videoController
                                                                      .userList[
                                                                          i]
                                                                      .currentJobs ==
                                                                  null
                                                              ? Container()
                                                              : Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left:
                                                                          10.r,
                                                                      right:
                                                                          10.r),
                                                                  child: Text(
                                                                      "${videoController.userList[i].currentJobs!.title == null ? "" : videoController.userList[i].currentJobs!.title!} ${videoController.userList[i].currentJobs!.companyName == null ? "" : "@"}${videoController.userList[i].currentJobs!.companyName == null ? "" : videoController.userList[i].currentJobs!.companyName!}",
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color:
                                                                              white_ffffff,
                                                                          fontWeight: FontWeight
                                                                              .w400,
                                                                          fontFamily:
                                                                              helveticaNeue,
                                                                          fontStyle: FontStyle
                                                                              .normal,
                                                                          letterSpacing:
                                                                              0.5,
                                                                          fontSize: 9
                                                                              .sp),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center),
                                                                ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                // Product manager and brand strategist @capitalone
                                              ],
                                            ),

                                            // Come to me for
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 16.w,
                                                  top: 10,
                                                  right: 16.w,
                                                  bottom: 16),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Come to me for",
                                                      style: TextStyle(
                                                          color: grey_aaaaaa,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              helveticaNeue,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 8.sp),
                                                      textAlign:
                                                          TextAlign.left),
                                                  const SizedBox(
                                                    height: 3.5,
                                                  ),
                                                  // UI/UX Design | Venture Capital Funding | Life Advice Kubernetes Talk
                                                  Text(
                                                      videoController
                                                              .userList[i]
                                                              .questions!
                                                              .isEmpty
                                                          ? ""
                                                          : videoController
                                                                      .userList[
                                                                          i]
                                                                      .questions!
                                                                      .length <
                                                                  4
                                                              ? ""
                                                              : videoController
                                                                  .userList[i]
                                                                  .questions![3]
                                                                  .answer!
                                                                  .capitalizeFirst!
                                                                  .replaceAll(
                                                                      ',',
                                                                      ' |'),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: black_121212,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily:
                                                              helveticaNeue,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 12.sp),
                                                      maxLines: 2,
                                                      textAlign: TextAlign.left)
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      // Positioned(
                                      //   top: 115.h,
                                      //   left: 40.w,
                                      //   child: GestureDetector(
                                      //     onTap: () {
                                      //       if (videoController
                                      //               .userList[i].isAdmire ==
                                      //           0) {
                                      //         bcConnectController.createAdmireAPI(
                                      //             context,
                                      //             videoController.userList[i].id,
                                      //             i);
                                      //       } else if (videoController
                                      //               .userList[i].isAdmire ==
                                      //           1) {
                                      //         bcConnectController.admireDeleteAPI(
                                      //             context,
                                      //             videoController.userList[i].id,
                                      //             i);
                                      //       }
                                      //     },
                                      //     child: videoController
                                      //                 .userList[i].isAdmire ==
                                      //             1
                                      //         ? Padding(
                                      //             padding:
                                      //                 EdgeInsets.only(top: 0.h),
                                      //             child: Container(
                                      //               decoration: BoxDecoration(
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(
                                      //                         50.r),
                                      //                 gradient: LinearGradient(
                                      //                     begin: Alignment
                                      //                         .bottomCenter,
                                      //                     end:
                                      //                         Alignment.topCenter,
                                      //                     colors: [
                                      //                       Color(0xff1c2535),
                                      //                       Color(0xff04080f)
                                      //                     ]),
                                      //                 boxShadow: [
                                      //                   BoxShadow(
                                      //                     color: Color(0x26121212)
                                      //                         .withOpacity(0.2),
                                      //                     spreadRadius: 5,
                                      //                     blurRadius: 7,
                                      //                     offset: Offset(0,
                                      //                         3), // changes position of shadow
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //               child: // Followed
                                      //                   Padding(
                                      //                 padding: EdgeInsets.only(
                                      //                     left: 20.w,
                                      //                     right: 20.w,
                                      //                     top: 10.h,
                                      //                     bottom: 10.h),
                                      //                 child: Text("Followed",
                                      //                     style: TextStyle(
                                      //                         color: const Color(
                                      //                             0xffffffff),
                                      //                         fontWeight:
                                      //                             FontWeight.w700,
                                      //                         fontFamily:
                                      //                             helveticaNeue,
                                      //                         fontStyle: FontStyle
                                      //                             .normal,
                                      //                         fontSize: 11.sp),
                                      //                     textAlign:
                                      //                         TextAlign.left),
                                      //               ),
                                      //             ),
                                      //           )
                                      //         : Padding(
                                      //             padding:
                                      //                 EdgeInsets.only(top: 0.h),
                                      //             child: Container(
                                      //               decoration: BoxDecoration(
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(
                                      //                         50.r),
                                      //                 gradient: LinearGradient(
                                      //                     begin: Alignment
                                      //                         .bottomCenter,
                                      //                     end:
                                      //                         Alignment.topCenter,
                                      //                     colors: [
                                      //                       Color(0xffffffff),
                                      //                       Color(0xffffffff)
                                      //                     ]),
                                      //                 boxShadow: [
                                      //                   BoxShadow(
                                      //                     color: Color(0x26121212)
                                      //                         .withOpacity(0.2),
                                      //                     spreadRadius: 5,
                                      //                     blurRadius: 7,
                                      //                     offset: Offset(0,
                                      //                         3), // changes position of shadow
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //               child: // Followed
                                      //                   Padding(
                                      //                 padding: EdgeInsets.only(
                                      //                     left: 20.w,
                                      //                     right: 20.w,
                                      //                     top: 10.h,
                                      //                     bottom: 10.h),
                                      //                 child: Row(
                                      //                   children: [
                                      //                     SvgPicture.asset(
                                      //                       follow,
                                      //                       height: 12.h,
                                      //                       width: 11.h,
                                      //                     ),
                                      //                     SizedBox(
                                      //                       width: 4.w,
                                      //                     ),
                                      //                     Text("Follow",
                                      //                         style: TextStyle(
                                      //                             color: const Color(
                                      //                                 0xff1c2535),
                                      //                             fontWeight:
                                      //                                 FontWeight
                                      //                                     .w700,
                                      //                             fontFamily:
                                      //                                 helveticaNeue,
                                      //                             fontStyle:
                                      //                                 FontStyle
                                      //                                     .normal,
                                      //                             fontSize:
                                      //                                 11.sp),
                                      //                         textAlign:
                                      //                             TextAlign.left),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //           ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (videoController.isPaginationLoading.value == true)
                            PaginationUtils().loader(),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    videoController.searchController.value.text = "";
  }
}
