// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';

import 'package:blackchecktech/Screens/Home/CreatePost/controller/PostController.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/view/PostLocation.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/view/TagPeople.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/view/multi_assets_page.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Styles/global.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:blackchecktech/Widget/PostImage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  VideoController videoController = Get.put(VideoController());
  PostController controller = Get.put(PostController());
  PageController pageController = PageController();
  int activeIndex = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController.userListAPI(context, true);
    for (var item in videoController.userList) {
      if (item.isSpeakerSelected == true) {
        item.isSpeakerSelected = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24.0, top: 50.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.close,
                        size: 24,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('CREATE A POST',
                                    style: TextStyle(
                                        color: black_121212,
                                        fontFamily: helvetica_neu_bold,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 0.7,
                                        fontSize: 16.sp),
                                    textAlign: TextAlign.left),
                                // Icon(Icons.expand_more_rounded),
                              ],
                            ),
                            // Container(height: 30, width: 148, child: MultiAssetsPage()),
                          ],
                        ),
                      ),
                    ),
                    controller.assetImages.isEmpty
                        ? Container(
                            width: 48.w,
                          )
                        : InkWell(
                            onTap: () {
                              checkNet(context).then((value) {
                                controller.createPostAPI(context);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: orange_ff881a),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Text('POST',
                                    style: const TextStyle(
                                        color: Color(0xffffffff),
                                        fontWeight: FontWeight.w900,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0),
                                    textAlign: TextAlign.left),
                              ),
                            ),
                          ),
                  ],
                ),
              ),

              Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      controller.assetImages.length > 0
                      ? Container(
                        height: 375.h,
                        width: double.infinity,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: controller.assetImages.length,
                          onPageChanged: (v){
                            setState(() {
                              activeIndex = v;
                            });
                          },
                          itemBuilder:
                              (BuildContext context, int index) {
                            return PostImage(index: index,);
                          }
                        ),
                      )
                      : Stack(
                        children: [
                          Container(
                            height: 375.h,
                            width: double.infinity,
                            child: Image.asset(
                              post_image,
                            ),
                          ),
                          Container(
                              height: 375.h,
                              width: double.infinity,
                              child: MultiAssetsPage(375.h)),
                        ],
                      ),
                      controller.assetImages.isEmpty
                          ? Container()
                          : Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(TagPeople());
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 24.r,
                                        bottom: 24.r,
                                        top: 24.r,
                                        right: 15.r),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        gradient: LinearGradient(
                                            colors: const [
                                              Color(0xFF1c2535),
                                              Color(0xFF04080f),
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            stops: const [0.0, 1.0],
                                            tileMode: TileMode.clamp),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.r),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.person_add,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            // Tag People
                                            Text("Tag People",
                                                style: const TextStyle(
                                                    color: Color(0xffffffff),
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: helveticaNeue,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12.0),
                                                textAlign: TextAlign.left)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    height: 35.h,
                                    width: getWidth(context) * 0.58,
                                    child: ListView.separated(
                                        primary: false,
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                        padding: EdgeInsets.only(
                                          right: 24.w,
                                        ),
                                        itemCount: controller.selectedList.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, i) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Color(0xFF1c2535)
                                                        .withOpacity(0.5),
                                                    Color(0xFF04080f)
                                                        .withOpacity(0.5),
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                      controller.selectedList[i]
                                                                  .userName !=
                                                              null
                                                          ? controller
                                                              .selectedList[i]
                                                              .userName!
                                                          : controller
                                                              .selectedList[i]
                                                              .firstName!,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily:
                                                              helvetica_neu_bold,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 12.sp),
                                                      textAlign: TextAlign.left),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        if (controller.selectedList
                                                                .length ==
                                                            1) {
                                                          controller.selectedList
                                                              .clear();
                                                          for (var item
                                                              in videoController
                                                                  .userList) {
                                                            if (item.isSpeakerSelected ==
                                                                true) {
                                                              item.isSpeakerSelected =
                                                                  false;
                                                            }
                                                          }
                                                        } else {
                                                          if (controller
                                                                  .selectedList[i]
                                                                  .id ==
                                                              null) {
                                                            controller.selectedList
                                                                .remove(controller
                                                                    .selectedList[i]);
                                                          } else {
                                                            var selectedIndex =
                                                                controller
                                                                    .selectedList[i]
                                                                    .id;
                                                            for (var item
                                                                in videoController
                                                                    .userList) {
                                                              if (selectedIndex ==
                                                                  item.id) {
                                                                controller
                                                                    .selectedList
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
                                ),
                              ],
                            ),
                    ],
                  ),
                  controller.assetImages.length > 1 
                  ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: controller.assetImages.length,
                      effect: ScrollingDotsEffect(
                        dotHeight: 5.2.h,
                        dotWidth: 5.2.w,
                        activeDotColor: orange,
                      ),
                    ),
                  ) : Container()
                ],
              ),
              controller.assetImages.isNotEmpty
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.only(bottom: 24.h),
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 40.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  color: orange),
                              child: Center(
                                  child: setHelveticaMedium(
                                      'Upload Image',
                                      14.sp,
                                      white,
                                      FontWeight.w500,
                                      FontStyle.normal)),
                            ),
                          ),
                          Center(
                              child: Container(
                                  height: 40.h,
                                  width: 150.w,
                                  child: MultiAssetsPage(40.h))),
                        ],
                      ),
                    ),
              controller.assetImages.isNotEmpty
                  ? Container()
                  : Container(
                      height: 1,
                      color: grey_f5f5f5,
                    ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CAPTION
                    Text("CAPTION",
                        style: TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w900,
                            fontFamily: helvetica_neu_bold,
                            letterSpacing: 1.0,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 13.h,
                    ),

                    Container(
                      decoration: EditTextDecorationBorder,
                      height: 122.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 4.h,
                                  bottom: 2.h,
                                  right: 24.w,
                                  left: 16.w),
                              child: TextFormField(
                                controller: controller.captionController.value,
                                minLines: 2,
                                maxLines: 15,
                                keyboardType: TextInputType.multiline,
                                style: TextStyle(
                                    color: black_121212,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: helveticaNeueNeue_medium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  hintText: 'Write a caption...',
                                  hintStyle: TextStyle(
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 26.h,
                    ),

                    InkWell(
                      onTap: () {
                        Get.to(PostLocation());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ADD LOCATION",
                              style: TextStyle(
                                  color: black_121212,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: helvetica_neu_bold,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 1.0,
                                  fontSize: 12.sp),
                              textAlign: TextAlign.left),
                          RotatedBox(
                              quarterTurns: 90,
                              child: SvgPicture.asset(
                                icon_back_black_arrow,
                                width: 15.w,
                                height: 15.h,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: controller.location.value == ''
                    ? Container()
                    : AddLocationView(
                        title: controller.location.value,
                      ),
              ),
              // SizedBox(
              //   height: 35.h,
              //   child: ListView.separated(
              //     separatorBuilder: (context, index) => SizedBox(
              //       width: 8.w,
              //     ),
              //     itemCount: 1,
              //     padding: EdgeInsets.only(top: 0, left: 24.w, right: 24.w),
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (_, index) {
              // return controller.location.value == '' ? Container() :
              // AddLocationView(
              //   title: controller.location.value,
              // );
              //     },
              //   ),
              // ),
            ],
          ),
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
