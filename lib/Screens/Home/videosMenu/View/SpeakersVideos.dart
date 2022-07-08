import 'package:blackchecktech/Screens/Home/videosMenu/Controller/videoMenuController.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/SpeakerVideoModel.dart';
import 'package:blackchecktech/Model/SpeakersVideoModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/VideoDetailTab.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
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

class SpeakersVideos extends StatefulWidget {
  int id;
  String name;
  SpeakersVideos({required this.id, required this.name, Key? key}) : super(key: key);

  @override
  _SpeakersVideosState createState() => _SpeakersVideosState();
}

class _SpeakersVideosState extends State<SpeakersVideos> {
  VideoMenuController controller = Get.find<VideoMenuController>();
  String search = '';
  bool fullScreen = false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   controller.speakerDataVideoAPI(search: "", videoId: widget.id);
  // }
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
    controller.scrollVideoController.addListener(() async {
      if (controller.scrollVideoController.position.maxScrollExtent ==
          controller.scrollVideoController.position.pixels) {
        scrollDown();
        controller.isPaginationLoading.value = true;
        
        await controller.speakerDataVideoAPI(search: search, videoId: widget.id);
        controller.isPaginationLoading.value = false;
      }
    });
  }

  void scrollDown() {
    controller.scrollVideoController.jumpTo(
        controller.scrollVideoController.position.maxScrollExtent);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (mounted) {
      controller.isLoading.value = false;
      controller.isLoadingButton.value = false;
      controller.videoPageNo.value = 0;
      controller.speakerList.clear();
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
            SizedBox(height: 50,),
            Container(
                          margin: EdgeInsets.only(top: 15.h),
                          child:
                              ToolbarWithHeaderCenterTitle(widget.name.capitalize)),
                      SearchBarWithRightIcon(
                        onSearch: (value) {
                          controller.speakerList.clear();
                          controller.videoPageNo.value = 0;
                          search = value;
                          controller.speakerDataVideoAPI(search: value.toString(), videoId: widget.id);
                        }
                      ),
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollVideoController,
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      
                      Container(
                        margin: EdgeInsets.only(
                            top: 24.h, left: 24.w, right: 24.w),
                        child: 
                        // controller.isLoading.value
                        //     ? const SizedBox(
                        //         width: double.infinity,
                        //         height: 100,
                        //         child: Center(
                        //             child: SizedBox(
                        //           height: 20,
                        //           width: 20,
                        //           child: CircularProgressIndicator(
                        //             strokeWidth: 2,
                        //             valueColor: AlwaysStoppedAnimation<Color>(
                        //                 Color(0xff04080f)),
                        //           ),
                        //         )))
                        //     : 
                            controller.speakerList.length == 0
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
                                    itemCount:
                                        controller.speakerList.length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, i) {
                                      // if (i < controller.speakerList.length) {
                                      //   print(
                                      //       "::::::::::::UPDATE 00:::::::::::");
                                        return Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 20.h),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(VideoDetailTab(
                                                  videoList: controller
                                                      .speakerList[i]));
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                              children: [
                                                Stack(
                                                  alignment: Alignment.center,
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
                                                                                15.r)),
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
                                                                                  .speakerVideoController
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
                                                              SvgPicture
                                                                  .asset(
                                                                      icon_play,width: 25,height: 25,),
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
                                                              .speakerList[
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
                                                              .speakerList[
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
                                                                      .speakerList[i]
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
                                            ),
                                          ),
                                        );
                                      // } else {
                                      //   return controller.hasMore.value ==
                                      //           false
                                      //       ? const SizedBox()
                                      //       : Container(
                                      //           margin: EdgeInsets.only(
                                      //               bottom: 25.h),
                                      //           child: Center(
                                      //             child: TextButton(
                                      //               onPressed: () {
                                      //                 controller
                                      //                     .speakerListPage
                                      //                     .value++;
                                      //                 controller
                                      //                     .speakerDataVideoPageAdd();
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
