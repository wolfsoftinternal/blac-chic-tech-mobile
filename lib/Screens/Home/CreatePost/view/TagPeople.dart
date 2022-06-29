// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:ui';

import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/controller/PostController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TagPeople extends StatefulWidget {
  const TagPeople({Key? key}) : super(key: key);

  @override
  _TagPeopleState createState() => _TagPeopleState();
}

class _TagPeopleState extends State<TagPeople> {
  VideoController videoController = Get.put(VideoController());
  PostController controller = Get.put(PostController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController.initScrolling(context, true);
    if (controller.isSearched.value == true) {
      controller.isSearched.value = false;
      checkNet(context).then((value) async {
        videoController.PageNumber.value = 0;
        videoController.userList.clear();
        await videoController.userListAPI(context, true);

        Future.delayed(Duration(milliseconds: 3), () {
          for (var item in videoController.userList) {
            for (var selectedItem in controller.selectedList) {
              if (selectedItem.id == item.id) {
                item.isSpeakerSelected = selectedItem.isSpeakerSelected;
              }
            }
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Obx(
        () => Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackLayout(),
                Text('TAG PEOPLE',
                    style: TextStyle(
                        color: black_121212,
                          fontWeight: FontWeight.w900,
                        letterSpacing: 1.0,
                        fontFamily: helvetica_neu_bold,
                        /*akib changes*/
                        fontStyle: FontStyle.normal,
                        fontSize: 16.sp /*akib changes*/
                        ),
                    textAlign: TextAlign.left),
                Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: orange_ff881a),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, top: 8.h, bottom: 8.h),
                        child: Text('Done',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp),
                            textAlign: TextAlign.left),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Container(
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    controller.assetImages.length > 0
                        ? Image.file(
                            File(controller.assetImages[0].relativePath
                                    .toString()
                                    .contains('/storage/emulated/0/')
                                ? (controller.assetImages[0].relativePath ??
                                        "") +
                                    "/" +
                                    (controller.assetImages[0].title ?? "")
                                : '/storage/emulated/0/' +
                                    (controller.assetImages[0].relativePath ??
                                        "") +
                                    "/" +
                                    (controller.assetImages[0].title ?? "")),
                            width: double.infinity,
                            height: 375.h,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            img_girl,
                            height: 375.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                    SizedBox(
                      height: 56.h,
                      child: ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => SizedBox(
                                width: 8.w,
                              ),
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, bottom: 24.h),
                          itemCount: controller.selectedList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF1c2535).withOpacity(0.5),
                                      Color(0xFF04080f).withOpacity(0.5),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                        controller.selectedList[i].userName !=
                                                null
                                            ? controller
                                                .selectedList[i].userName!
                                            : controller
                                                .selectedList[i].firstName!,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: helvetica_neu_bold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp),
                                        textAlign: TextAlign.left),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          if (controller.selectedList.length ==
                                              1) {
                                            controller.selectedList.clear();
                                            for (var item
                                                in videoController.userList) {
                                              if (item.isSpeakerSelected ==
                                                  true) {
                                                item.isSpeakerSelected = false;
                                              }
                                            }
                                          } else {
                                            if (controller.selectedList[i].id ==
                                                null) {
                                              controller.selectedList.remove(
                                                  controller.selectedList[i]);
                                            } else {
                                              var selectedIndex =
                                                  controller.selectedList[i].id;
                                              for (var item
                                                  in videoController.userList) {
                                                if (selectedIndex == item.id) {
                                                  controller.selectedList
                                                      .remove(item);
                                                  item.isSpeakerSelected =
                                                      false;
                                                }
                                              }
                                            }
                                          }
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 15,
                                          color: white_ffffff,
                                        ))
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
              child: SearchBarTag(
                  placeholder: "Search people",
                  onSubmit: (value) async {
                    if (videoController.searchController.value.text == '') {
                      controller.isSearched.value = false;
                      videoController.PageNumber.value = 0;
                      videoController.userList.clear();
                      await videoController.userListAPI(context, true);
                      Future.delayed(Duration(milliseconds: 3), () {
                        for (var item in videoController.userList) {
                          for (var selectedItem in controller.selectedList) {
                            if (selectedItem.id == item.id) {
                              item.isSpeakerSelected =
                                  selectedItem.isSpeakerSelected;
                            }
                          }
                        }
                      });
                    } else {
                      controller.isSearched.value = true;
                      videoController.PageNumber.value = 0;
                      await videoController.userListAPI(context, true);
                      Future.delayed(Duration(milliseconds: 3), () {
                        for (var item in videoController.userList) {
                          for (var selectedItem in controller.selectedList) {
                            if (selectedItem.id == item.id) {
                              item.isSpeakerSelected =
                                  selectedItem.isSpeakerSelected;
                            }
                          }
                        }
                      });
                    }
                  },
                  controller: videoController.searchController.value,
                  autoFocus: false),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                controller: videoController.scrollController,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 24.0, bottom: 24.0, right: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 24.h,
                          ),
                          ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            itemCount: videoController.userList.length,
                            itemBuilder: (context, i) => GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    // if (controller.selectedList.contains(
                                    //     videoController.userList[i])) {
                                    //   controller.selectedList
                                    //       .remove(videoController.userList[i]);
                                    // } else {
                                    //   controller.selectedList
                                    //       .add(videoController.userList[i]);
                                    // }

                                    videoController
                                        .userList[i].isSpeakerSelected = true;
                                    if (controller.selectedList.contains(
                                        videoController.userList[i])) {
                                      controller.selectedList
                                          .remove(videoController.userList[i]);
                                      videoController
                                          .userList[i].isHostSelected = false;
                                    } else {
                                      controller.selectedList
                                          .add(videoController.userList[i]);
                                    }
                                  },
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: Container(
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularProfileAvatar(
                                        '',
                                        radius: 20,
                                        child:
                                            videoController.userList[i].image ==
                                                    null
                                                ? SvgPicture.asset(
                                                    placeholder,
                                                    height: 40.h,
                                                    width: 40.w,
                                                    fit: BoxFit.cover,
                                                  )
                                                : CachedNetworkImage(
                                                    imageUrl: videoController
                                                        .userList[i].image!,
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
                                                videoController.userList[i]
                                                            .userName !=
                                                        null
                                                    ? videoController
                                                        .userList[i].userName!
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
                                                videoController.userList[i]
                                                            .firstName !=
                                                        null
                                                    ? videoController
                                                            .userList[i]
                                                            .firstName!
                                                            .capitalizeFirst! +
                                                        " " +
                                                        videoController
                                                            .userList[i]
                                                            .lastName!
                                                            .capitalizeFirst!
                                                    : "",
                                                style:
                                                    TextStyle(
                                                        color: black_121212,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily:
                                                            helveticaNeueNeue_medium,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14.sp),
                                                textAlign: TextAlign.left)
                                          ],
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        videoController.userList[i]
                                                    .isSpeakerSelected ==
                                                true
                                            ? orange_tick_icon
                                            : icon_next_arrow,
                                        width: 24.w,
                                        height: 24.h,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (videoController.isPaginationLoading.value == true)
              PaginationUtils().loader(),
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
