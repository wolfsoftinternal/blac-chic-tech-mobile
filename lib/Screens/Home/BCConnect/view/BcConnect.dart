import 'package:blackchecktech/Layout/BcConnectFilter.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Home/BCConnect/controller/BCConnectController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/UserProfile.dart';
import 'package:blackchecktech/Styles/global.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../Model/FollowFriendModel.dart';

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
      videoController.isShimmer.value = true;
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
            videoController.isShimmer.value
                ? Expanded(
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
                                    childAspectRatio: 0.86,
                                    crossAxisSpacing: 0.r),
                            itemCount: 6,
                            itemBuilder: (context, i) => Container(
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
                                      Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        enabled: true,
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
                                                    child: Image.asset(
                                                      greyPlaceholder,
                                                      height: 134,
                                                      width: double.infinity,
                                                      fit: BoxFit.fill,
                                                    )),
                                                Image.asset(
                                                  bctShadow,
                                                  fit: BoxFit.cover,
                                                  height: 134,
                                                  width: double.infinity,
                                                ),

                                                Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 15),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 10,
                                                          width:
                                                              double.infinity,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.black,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        const SizedBox(
                                                          height: 3,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.r,
                                                                  right: 10.r),
                                                          child: Container(
                                                            height: 10,
                                                            width:
                                                                double.infinity,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .black,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10.r,
                                                                  right: 10.r,
                                                                  top: 4),
                                                          child: Container(
                                                            height: 10,
                                                            width:
                                                                double.infinity,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .black,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                          ),
                                                        ),
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
                                                  left: 8.w,
                                                  top: 10,
                                                  right: 8.w,
                                                  bottom: 0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 3.5,
                                                  ),
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
                                                    height: 5,
                                                  ),
                                                  // UI/UX Design | Venture Capital Funding | Life Advice Kubernetes Talk
                                                  Container(
                                                    height: 10,
                                                    width: double.infinity,
                                                    color: Colors.black,
                                                  ),

                                                  const SizedBox(
                                                    height: 3.5,
                                                  ),
                                                  // UI/UX Design | Venture Capital Funding | Life Advice Kubernetes Talk
                                                  Container(
                                                    height: 10,
                                                    width: double.infinity,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
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
                  )
                : videoController.userList.isNotEmpty
                    ? Expanded(
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
                                    left: 8.w,
                                    right: 8.w,
                                    bottom: 10.h,
                                    top: 10.h),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.r)),
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
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        4.r),
                                                                topRight: Radius
                                                                    .circular(
                                                                        4.r)),
                                                        child: videoController
                                                                    .userList[i]
                                                                    .image !=
                                                                null
                                                            ? CachedNetworkImage(
                                                                imageUrl:
                                                                    videoController
                                                                        .userList[
                                                                            i]
                                                                        .image!,
                                                                fit: BoxFit
                                                                    .cover,
                                                                height: 134,
                                                                width: double
                                                                    .infinity,
                                                                progressIndicatorBuilder:
                                                                    (context,
                                                                            url,
                                                                            downloadProgress) =>
                                                                        Image
                                                                            .asset(
                                                                  greyPlaceholder,
                                                                  height: 134,
                                                                  width: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Image.asset(
                                                                  greyPlaceholder,
                                                                  height: 134,
                                                                  width: double
                                                                      .infinity,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                              )
                                                            : Image.asset(
                                                                greyPlaceholder,
                                                                height: 134,
                                                                width: double
                                                                    .infinity,
                                                                fit:
                                                                    BoxFit.fill,
                                                              )),
                                                    videoController.userList[i]
                                                                .image !=
                                                            null
                                                        ? Image.asset(
                                                            bctShadow,
                                                            fit: BoxFit.cover,
                                                            height: 134,
                                                            width:
                                                                double.infinity,
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
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
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
                                                                    TextAlign
                                                                        .left),
                                                            const SizedBox(
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
                                                                          left: 10
                                                                              .r,
                                                                          right:
                                                                              10.r),
                                                                      child: Text(
                                                                          "${videoController.userList[i].currentJobs!.title == null ? "" : videoController.userList[i].currentJobs!.title!} ${videoController.userList[i].currentJobs!.companyName == null ? "" : "@"}${videoController.userList[i].currentJobs!.companyName == null ? "" : videoController.userList[i].currentJobs!.companyName!}",
                                                                          maxLines:
                                                                              2,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          style: TextStyle(
                                                                              color: white_ffffff,
                                                                              fontWeight: FontWeight.w400,
                                                                              fontFamily: helveticaNeue,
                                                                              fontStyle: FontStyle.normal,
                                                                              letterSpacing: 0.5,
                                                                              fontSize: 9.sp),
                                                                          textAlign: TextAlign.center),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Come to me for",
                                                          style: TextStyle(
                                                              color:
                                                                  grey_aaaaaa,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  helveticaNeue,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
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
                                                                      .userList[
                                                                          i]
                                                                      .questions![
                                                                          3]
                                                                      .answer!
                                                                      .capitalizeFirst!
                                                                      .replaceAll(',',
                                                                          ' |'),
                                                          overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          style: TextStyle(
                                                              color:
                                                                  black_121212,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  helveticaNeue,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 12.sp),
                                                          maxLines: 2,
                                                          textAlign:
                                                              TextAlign.left)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (videoController.isPaginationLoading.value ==
                                  true)
                                PaginationUtils().loader(),
                            ],
                          ),
                        ),
                      )
                    : noDatFound(context)
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
