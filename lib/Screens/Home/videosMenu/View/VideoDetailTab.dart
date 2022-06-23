import 'package:blackchecktech/Screens/Home/videosMenu/Controller/videoMenuController.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/SpeakerVideoModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/VideoComments.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

class VideoDetailTab extends StatefulWidget {
  VideoList videoList;
  VideoDetailTab({required this.videoList, Key? key}) : super(key: key);

  @override
  _VideoDetailTabState createState() => _VideoDetailTabState();
}

class _VideoDetailTabState extends State<VideoDetailTab> {
  VideoMenuController controller = Get.find<VideoMenuController>();
  bool? button1, button2;
  bool fullScreen = false;

  @override
  void initState() {
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.playerController.clear();
        controller.videoDetailsList.clear();
        controller.isLoading.value = false;
        controller.videoDetailsAPI(id: widget.videoList.id);
        controller.videoListDetailsAPI(videoListData: widget.videoList);

        controller.isLoadingButton.value = false;
      });
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      controller.playerController[0].pause();
      controller.isLoading.value = false;
      controller.isLoadingButton.value = false;
      controller.playerController.clear();
      controller.videoDetailsList.clear();
    }
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: fullScreen == false ? Colors.white : Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (fullScreen == false)
              SizedBox(
                height: 5.h,
              ),
            if (fullScreen == false)
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10.w),
                  width: 48.r,
                  height: 48.r,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: SvgPicture.asset(
                      icon_back_black_arrow,
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 5.h,
            ),
            if (fullScreen == false)
              Container(
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(color: view_line_f4f6f6)),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.playerController.isEmpty
                          ? SizedBox(
                              height: 235.h,
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                  child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xff04080f)),
                                ),
                              )),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              height: fullScreen == true
                                  ? MediaQuery.of(context).size.height
                                  : 235.h,
                              child: YoutubePlayerBuilder(
                                  onEnterFullScreen: () {
                                    setState(() {
                                      fullScreen = true;
                                    });
                                    // Get.to(FullScreenVideo(
                                    //     controller:
                                    //         controller.playerController[0]));
                                  },
                                  onExitFullScreen: () {
                                    setState(() {
                                      fullScreen = false;
                                    });
                                  },
                                  player: YoutubePlayer(
                                    controller: controller.playerController[0],
                                  ),
                                  builder: (context, player) {
                                    return Column(
                                      children: [
                                        player,
                                      ],
                                    );
                                  }),
                            ),
                      if (fullScreen == false)
                        Container(
                          margin: const EdgeInsets.only(
                              left: 24, right: 24, bottom: 24, top: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff1c2535),
                                  Color(0xff04080f),
                                ],
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 24.w,
                                right: 24.w,
                                top: 10.5.h,
                                bottom: 10.5.h),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  icon_add_play_list,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                // Add to list
                                Expanded(
                                  flex: 1,
                                  child: Opacity(
                                    opacity: 0.699999988079071,
                                    child: controller.isLoadingButton.value ==
                                            true
                                        ? const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 8),
                                              child: SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.white),
                                                  )),
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              controller.addToPlatList(
                                                  context: context,
                                                  videoId: controller
                                                      .videoDetail.value.id);
                                            },
                                            child: Text("Add to list",
                                                style: TextStyle(
                                                    color: white_ffffff,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "NeueHelvetica",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left),
                                          ),
                                  ),
                                ),

                                GestureDetector(
                                    onTap: () {
                                      if (controller.isHeart.value) {
                                        controller.videoUnLike(
                                            context: context,
                                            videoId: controller
                                                .videoDetail.value.id);
                                      } else {
                                        controller.videoLike(
                                            context: context,
                                            videoId: controller
                                                .videoDetail.value.id);
                                      }
                                      // setState(() {
                                      //   controller.isHeart.value =
                                      //       !controller.isHeart.value;
                                      // });
                                    },
                                    child: SvgPicture.asset(
                                      icon_heart,
                                      width: 18.w,
                                      height: 18.h,
                                      color: controller.isHeart.value
                                          ? const Color(0xffff1f1f)
                                          : white_ffffff,
                                    )),
                                SizedBox(
                                  width: 4.w,
                                ),
                                // 1,2k
                                Text(
                                    controller.videoDetail.value.likeCount ==
                                            null
                                        ? ""
                                        : controller.videoDetail.value.likeCount
                                            .toString(),
                                    style: TextStyle(
                                        color: white_ffffff,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: "NeueHelvetica",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.left),

                                SizedBox(
                                  width: 20.w,
                                ),

                                InkWell(
                                  onTap: () {
                                    Get.to(VideoComments(
                                            videoId: controller
                                                .videoDetail.value.id!))!
                                        .then((value) {
                                      controller.videoDetailsAPI(
                                          id: widget.videoList.id);
                                      setState(() {});
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    icon_message,
                                    width: 18.w,
                                    height: 18.h,
                                  ),
                                ),

                                SizedBox(
                                  width: 20.w,
                                ),

                                InkWell(
                                  onTap: () {
                                    controller.playerController[0].pause();
                                    String data = controller
                                        .videoDetail.value.embededCode
                                        .toString()
                                        .replaceAll('"', "");
                                    String data1 = data.replaceAll(
                                        '<iframe width=560 height=315 src=',
                                        "");
                                    String data2 = data1.replaceAll(
                                        ' title=YouTube video player frameborder=0 allow=accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture allowfullscreen></iframe>',
                                        "");

                                    _onShare(context, data2);
                                  },
                                  child: SvgPicture.asset(
                                    icon_share,
                                    width: 18.w,
                                    height: 18.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (fullScreen == false)
                        Container(
                            width: double.infinity,
                            height: 1,
                            decoration:
                                const BoxDecoration(color: view_line_f4f6f6)),
                      if (fullScreen == false)
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SPEAKERS
                              Text("SPEAKERS",
                                  style: TextStyle(
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "NeueHelvetica",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.sp),
                                  textAlign: TextAlign.left),

                              SizedBox(
                                height: 12.h,
                              ),

                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(60),
                                    child: CachedNetworkImage(
                                      imageUrl: controller.videoDetail.value
                                                  .userDetails ==
                                              null
                                          ? ""
                                          : controller.videoDetail.value
                                              .userDetails!.image
                                              .toString(),
                                      height: 66.h,
                                      width: 66.w,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              SvgPicture.asset(
                                        placeholder,
                                        height: 44.h,
                                        width: 44.w,
                                        fit: BoxFit.cover,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          SvgPicture.asset(
                                        placeholder,
                                        height: 44.h,
                                        width: 44.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 66.w,
                                  //   height: 66.h,
                                  //   child: CircularProfileAvatar(
                                  //     '',
                                  //     child: Image.asset(
                                  //       grid_img_one,
                                  //       fit: BoxFit.fill,
                                  //     ),
                                  //     borderColor: Colors.purpleAccent,
                                  //     borderWidth: 0,
                                  //     elevation: 0,
                                  //     imageFit: BoxFit.fill,
                                  //     radius: 50,
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: 24.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          // Maria Van Dejong
                                          Text(
                                              widget.videoList.userDetails
                                                  .fullName
                                                  .toString(),
                                              style: TextStyle(
                                                  color: black_121212,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "NeueHelvetica",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 16.sp),
                                              textAlign: TextAlign.left),
                                          SvgPicture.asset(
                                            icon_tick_blue,
                                            width: 22.w,
                                            height: 22.w,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),

                                      // Product manager and brand strategist @capitalone
                                      Text(
                                          controller.videoDetail.value
                                                      .userDetails ==
                                                  null
                                              ? ""
                                              : controller
                                                      .videoDetail
                                                      .value
                                                      .userDetails!
                                                      .currentJobs!
                                                      .title
                                                      .toString() +
                                                  "\n@" +
                                                  controller
                                                      .videoDetail
                                                      .value
                                                      .userDetails!
                                                      .currentJobs!
                                                      .companyName
                                                      .toString(),
                                          style: TextStyle(
                                              color: const Color(0xff3f3f3f),
                                              fontWeight: FontWeight.w500,
                                              fontFamily: "NeueHelvetica",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.sp),
                                          textAlign: TextAlign.left)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      if (fullScreen == false)
                        Container(
                            width: double.infinity,
                            height: 1,
                            decoration:
                                const BoxDecoration(color: view_line_f4f6f6)),

                      // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel vitae malesuada faucibus vitae cursus s
                      if (fullScreen == false)
                        Padding(
                          padding: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 16.h, bottom: 16.h),
                          child: Text(
                              controller.videoDetail.value.embededCode == null
                                  ? ""
                                  : controller
                                      .videoDetail.value.userDetails!.aboutUs!
                                      .toString(),
                              style: TextStyle(
                                  color: const Color(0xff3f3f3f),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NeueHelvetica",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                  height: 1.5),
                              textAlign: TextAlign.left),
                        ),
                      if (fullScreen == false)
                        Container(
                            width: double.infinity,
                            height: 1,
                            decoration:
                                const BoxDecoration(color: view_line_f4f6f6)),
                      if (fullScreen == false)
                        Container(
                          height: 200.h,
                          margin: EdgeInsets.only(
                              left: 24.w, right: 24.w, top: 16.h, bottom: 16.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: const Color(0x80f2f2f2),
                              border: Border.all(
                                  width: 1, color: const Color(0x4caaaaaa))),
                          child: DefaultTabController(
                              length: 2,
                              child: Scaffold(
                                backgroundColor: Color(0x80f2f2f2),
                                appBar: TabBar(
                                  isScrollable: true,
                                  indicatorColor: orange_ff881a,
                                  indicatorWeight: 3,
                                  padding: EdgeInsets.zero,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelColor: black_121212,
                                  unselectedLabelColor: grey_aaaaaa,
                                  labelPadding: EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 0),
                                  tabs: <Widget>[
                                    Tab(
                                      child: // DETAILS
                                          Text("DETAILS",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "NeueHelvetica",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.sp),
                                              textAlign: TextAlign.left),
                                    ),
                                    Tab(
                                      child: // RELATED TAGS
                                          Text("RELATED TAGS",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "NeueHelvetica",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.sp),
                                              textAlign: TextAlign.left),
                                    ),
                                  ],
                                ),
                                body: TabBarView(
                                  children: <Widget>[
                                    Container(
                                      child: SafeArea(
                                          child: Scaffold(
                                        backgroundColor:
                                            const Color(0x80f2f2f2),
                                        body: Padding(
                                          padding: EdgeInsets.only(
                                              left: 16.w, right: 16.w),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 24.h,
                                                ),
                                                // Black Chic Tech | December 2021
                                                RichText(
                                                    text: TextSpan(children: [
                                                  const TextSpan(
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff3f3f3f),
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily:
                                                              "NeueHelvetica",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 12.0),
                                                      text: "Black Chic Tech "),
                                                  const TextSpan(
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff3f3f3f),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              "NeueHelvetica",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 12.0),
                                                      text: " "),
                                                  TextSpan(
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xffaaaaaa),
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontFamily:
                                                              "NeueHelvetica",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 12.0),
                                                      text: controller
                                                                  .videoDetail
                                                                  .value
                                                                  .createdAt
                                                                  .toString() ==
                                                              "null"
                                                          ? ""
                                                          : "| " +
                                                              DateFormat.yMMMM()
                                                                  .format(DateTime.parse(controller
                                                                      .videoDetail
                                                                      .value
                                                                      .createdAt
                                                                      .toString()))
                                                                  .toString())
                                                ])),

                                                SizedBox(
                                                  height: 16.h,
                                                ),

                                                // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum ut morbi nulla nisl montes, id pe
                                                Text(
                                                    controller.videoDetail.value
                                                                .embededCode ==
                                                            null
                                                        ? ""
                                                        : controller.videoDetail
                                                            .value.description!
                                                            .toString(),
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff3f3f3f),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            "NeueHelvetica",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 12.0),
                                                    textAlign: TextAlign.left)
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                    ),
                                    Container(
                                      child: SafeArea(
                                        child: Scaffold(
                                            backgroundColor:
                                                const Color(0x80f2f2f2),
                                            body: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.w,
                                                    right: 16.w,
                                                    top: 16,
                                                    bottom: 16),
                                                child: Wrap(
                                                  children: controller.result
                                                      .map((element) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.r),
                                                                color: const Color(
                                                                    0xff1c2535),
                                                              ),
                                                              child: // Africans
                                                                  Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 16
                                                                            .w,
                                                                        right: 16
                                                                            .w,
                                                                        top:
                                                                            8.h,
                                                                        bottom:
                                                                            8.h),
                                                                child: Text(
                                                                    element
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color:
                                                                            white_ffffff,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontFamily:
                                                                            "NeueHelvetica",
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize: 12
                                                                            .sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                ))),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      if (fullScreen == false)
                        Container(
                            width: double.infinity,
                            height: 1,
                            decoration:
                                const BoxDecoration(color: view_line_f4f6f6)),
                      if (fullScreen == false)
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SPEAKERS
                              Text("WATCH NEXT",
                                  style: TextStyle(
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "NeueHelvetica",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.sp),
                                  textAlign: TextAlign.left),

                              Obx(
                                () => Container(
                                  margin: EdgeInsets.only(
                                      top: 24.h, left: 0.w, right: 0.w),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      primary: false,
                                      itemCount:
                                          controller.videoDetailsList.length +
                                              1,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, i) {
                                        if (i <
                                            controller
                                                .videoDetailsList.length) {
                                          print(
                                              "::::::::::::UPDATE 00:::::::::::");
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20.h),
                                            child: InkWell(
                                              onTap: () {
                                                // Get.back();
                                                Navigator.pushReplacement<void,
                                                    void>(
                                                  context,
                                                  MaterialPageRoute<void>(
                                                    builder: (BuildContext
                                                            context) =>
                                                        VideoDetailTab(
                                                            videoList: controller
                                                                .videoDetailsList[i]),
                                                  ),
                                                );
                                              },
                                              child: SizedBox(
                                                  width: double.infinity,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Stack(
                                                        alignment: Alignment
                                                            .bottomRight,
                                                        children: [
                                                          SizedBox(
                                                            height: 80.h,
                                                            width: 120.w,
                                                            child: FittedBox(
                                                              fit: BoxFit.fill,
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15.r)),
                                                                child:
                                                                    YoutubePlayerBuilder(
                                                                        player:
                                                                            YoutubePlayer(
                                                                          controller:
                                                                              controller.videoDetailsNextController[i],
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                player) {
                                                                          return Column(
                                                                            children: [
                                                                              player,
                                                                            ],
                                                                          );
                                                                        }),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                              top: 20,
                                                              right: 42,
                                                              child: SvgPicture
                                                                  .asset(
                                                                      icon_play)),
                                                          // Positioned(
                                                          //   bottom: 2,
                                                          //   right: 3,
                                                          //   child: Container(
                                                          //     margin:
                                                          //         EdgeInsets.only(
                                                          //             right: 6.w,
                                                          //             bottom: 6.h),
                                                          //     padding: EdgeInsets
                                                          //         .symmetric(
                                                          //             vertical:
                                                          //                 1.5.h,
                                                          //             horizontal:
                                                          //                 6.w),
                                                          //     decoration:
                                                          //         BoxDecoration(
                                                          //       borderRadius:
                                                          //           BorderRadius
                                                          //               .circular(
                                                          //                   4),
                                                          //       gradient:
                                                          //           const LinearGradient(
                                                          //         begin: Alignment
                                                          //             .topCenter,
                                                          //         end: Alignment
                                                          //             .bottomCenter,
                                                          //         colors: [
                                                          //           Color(
                                                          //               0xff1c2535),
                                                          //           Color(
                                                          //               0xff04080f)
                                                          //         ],
                                                          //         stops: [0.0, 5.0],
                                                          //       ),
                                                          //     ),
                                                          //     child: Text(
                                                          //       "3.05",
                                                          //       style: TextStyle(
                                                          //           fontSize: 11.sp,
                                                          //           color: Colors
                                                          //               .white,
                                                          //           fontFamily:
                                                          //               helveticaNeueNeue_medium),
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 8.w,
                                                                  right: 10.w),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 3.h,
                                                              ),
                                                              Text(
                                                                controller
                                                                    .videoDetailsList[
                                                                        i]
                                                                    .title
                                                                    .toString(),
                                                                softWrap: true,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 2,
                                                                style: const TextStyle(
                                                                    fontFamily:
                                                                        helvetica_neu_bold,
                                                                    color:
                                                                        black_121212,
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                              SizedBox(
                                                                height: 8.h,
                                                              ),
                                                              Text(
                                                                controller
                                                                    .videoDetailsList[
                                                                        i]
                                                                    .userDetails
                                                                    .fullName
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    fontFamily:
                                                                        helveticaNeueNeue_medium,
                                                                    color:
                                                                        opcity_black_121212,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                              SizedBox(
                                                                height: 2.h,
                                                              ),
                                                              Text(
                                                                "Posted " +
                                                                    DateFormat
                                                                            .yMMMM()
                                                                        .format(DateTime.parse(controller
                                                                            .videoDetailsList[i]
                                                                            .createdAt
                                                                            .toString()))
                                                                        .toString(),
                                                                style: const TextStyle(
                                                                    fontFamily:
                                                                        helveticaNeueNeue_medium,
                                                                    color:
                                                                        opcity_black_121212,
                                                                    fontSize:
                                                                        8),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          );
                                        } else {
                                          return controller.hasMore.value ==
                                                  false
                                              ? const SizedBox()
                                              : Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 25.h),
                                                  child: Center(
                                                    child: TextButton(
                                                      onPressed: () {
                                                        controller
                                                            .detailsVideoPage
                                                            .value++;
                                                        controller
                                                            .videoListDetailsAPI(
                                                                videoListData:
                                                                    widget
                                                                        .videoList);
                                                      },
                                                      child: Text(
                                                        "Load More",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                roboto_bold,
                                                            fontSize: 14.sp,
                                                            color: blue_0a84ff),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                        }
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onShare(BuildContext context, String Url) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(Url,
        subject: Url,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

// class FullScreenVideo extends StatelessWidget {
//   YoutubePlayerController controller;
//   FullScreenVideo({super.key, required this.controller});
//   onWillPop() {
//     Get.back();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: onWillPop(),
//       child: OrientationBuilder(
//           builder: (BuildContext context, Orientation orientation) {
//         if (orientation == Orientation.landscape) {
//           return Scaffold(
//             body: youtubeHierarchy(controller),
//           );
//         } else {
//           return Scaffold(
//             body: youtubeHierarchy(controller),
//           );
//         }
//       }),
//     );
//   }

//   Widget youtubeHierarchy(YoutubePlayerController videoController) {
//     return Container(
//       child: Align(
//         alignment: Alignment.center,
//         child: FittedBox(
//           fit: BoxFit.fill,
//           child: YoutubePlayer(
//             controller: videoController,
//           ),
//         ),
//       ),
//     );
//   }
// }
