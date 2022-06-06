// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/view/AddSpeaker.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/view/CreateEventDetail.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreatEventUploadImage extends StatefulWidget {
  const CreatEventUploadImage({Key? key}) : super(key: key);

  @override
  _UploadVideosState createState() => _UploadVideosState();
}

class _UploadVideosState extends State<CreatEventUploadImage> {
  EventController controller = Get.put(EventController());
  VideoController videoController = Get.put(VideoController());

  File poster = File("");
  String? posterPath;

  @override
  void initState() {
    super.initState();
  }

  /*Speaker bottom sheet*/
  void displaySpeakerBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft:  Radius.circular(30.r),
                    topRight:  Radius.circular(30.r))),
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Obx(
                      () => Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 15.h,
                            ),

                            // Rectangle 1329
                            Align(
                              alignment: Alignment.topCenter,
                              child: Opacity(
                                opacity: 0.4000000059604645,
                                child: Container(
                                    width: 48.w,
                                    height: 4.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4.r)),
                                        color: const Color(0xff96a6a3))),
                              ),
                            ),

                            SizedBox(
                              height: 24.h,
                            ),

                            // SPEAKERS
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Text("SPEAKERS",
                                        style: TextStyle(
                                            color: Color(0xff121212),
                                            fontWeight: FontWeight.w900,
                                            fontFamily: "NeueHelvetica",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 16.0),
                                        textAlign: TextAlign.left),
                                  ),
                                  // +ADD
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        showGeneralDialog(
                                          context: context,
                                          pageBuilder: (BuildContext buildContext,
                                              Animation animation, Animation secondaryAnimation) {
                                            return AddSpeaker();
                                          });
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text("+ADD",
                                          style: TextStyle(
                                              color: Color(0xffff8819),
                                              fontFamily: "Roboto",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.left),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),

                            Divider(
                              thickness: 1,
                              height: 1,
                              color: Color(0xfff4f6f6),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /*--------------Please Uncomment the below search bar--------------*/

                                  //   SearchBarTag(placeholder: "Search people"),

                                  SearchBarTag(
                                    placeholder: "Search people",
                                    autoFocus: false,
                                    onSubmit: (value) {
                                      checkNet(context).then((value) {
                                        videoController.userListAPI(
                                            context,
                                            controller
                                                .searchController.value.text);
                                      });
                                    },
                                    controller:
                                        controller.searchController.value,
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),

                                  SizedBox(
                                    height: 24.h,
                                  ),

                                  ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(0),
                                    itemCount: videoController.userList.length,
                                    itemBuilder: (context, i) =>
                                        GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            if (controller.selectedSpeaker
                                                .contains(videoController
                                                    .userList[i])) {
                                              controller.selectedSpeaker.remove(
                                                  videoController.userList[i]);
                                            } else {
                                              controller.selectedSpeaker.add(
                                                  videoController.userList[i]);
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: videoController
                                                        .userList.isNotEmpty
                                                    ? videoController
                                                                .userList[i]
                                                                .image ==
                                                            null
                                                        ? SvgPicture.asset(
                                                            placeholder,
                                                            height: 40.h,
                                                            width: 40.w,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : CachedNetworkImage(
                                                            imageUrl:
                                                                videoController
                                                                    .userList[i]
                                                                    .image!,
                                                            height: 40.h,
                                                            width: 40.w,
                                                            fit: BoxFit.cover,
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        downloadProgress) =>
                                                                    SvgPicture
                                                                        .asset(
                                                              placeholder,
                                                              height: 40.h,
                                                              width: 40.w,
                                                              fit: BoxFit.cover,
                                                            ),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    SvgPicture
                                                                        .asset(
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
                                                        videoController
                                                                    .userList[i]
                                                                    .userName !=
                                                                null
                                                            ? videoController
                                                                .userList[i]
                                                                .userName!
                                                            : "",
                                                        style: TextStyle(
                                                            color: grey_aaaaaa,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                helveticaNeueNeue_medium,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    // Claire Roman
                                                    Text(
                                                        videoController
                                                                    .userList[i]
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
                                                        style: TextStyle(
                                                            color: black_121212,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                helveticaNeueNeue_medium,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 14.sp),
                                                        textAlign:
                                                            TextAlign.left)
                                                  ],
                                                ),
                                              ),
                                              SvgPicture.asset(
                                                controller.selectedSpeaker
                                                        .contains(
                                                            videoController
                                                                .userList[i])
                                                    ? orange_tick_icon
                                                    : icon_next_arrow,
                                                width: 25.w,
                                                height: 25.h,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        });
  }

  /*Host bottom sheet*/
  void displayHostBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0))),
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 15,
                          ),

                          // Rectangle 1329
                          Align(
                            alignment: Alignment.topCenter,
                            child: Opacity(
                              opacity: 0.4000000059604645,
                              child: Container(
                                  width: 48,
                                  height: 4,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      color: const Color(0xff96a6a3))),
                            ),
                          ),

                          SizedBox(
                            height: 24.h,
                          ),

                          // SPEAKERS
                          Center(
                            child: Text("HOST",
                                style: const TextStyle(
                                    color: Color(0xff121212),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "NeueHelvetica",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.0),
                                textAlign: TextAlign.left),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),

                          Divider(
                            thickness: 1,
                            height: 1,
                            color: Color(0xfff4f6f6),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*--------------Please Uncomment the below search bar--------------*/

                                //   SearchBarTag(placeholder: "Search people"),

                                SearchBarTag(
                                  placeholder: "Search people",
                                  autoFocus: false,
                                  onSubmit: (value) {
                                    checkNet(context).then((value) {
                                      videoController.userListAPI(
                                          context,
                                          controller
                                              .searchController.value.text);
                                    });
                                  },
                                  controller: controller.searchController.value,
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),

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
                                            controller.selectedHost.clear();
                                            controller.selectedHost.add(videoController.userList[i]);
                                        },
                                      );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 16.h),
                                      child: Container(
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: videoController
                                                      .userList.isNotEmpty
                                                  ? videoController.userList[i]
                                                              .image ==
                                                          null
                                                      ? SvgPicture.asset(
                                                          placeholder,
                                                          height: 40.h,
                                                          width: 40.w,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : CachedNetworkImage(
                                                          imageUrl:
                                                              videoController
                                                                  .userList[i]
                                                                  .image!,
                                                          height: 40.h,
                                                          width: 40.w,
                                                          fit: BoxFit.cover,
                                                          progressIndicatorBuilder:
                                                              (context, url,
                                                                      downloadProgress) =>
                                                                  SvgPicture
                                                                      .asset(
                                                            placeholder,
                                                            height: 40.h,
                                                            width: 40.w,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
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
                                                      videoController
                                                                  .userList[i]
                                                                  .userName !=
                                                              null
                                                          ? videoController
                                                              .userList[i]
                                                              .userName!
                                                          : "",
                                                      style: TextStyle(
                                                          color: grey_aaaaaa,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              helveticaNeueNeue_medium,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 14.sp),
                                                      textAlign:
                                                          TextAlign.left),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  // Claire Roman
                                                  Text(
                                                      videoController
                                                                  .userList[i]
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
                                                      style: TextStyle(
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
                                              controller.selectedHost.contains(videoController.userList[i])
                                                  ? orange_tick_icon
                                                  : icon_next_arrow,
                                              width: 25.w,
                                              height: 25.h,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            ToolbarWithHeaderCenterTitle('CREATE EVENT'),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 24.w, right: 24.w, top: 40.h, bottom: 24.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // UPLOAD VIDEO
                            Text("UPLOAD POSTER",
                                style: TextStyle(
                                    color: grey_aaaaaa,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: helvetica_neu_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.sp),
                                textAlign: TextAlign.left),

                            SizedBox(
                              height: 25.h,
                            ),

                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: Color(0xfff5f5f5),
                                border: Border.all(
                                    width: 1, color: Color(0x66f5f5f5)),
                              ),
                              child: poster.toString() != "File: ''"
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectPhoto();
                                        });
                                      },
                                      child: SizedBox(
                                        height: 276.h,
                                        width: 327.w,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4.r),
                                          child: Image.file(
                                            poster,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectPhoto();
                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 96.h,
                                            bottom: 96.h,
                                            left: 40.w,
                                            right: 40.w),
                                        child: Column(
                                          children: [
                                            SvgPicture.asset(icon_upload_image,
                                                width: 32.w, height: 32.h),
                                            SizedBox(
                                              height: 16.h,
                                            ),
                                            // Upload Video
                                            Text("Upload image poster",
                                                style: TextStyle(
                                                    color: Color(0xff273433),
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: "NeueHelvetica",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.center),
                                            SizedBox(
                                              height: 8.sp,
                                            ),
                                            // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae facilisis sit nunc lorem. Morbi orci,
                                            Text("Max image size is 5 Mb",
                                                style: TextStyle(
                                                    color: Color(0xff96a6a3),
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Roboto",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12.sp,
                                                    height: 1.5),
                                                textAlign: TextAlign.center)
                                          ],
                                        ),
                                      ),
                                    ),
                            ),
                            // SizedBox(
                            //   height: 16.h,
                            // ),
                            // // Add more photos
                            // Text("+ Add more photos",
                            //     style: const TextStyle(
                            //         color: const Color(0xffff881a),
                            //         fontFamily: "NeueHelvetica",
                            //         fontStyle: FontStyle.normal,
                            //         fontSize: 14.0),
                            //     textAlign: TextAlign.center),

                            SizedBox(
                              height: 28.h,
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  displaySpeakerBottomSheet(context);
                                });
                              },
                              child: Container(
                                color: white_ffffff,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("TAG SPEAKERS",
                                        style: TextStyle(
                                            color: grey_aaaaaa,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: helvetica_neu_bold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp),
                                        textAlign: TextAlign.left),
                                    Icon(
                                      Icons.add,
                                      size: 15,
                                      color: orange_ff881a,
                                    )
                                  ],
                                ),
                              ),
                            ),

                            controller.selectedSpeaker.isEmpty
                                ? Container()
                                : SizedBox(
                                    height: 14.h,
                                  ),

                            controller.selectedSpeaker.isEmpty
                                ? Container()
                                : SizedBox(
                                    height: 37.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            controller.selectedSpeaker.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  color: grey_f5f5f5),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 8,
                                                    bottom: 8),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: controller.selectedSpeaker[index].image == null
                                                          ? Container(
                                                            height: 17.h,
                                                            width: 17.w,
                                                            color: orange,
                                                            child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(50.0),
                                                            child: Center(
                                                              child: Text(
                                                                controller.selectedSpeaker[index].userName != null ? controller.selectedSpeaker[index].userName[0].toString().toUpperCase() : controller.selectedSpeaker[index].firstName[0].toString().toUpperCase(),
                                                                style: TextStyle(
                                                            color: white_ffffff,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                "Roboto",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 11.sp),
                                                        textAlign:
                                                            TextAlign.left)
                                                            ),
                                                          ),
                                                          )
                                                          : CachedNetworkImage(
                                                              imageUrl: controller
                                                                  .selectedSpeaker[
                                                                      index]
                                                                  .image!,
                                                              height: 17.h,
                                                              width: 17.w,
                                                              fit: BoxFit.cover,
                                                              progressIndicatorBuilder:
                                                                  (context, url,
                                                                          downloadProgress) =>
                                                                      SvgPicture
                                                                          .asset(
                                                                placeholder,
                                                                height: 17.h,
                                                                width: 17.w,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  SvgPicture
                                                                      .asset(
                                                                placeholder,
                                                                height: 17.h,
                                                                width: 17.w,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Text(
                                                        "@${controller.selectedSpeaker[index].userName != null ? controller.selectedSpeaker[index].userName! : controller.selectedSpeaker[index].firstName ?? ""}",
                                                        style: TextStyle(
                                                            color: black_121212,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                "Roboto",
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 11.sp),
                                                        textAlign:
                                                            TextAlign.left),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                            if(controller.selectedSpeaker.length == 1){
                                                              controller.selectedSpeaker.clear();
                                                            }else {
                                                              if(controller.selectedSpeaker[index].id == null){
                                                                controller.selectedSpeaker.remove(controller.selectedSpeaker[index]);
                                                              }else{
                                                                var selectedIndex = controller.selectedSpeaker[index].id;
                                                                for(var item in videoController.userList){
                                                                  if(selectedIndex == item.id){
                                                                    controller.selectedSpeaker.remove(item);
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          },
                                                      child: Icon(
                                                        Icons.cancel_outlined,
                                                        size: 12,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),

                            SizedBox(
                              height: 28.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  displayHostBottomSheet(context);
                                });
                              },
                              child: Container(
                                color: white_ffffff,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("TAG HOST",
                                        style: TextStyle(
                                            color: grey_aaaaaa,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: helvetica_neu_bold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp),
                                        textAlign: TextAlign.left),
                                    Icon(
                                      Icons.add,
                                      size: 15,
                                      color: orange_ff881a,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            controller.selectedHost.toString() == '[]'
                                ? Container()
                                : SizedBox(
                                    height: 14.h,
                                  ),
                            controller.selectedHost.toString() == '[]'
                                ? Container()
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Color(0xffebebeb),
                                    ),
                                    child: // Frame 8618

                                        Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 8,
                                          bottom: 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: controller.selectedHost[0]
                                                        .image ==
                                                    null
                                                ? SvgPicture.asset(
                                                    placeholder,
                                                    height: 17.h,
                                                    width: 17.w,
                                                    fit: BoxFit.cover,
                                                  )
                                                : CachedNetworkImage(
                                                    imageUrl: controller
                                                        .selectedHost[0].image!,
                                                    height: 17.h,
                                                    width: 17.w,
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            SvgPicture.asset(
                                                      placeholder,
                                                      height: 17.h,
                                                      width: 17.w,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            SvgPicture.asset(
                                                      placeholder,
                                                      height: 17.h,
                                                      width: 17.w,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          // @HennaBack
                                          Text(
                                              "@${controller.selectedHost[0].userName != null ? controller.selectedHost[0].userName! : controller.selectedHost[0].firstName ?? ""}",
                                              style: TextStyle(
                                                  color: black_121212,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Roboto",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 11.sp),
                                              textAlign: TextAlign.left),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              controller.selectedHost.clear();
                                            },
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              size: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: BlackButton("Next", Colors.white, () {
                      if(poster.toString() == "File: ''"){
                        snackBar(context, 'Please upload poster');
                        return;
                      }
                      if(controller.selectedSpeaker.toString() == '[]'){
                        snackBar(context, 'Please select speaker');
                        return;
                      }
                      if(controller.selectedHost.toString() == '[]'){
                        snackBar(context, 'Please select host');
                      }

                      List list = [];
                      list.clear();
                      for(var item in controller.selectedSpeaker){
                        list.add(item.id);
                      }

                      controller.speakers.value = list.join(',');
                      controller.host.value = controller.selectedHost[0].id.toString();

                      print(controller.selectedHost[0].toString());
                      print(controller.selectedSpeaker.join(',').toString());

                      Get.to(CreateEventDetail());
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectPhoto() {
    showImagePicker(context).then((value) {
      setState(() {
        if (imagePath.toString() != "File: ''") {
          poster = imagePath;
          controller.poster.value = imagePath.path.toString();
        }
      });
      print(imagePath.toString());
    });
  }
}
