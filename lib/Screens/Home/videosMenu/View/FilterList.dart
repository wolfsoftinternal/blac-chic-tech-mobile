import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../Styles/my_colors.dart';
import '../../../../Styles/my_icons.dart';
import '../../../../Utilities/Constant.dart';
import '../../../../Utils/pagination_utils.dart';
import '../Controller/videoMenuController.dart';
import 'VideoDetailTab.dart';


class FilterList extends StatefulWidget {
  const FilterList({Key? key}) : super(key: key);

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {

  VideoMenuController controller = Get.put(VideoMenuController());
  bool fullScreen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Obx(
                  () => controller.isLoadingBCT.value
                  ? const SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xff04080f))),
                      )))
                  : controller.videoList.isNotEmpty
                  ? Column(

                children: [
                  Container(
                    // height:
                    //     MediaQuery.of(context).size.height * 0.99,
                    // width: double.infinity,
                    margin: EdgeInsets.only(
                        top: 24.h, left: 12.w, right: 24.w),
                    child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        itemCount:
                        controller.videoList.length,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w),
                        itemBuilder: (context, i) {
                          // if (i < controller.videoList.length) {
                          return Padding(
                            padding:
                            EdgeInsets.only(bottom: 20.h),
                            child: InkWell(
                              onTap: () {
                                Get.to(VideoDetailTab(
                                    videoList: controller
                                        .videoList[i]));
                              },
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment
                                        .center,
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
                                                          .videoController
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
                                      // SizedBox(
                                      //         height: 80.h,
                                      //         width: 120.w,
                                      //         child: ClipRRect(
                                      //           borderRadius:
                                      //               const BorderRadius
                                      //                       .all(
                                      //                   Radius.circular(
                                      //                       15)),
                                      //           child: Html(
                                      //               data: controller
                                      //                   .videoList[
                                      //                       i]
                                      //                   .embededCode),
                                      //         )),
                                      // Stack(
                                      //   alignment:
                                      //       Alignment.bottomRight,
                                      //   children: [

                                      // Positioned(
                                      //   bottom: 2,
                                      //   right: 3,
                                      //   child: Container(
                                      //     margin:
                                      //         EdgeInsets.only(
                                      //             right: 6.w,
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
                                      //   ],
                                      // ),
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
                                                    .videoList[
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
                                                    .videoList[
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
                                                        .videoList[i]
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

                          // } else {
                          //   return controller.hasDataMore.value ==
                          //           true
                          //       ? const SizedBox(
                          //           width: double.infinity,
                          //           height: 50,
                          //           child: Center(
                          //               child: SizedBox(
                          //             height: 20,
                          //             width: 20,
                          //             child: CircularProgressIndicator(
                          //                 strokeWidth: 2,
                          //                 valueColor:
                          //                     AlwaysStoppedAnimation<
                          //                             Color>(
                          //                         Color(
                          //                             0xff04080f))),
                          //           )))
                          //       : Container(
                          //           margin: EdgeInsets.only(
                          //               bottom: 25.h),
                          //           child: Center(
                          //               child:
                          //                   Text("No More Data",
                          //                       style: TextStyle(
                          //                         fontFamily:
                          //                             roboto_bold,
                          //                         fontSize: 14.sp,
                          //                         color: const Color(
                          //                             0xff04080f),
                          //                       ))),
                          //         );
                          // }

                        }),
                  ),
                  if (controller.isPaginationLoading.value == true)
                    PaginationUtils().loader()
                ],
              )
                  : SizedBox(
                height:
                MediaQuery.of(context).size.height * 0.45,
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
              ),
            ),

          ],
        ),
      ],
    );
  }
}
