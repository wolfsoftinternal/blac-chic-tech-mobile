import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Model/BusinessTypeModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Controller/videoMenuController.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/VideoDetailTab.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/A_TopicaList.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Widget/search_bar_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SearchVideoList extends StatefulWidget {
  const SearchVideoList({Key? key}) : super(key: key);

  @override
  _SearchVideoListState createState() => _SearchVideoListState();
}

class _SearchVideoListState extends State<SearchVideoList> {
  VideoMenuController controller = Get.find<VideoMenuController>();

  String myposition = "";
  var list;
  String search = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initScrolling(context);
    if (mounted) {
      controller.isLoading.value = false;
      controller.isLoadingButton.value = false;
    }
  }

  initScrolling(BuildContext context) {
    controller.scrollSearchListController.addListener(() async {
      if (controller.scrollSearchListController.position.maxScrollExtent ==
          controller.scrollSearchListController.position.pixels) {
        scrollDown();
        controller.isPaginationLoading.value = true;
        controller.searchListPageNo =  controller.searchListPageNo + 1;
        await controller.videoListSearchAPI(topicFilter: search);
        controller.isPaginationLoading.value = false;
      }
    });
  }

  void scrollDown() {
    controller.scrollSearchListController
        .jumpTo(controller.scrollSearchListController.position.maxScrollExtent);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (mounted) {
      controller.isLoading.value = false;
      controller.isLoadingButton.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only( top: 50.h, right: 24.w),
        child: Column(
          children: [
            Row(
              children: [
                BackLayout(),
                // Container(
                //   child: GestureDetector(
                //     onTap: () {
                //       Navigator.pop(context);
                //     },
                //     child: Container(
                //       width: 48.r,
                //       height: 48.r,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         shape: BoxShape.circle,
                //         // borderRadius: BorderRadius.circular(10.r),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.1),
                //             spreadRadius: 6,
                //             blurRadius: 10,
                //             offset: const Offset(
                //                 1, 4), // changes position of shadow
                //           ),
                //         ],
                //       ),
                //       child: Padding(
                //         padding: EdgeInsets.all(5.0.r),
                //         child: SvgPicture.asset(
                //           icon_cancel,
                //           width: 30.w,
                //           height: 30.w,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Spacer(),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Center(
                      child: // TOPICS
                          Text("SEARCH",
                              style: TextStyle(
                                  color: Color(0xff121212),
                                  fontWeight: FontWeight.w900,
                                  fontFamily: helveticaNeue,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                              textAlign: TextAlign.left)),
                ),
                Spacer(),
                Container(height: 48.h, width: 48.h,),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.0.w),
              child: SearchBarDemo(
                autoFoucs: true,
                onChanged: (text) {
                  controller.videoAllList.clear();
                  controller.searchListPageNo.value = 0;
                  search = text;
                  controller.videoListSearchAPI(topicFilter: text);
                },
                placeholder: "Search Video...",
                fillcolor: Color(0xfff5f5f5),
              ),
            ),

            SizedBox(
              height: 14.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollSearchListController,
                child: Obx(
                  () => Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10.h, left: 24.w, right: 0.w),
                        child: 
                        // controller.isLoading.value
                            // ? SizedBox(
                            //     width: double.infinity,
                            //     height: MediaQuery.of(context).size.height * 0.60,
                            //     child: Center(
                            //         child: CircularProgressIndicator(
                            //           strokeWidth: 2,
                            //       valueColor: AlwaysStoppedAnimation<Color>(
                            //           Color(0xff04080f)),
                            //     )))
                            // : 
                            controller.videoAllList.length == 0
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.5,
                                    width: double.infinity,
                                    child: const Center(
                                        child: Text("No Data Found",
                                            style: TextStyle(
                                                color: grey_aaaaaa,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: helveticaNeueNeue_medium,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14))),
                                  )
                                : ListView.builder(
                                  physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: controller.videoAllList.length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, i) {
                                      if (i < controller.videoAllList.length) {
                                        print("::::::::::::UPDATE 00:::::::::::");
                                        return Padding(
                                          padding: EdgeInsets.only(bottom: 20.h),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(VideoDetailTab(
                                                  videoList:
                                                      controller.videoAllList[i]));
                                            },
                                            child: SizedBox(
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        SizedBox(
                                                        height: 66.h,
                                                              width: 110.w,
                                                        child: FittedBox(
                                                          fit: BoxFit.fill,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        15.r)),
                                                            child:
                                                                YoutubePlayerBuilder(
                                                                    player:
                                                                        YoutubePlayer(
                                                                      controller:
                                                                          controller
                                                                              .searchVideoList[i],
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
                                                            SvgPicture.asset(icon_play,width: 25,height: 25,),
                                                          
                                                        // Positioned(
                                                        //   bottom: 2,
                                                        //   right: 3,
                                                        //   child: Container(
                                                        //     margin: EdgeInsets.only(
                                                        //         right: 6.w,
                                                        //         bottom: 6.h),
                                                        //     padding:
                                                        //         EdgeInsets.symmetric(
                                                        //             vertical: 1.5.h,
                                                        //             horizontal: 6.w),
                                                        //     decoration: BoxDecoration(
                                                        //       borderRadius:
                                                        //           BorderRadius
                                                        //               .circular(4),
                                                        //       gradient:
                                                        //           const LinearGradient(
                                                        //         begin: Alignment
                                                        //             .topCenter,
                                                        //         end: Alignment
                                                        //             .bottomCenter,
                                                        //         colors: [
                                                        //           Color(0xff1c2535),
                                                        //           Color(0xff04080f)
                                                        //         ],
                                                        //         stops: [0.0, 5.0],
                                                        //       ),
                                                        //     ),
                                                        //     child: Text(
                                                        //       "3.05",
                                                        //       style: TextStyle(
                                                        //           fontSize: 11.sp,
                                                        //           color: Colors.white,
                                                        //           fontFamily:
                                                        //               helveticaNeueNeue_medium),
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 8.w, right: 10.w),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            // SizedBox(
                                                            //   height: 3.h,
                                                            // ),
                                                            Text(
                                                              controller
                                                                  .videoAllList[i]
                                                                  .title
                                                                  .toString(),
                                                              softWrap: true,
                                                              overflow: TextOverflow
                                                                  .ellipsis,
                                                              maxLines: 1,
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      helvetica_neu_bold,
                                                                  color: black_121212,
                                                                  fontSize: 14),
                                                            ),
                                                            SizedBox(
                                                              height: 8.h,
                                                            ),
                                                            Text(
                                                              controller
                                                                  .videoAllList[i]
                                                                  .userDetails!
                                                                  .fullName
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      helveticaNeueNeue_medium,
                                                                  color:
                                                                      opcity_black_121212,
                                                                  fontSize: 10),
                                                            ),
                                                            SizedBox(
                                                              height: 2.h,
                                                            ),
                                                            Text(
                                                              "Posted " +
                                                                  DateFormat.yMMMM()
                                                                      .format(DateTime
                                                                          .parse(controller
                                                                              .videoAllList[
                                                                                  i]
                                                                              .createdAt
                                                                              .toString()))
                                                                      .toString(),
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      helveticaNeueNeue_medium,
                                                                  color:
                                                                      opcity_black_121212,
                                                                  fontSize: 8),
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
                                        return controller.hasMore.value == false
                                            ? const SizedBox()
                                            : Container(
                                                margin: EdgeInsets.only(bottom: 25.h),
                                                child: Center(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      controller
                                                          .searchVideoPage.value++;
                                                      controller.searchVideoMethod();
                                                    },
                                                    child: Text(
                                                      "Load More",
                                                      style: TextStyle(
                                                          fontFamily: roboto_bold,
                                                          fontSize: 14.sp,
                                                          color: blue_0a84ff),
                                                    ),
                                                  ),
                                                ),
                                              );
                                      }
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
