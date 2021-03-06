import 'package:blackchecktech/Model/SpeakersVideoModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Controller/videoMenuController.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/VideoDetailTab.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../Layout/SearchBarWithRightIcon.dart';
import '../../../../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../../../../Styles/my_colors.dart';
import '../../../../Styles/my_icons.dart';
import '../../../../Utilities/Constant.dart';

class MyPlayList extends StatefulWidget {
  const MyPlayList({Key? key}) : super(key: key);

  @override
  _MyPlayListState createState() => _MyPlayListState();
}

class _MyPlayListState extends State<MyPlayList> {
  VideoMenuController controller = Get.find<VideoMenuController>();
  bool fullScreen = false;
  String search = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initScrolling(context);
    if (mounted) {
      controller.isLoading.value = true;
      controller.isLoadingButton.value = false;
    }
  }

  initScrolling(BuildContext context) {
    controller.scrollPlaylistController.addListener(() async {
      if (controller.scrollPlaylistController.position.maxScrollExtent ==
          controller.scrollPlaylistController.position.pixels) {
        scrollDown();
        controller.isPaginationLoading.value = true;
        await controller.myPlayListAPI();
        controller.isPaginationLoading.value = false;
      }
    });
  }

  void scrollDown() {
    controller.scrollPlaylistController
        .jumpTo(controller.scrollPlaylistController.position.maxScrollExtent);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (mounted) {
      controller.isLoading.value = false;
      controller.isLoadingButton.value = false;
      controller.playlistPageNo.value = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
                margin: EdgeInsets.only(top: 15.h),
                child: ToolbarWithHeaderCenterTitle("MY PLAY LIST")),
            SearchBarWithRightIcon(
              onSearch: (value) {
                search = value;
                controller.playlistPageNo.value = 0;
                controller.myPlayList.clear();
                controller.myPlayListAPI(search: value);
              },
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollPlaylistController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 12.h, left: 24.w, right: 24.w),
                            child:
                                // controller.isLoading.value
                                //     ? SizedBox(
                                //         width: double.infinity,
                                //         height: MediaQuery.of(context).size.height * 0.60,
                                //         child: const Center(
                                //             child: SizedBox(
                                //           height: 20,
                                //           width: 20,
                                //           child: CircularProgressIndicator(
                                //             strokeWidth: 2,
                                //             valueColor: AlwaysStoppedAnimation<Color>(
                                //                 Color(0xff04080f)),
                                //           ),
                                //         )))
                                // :
                                controller.myPlayList.isEmpty
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        width: double.infinity,
                                        child: const Center(
                                            child: Text("No Data Found",
                                                style: TextStyle(
                                                    color: grey_aaaaaa,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14))),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        primary: false,
                                        itemCount: controller.myPlayList.length,
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, i) {
                                          print(
                                              "::::::::::::UPDATE 00:::::::::::");
                                          // if (i < controller.myPlayList.length) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 20.h),
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(VideoDetailTab(
                                                    videoList: controller
                                                        .myPlayList[i]));
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
                                                            .center,
                                                        children: [
                                                          SizedBox(
                                                            height: 66.h,
                                                              width: 110.w,
                                                            child: FittedBox(
                                                              fit: BoxFit.fill,
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8.r)),
                                                                child:
                                                                    YoutubePlayerBuilder(
                                                                        onEnterFullScreen:
                                                                            () {
                                                                          fullScreen =
                                                                              false;
                                                                        },
                                                                        player:
                                                                            YoutubePlayer(
                                                                          bottomActions: const [
                                                                            SizedBox(width: 14.0),
                                                                            // CurrentPosition(),
                                                                            // const SizedBox(width: 8.0),
                                                                            // ProgressBar(),
                                                                            // RemainingDuration(),
                                                                            // const PlaybackSpeedButton(),
                                                                          ],
                                                                          controller: controller
                                                                              .playlistController
                                                                              .value[i],
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
                                                          Center(
                                                            child: SvgPicture
                                                                .asset(
                                                                    icon_play,width: 30,height: 30,),
                                                          ),
                                                          // Positioned(
                                                          //   bottom: 2,
                                                          //   right: 3,
                                                          //   child: Container(
                                                          //     margin: EdgeInsets
                                                          //         .only(
                                                          //             right:
                                                          //                 6.w,
                                                          //             bottom:
                                                          //                 6.h),
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
                                                          //         stops: [
                                                          //           0.0,
                                                          //           5.0
                                                          //         ],
                                                          //       ),
                                                          //     ),
                                                          //     child: Text(
                                                          //       "3.05",
                                                          //       style: TextStyle(
                                                          //           fontSize:
                                                          //               11.sp,
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
                                                              // SizedBox(
                                                              //   height: 3.h,
                                                              // ),
                                                              Text(
                                                                controller
                                                                    .myPlayList[
                                                                        i]
                                                                    .title
                                                                    .toString(),
                                                                softWrap: true,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 1,
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
                                                                            .myPlayList[
                                                                                i]
                                                                            .userDetails ==
                                                                        null
                                                                    ? ""
                                                                    : controller
                                                                        .myPlayList[
                                                                            i]
                                                                        .userDetails!
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
                                                                            .myPlayList[i]
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
                                                      SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: PopupMenuButton(
                                                          tooltip: "",
                                                            padding: EdgeInsets.all(0),
                                                            onSelected: (value) {
                                                              controller.removeFromPlaylist(
                                                                  context:
                                                                      context,
                                                                  videoId: controller
                                                                      .myPlayList[
                                                                          i]
                                                                      .id,
                                                                  index: i);
                                                            },
                                                            itemBuilder:
                                                                (context) => [
                                                                      const PopupMenuItem(
                                                                        child: Text(
                                                                            "Remove"),
                                                                        textStyle: TextStyle(
                                                                            color:
                                                                                black_121212,
                                                                            fontFamily:
                                                                                roboto_regular,
                                                                            fontSize:
                                                                                14),
                                                                        value: 1,
                                                                      ),
                                                                    ],
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          1),
                                                            ),

                                                            icon: Image.asset(
                                                              img_more,
                                                              width: 16.w,
                                                              height: 16.w,
                                                            )),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          );

                                          // } else {
                                          //   return controller.hasMore.value == false
                                          //       ? const SizedBox()
                                          //       : Container(
                                          //           margin: EdgeInsets.only(
                                          //               bottom: 25.h),
                                          //           child: Center(
                                          //             child: TextButton(
                                          //               onPressed: () {
                                          //                 controller.myPlayListPage
                                          //                     .value++;
                                          //                 controller
                                          //                     .pageMyPlayListAdd();
                                          //               },
                                          //               child: Text(
                                          //                 "Load More",
                                          //                 style: TextStyle(
                                          //                     fontFamily:
                                          //                         roboto_bold,
                                          //                     fontSize: 14.sp,
                                          //                     color: blue_0a84ff),
                                          //               ),
                                          //             ),
                                          //           ),
                                          //         );
                                          // }
                                        }),
                          ),
                          if (controller.isPaginationLoading.value == true)
                            PaginationUtils().loader(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
