import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/SpeakerVideoModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/FilterTopicList.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/FindSpeaker.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/MyPlayList.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/SearchVideoList.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Controller/videoMenuController.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Model/TopicModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/VideoDetailTab.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_height.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/SpinnerDecorationBorder.dart';
import 'package:blackchecktech/Widget/search_bar_demo.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'FilterList.dart';

class VideoListBct extends StatefulWidget {
  const VideoListBct({Key? key}) : super(key: key);

  @override
  _VideoListBctState createState() => _VideoListBctState();
}

class _VideoListBctState extends State<VideoListBct> {
  VideoMenuController controller = Get.put(VideoMenuController());
  bool fullScreen = false;
  String topic = '';
  String language = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initScrolling(context);
    controller.videoList.clear();
    controller.isLoadingBCT.value = true;
    controller.videoListApi();

    if (mounted) {
      controller.isLoading.value = true;
      controller.isLoadingButton.value = false;
    }
  }

  initScrolling(BuildContext context) {
    
    controller.scrollListController.addListener(() async {
      if (controller.scrollListController.position.maxScrollExtent ==
          controller.scrollListController.position.pixels) {
        scrollDown();
        controller.isPaginationLoading.value = true;
        controller.pageNo = controller.pageNo + 1;

        await controller.videoListApi(topicFilter: controller
                                                  .selectIdTopic
                                                  .toJson()
                                                  .toString(),
                                              languageFilter: controller
                                                  .selectIdLanguage
                                                  .toJson()
                                                  .toString());
        controller.isPaginationLoading.value = false;
      }
    });
  }

  void scrollDown() {
    controller.scrollListController.jumpTo(controller.scrollListController.position.maxScrollExtent);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (mounted) {
      controller.isLoading.value = false;
      controller.isLoadingButton.value = false;
      controller.selectedTopic.value = TopicListModel();
      controller.selectedLanguage.value = TopicListModel();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Column(children: [
        Container(
          color: light_grey_f2f2f2,
          child: Padding(
            padding: EdgeInsets.only(top: 33.h, right: 24.w),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  //         padding: EdgeInsets.all(12.0.r),
                  //         child: SvgPicture.asset(
                  //           icon_back_black_arrow,
                  //           width: 24.w,
                  //           height: 24.w,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Center(
                      child: Image.asset(
                    bct_logo,
                    width: 58.w,
                    height: 58.h,
                  )),
                  SizedBox(
                    width: 58.w,
                    height: 58.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: NestedScrollView(
            controller: controller.scrollListController,
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        color: light_grey_f2f2f2,
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),

                            Obx(
                                  () => Text(
                                  controller.totalVideoCount.value +
                                      "+ Life & Tech Talks \nto help you navigate.",
                                  style: TextStyle(
                                      color: black_121212,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: helvetica_neu_bold,
                                      letterSpacing: 1.2,
                                      height: 1.3,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 24.sp),
                                  textAlign: TextAlign.center),
                            ),

                            SizedBox(
                              height: 16.h,
                            ),

                            // Find the right one.
                            Text("Find the right one.",
                                style: TextStyle(
                                    color: grey_aaaaaa,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: helveticaNeueNeue_medium,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                textAlign: TextAlign.left),


                            SizedBox(
                              height: 30.h,
                            ),


                          ],
                        ),
                      ),

                    ],
                  ),
                )
              ];
            },
            body: Column(
              children: [

                Container(
                  color: light_grey_f2f2f2,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w, right: 24.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SearchBarDemo(
                              readOnly: true,
                              onTap: () {
                                setState(() {
                                  controller.isTextChange.value = false;
                                  controller.isLayoutFirst.value = false;
                                  controller.filter.value = 'More filters';
                                });
                                controller.selectedTopic.value =
                                    TopicListModel();
                                controller.selectedLanguage.value =
                                    TopicListModel();
                                controller.selectedTopic.value.id = -1;
                                controller.selectedLanguage.value.id = -1;
                                controller.selectMutiTopicList.clear();
                                controller.selectMutiLanguList.clear();

                                controller.findSpeakerApi(search: "");

                                Get.to(SearchVideoList());
                              },
                              onChanged: (text) {},
                              placeholder: "Search Talks...",
                              fillcolor: white_ffffff,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color:
                                  const Color(0x17747796).withOpacity(0.07),
                                  spreadRadius: 10,
                                  blurRadius: 5,
                                  offset: const Offset(
                                      0, 10), // changes position of shadow
                                ),
                              ]),
                              child: SizedBox(
                                width: double.infinity,
                                //height: HeightData.fiftyfive,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(255, 36, 48, 69),  Color(0xff04080f)
                                      ],
                                      stops: [0.0, 1.0],
                                    ),
                                  ),
                                  child: ElevatedButton(
                                      child: //
                                      Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              // setHelveticaBoldCenter(
                                              //     inputText,
                                              //     16,
                                              //     textColor,
                                              //     FontWeight.normal,
                                              //     FontStyle.normal,
                                              //     TextAlign.center),

                                              Text(
                                                "Find a Speaker",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                    fontFamily:
                                                    helvetica_neu_bold,
                                                    fontSize: 14.sp),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                            EdgeInsets.only(right: 16.w),
                                            child: SvgPicture.asset(
                                              icon_next_arrow,
                                              width: 16.r,
                                              height: 16.r,
                                            ),
                                          )
                                        ],
                                      ), // Button
                                      onPressed: () {
                                        setState(() {
                                          controller.isTextChange.value = false;
                                          controller.isLayoutFirst.value =
                                          false;
                                        });
                                        controller.selectedTopic.value =
                                            TopicListModel();
                                        controller.selectedLanguage.value =
                                            TopicListModel();
                                        controller.selectedTopic.value.id = -1;
                                        controller.selectedLanguage.value.id =
                                        -1;
                                        controller.selectMutiTopicList.clear();
                                        controller.selectMutiLanguList.clear();

                                        controller.findSpeakerApi(search: "");

                                        Get.to(FindSpeaker());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        onSurface: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 18),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(4),
                                          side: const BorderSide(
                                              color: black_121212, width: 0),
                                        ),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),


                Container(
                    width: double.infinity,
                    height: 1,
                    decoration: const BoxDecoration(color: Color(0xffebebeb))),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if(controller.clearFilter.value == true){
                            controller.selectedLanguage.value.id = -1;
                            controller.selectedTopic.value.id = -1;
                            controller.selectMutiTopicList.clear();
                            controller.selectMutiLanguList.clear();
                            controller.selectIdTopic.clear();
                            controller.selectIdLanguage.clear();

                            controller.videoList.clear();
                            controller.pageNo.value = 1;
                            controller.isLoadingBCT.value = true;
                            controller.videoListApi();
                            controller.filter.value = 'Close filters';
                            controller.clearFilter.value = false;
                            controller.isTextChange.value = true;
                            controller.isLayoutFirst.value = true;
                            setState(() {});
                          }else if (controller.isTextChange.value =
                          !controller.isTextChange.value) {
                            controller.isLayoutFirst.value = true;
                            controller.filter.value = 'Close filters';
                          } else {
                            controller.isLayoutFirst.value = false;
                            controller.filter.value = 'More filters';
                          }
                          
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            icon_filter_orange,
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          // More filters
                          Text(
                              controller.filter.value,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: roboto_bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp),
                              textAlign: TextAlign.left)
                        ],
                      ),
                    ),
                    Container(
                        width: 1,
                        height: 48.h,
                        decoration:
                        const BoxDecoration(color: Color(0xffebebeb))),
                    InkWell(
                      onTap: () {
                        controller.myPlayListAPI(search: "");
                        Get.to(MyPlayList());
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            icon_play_list_orange,
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          // More filters
                          Text("My play list",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontFamily: roboto_bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp),
                              textAlign: TextAlign.left)
                        ],
                      ),
                    ),
                  ],
                ),

                Container(
                  width: double.infinity,
                  height: 1,
                  decoration: const BoxDecoration(color: Color(0xffebebeb)),
                ),

                Obx(
                          () => Visibility(
                            visible: controller.isLayoutFirst.value,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 24.w,
                                right: 24.w,
                                top: 24.h,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: double.infinity,
                                    decoration: SpinnerDecorationBorder,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<TopicListModel>(
                                          value: controller
                                                      .selectedTopic.value.id ==
                                                  -1
                                              ? null
                                              : controller.selectedTopic.value,
                                          hint: Text("Topic",
                                              style: TextStyle(
                                                  color: grey_aaaaaa,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      helveticaNeueNeue_medium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.sp),
                                              textAlign: TextAlign.left),
                                          icon: SvgPicture.asset(
                                            icon_down_arrow_spinner,
                                            width: 12.r,
                                            height: 12.r,
                                          ),
                                          onChanged: (TopicListModel? value) {
                                            controller.selectedTopic.value =
                                                value!;
                                            if (controller
                                                    .selectedTopic.value.name !=
                                                "SEE ALL TOPICS") {
                                              if (!controller.selectMutiTopicList
                                                  .contains(value)) {
                                                controller.selectMutiTopicList
                                                    .add(value);
                                              }
                                            } else {
                                              controller.selectedTopic.value =
                                                  TopicListModel(id: -1);
                                              Get.to(FilterTopicList());
                                            }
                                            controller.selectedTopic.value.id =
                                                -1;
                                          },
                                          isExpanded: true,
                                          customItemsHeight: 4,
                                          iconEnabledColor: black_121212,
                                          iconDisabledColor: Colors.grey,
                                          buttonHeight: 60,
                                          buttonWidth: double.infinity,
                                          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                          buttonDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: white,
                                          ),
                                          itemHeight: 35,
                                          itemPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                                          items: controller.topicList
                                              .map((TopicListModel value) {
                                            return DropdownMenuItem<
                                                TopicListModel>(
                                              value: value,
                                              child: Text(value.name.toString(),
                                                  style: TextStyle(
                                                      color: value.name ==
                                                              "SEE ALL TOPICS"
                                                          ? grey_aaaaaa
                                                          : black_121925,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 14.sp)),
                                            );
                                          }).toList()),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Wrap(
                                        direction: Axis.horizontal,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        children: controller.selectMutiTopicList
                                            .map((element) => Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 6),
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller.selectMutiTopicList
                                                          .remove(element);
                                                    },
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xfff5f5f5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(15)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Wrap(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left: 4.0),
                                                                child: Text(
                                                                    element.name!,
                                                                    style: TextStyle(
                                                                        color:
                                                                            black_121925,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontFamily:
                                                                            helveticaNeueNeue_medium,
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            14.sp)),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 2.5,
                                                                        left: 4),
                                                                child: Icon(
                                                                  Icons.close,
                                                                  color:
                                                                      grey_aaaaaa,
                                                                  size: 13.r,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                ))
                                            .toList()),
                                  ),
                                  if (controller.selectMutiTopicList.length != 0)
                                    SizedBox(height: 12.h),
                                  Container(
                                    height: 50.h,
                                    width: double.infinity,
                                    decoration: SpinnerDecorationBorder,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<TopicListModel>(
                                          value: controller.selectedLanguage.value
                                                      .id ==
                                                  -1
                                              ? null
                                              : controller.selectedLanguage.value,
                                          hint: Text("Language",
                                              style: TextStyle(
                                                  color: grey_aaaaaa,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      helveticaNeueNeue_medium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.sp),
                                              textAlign: TextAlign.left),
                                          icon: SvgPicture.asset(
                                            icon_down_arrow_spinner,
                                            width: 12.r,
                                            height: 12.r,
                                          ),
                                          onChanged: (TopicListModel? value) {
                                            controller.selectedLanguage.value =
                                                value!;
                                            if (controller.selectedLanguage.value
                                                    .name !=
                                                "SEE ALL LANGUAGE") {
                                              if (!controller.selectMutiLanguList
                                                  .contains(value)) {
                                                controller.selectMutiLanguList
                                                    .add(value);
                                              }
                                            } else {
                                              controller.selectedLanguage.value =
                                                  TopicListModel(id: -1);
                                            }
                                            controller.selectedLanguage.value.id =
                                                -1;
                                          },
                                          isExpanded: true,
                                          customItemsHeight: 4,
                                          iconEnabledColor: black_121212,
                                          iconDisabledColor: Colors.grey,
                                          buttonHeight: 60,
                                          buttonWidth: double.infinity,
                                          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                                          buttonDecoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            color: white,
                                          ),
                                          itemHeight: 35,
                                          itemPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                                          items: controller.languageList
                                              .map((TopicListModel value) {
                                            return DropdownMenuItem<
                                                TopicListModel>(
                                              value: value,
                                              child: Text(value.name.toString(),
                                                  style: TextStyle(
                                                      color: value.name
                                                                  .toString() ==
                                                              "SEE ALL LANGUAGE"
                                                          ? grey_aaaaaa
                                                          : black_121925,
                                                      fontWeight: FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 14.sp)),
                                            );
                                          }).toList()),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Wrap(
                                        direction: Axis.horizontal,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        children: controller.selectMutiLanguList
                                            .map((element) => Padding(
                                                  padding: const EdgeInsets.only(
                                                    right: 6,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {
                                                      controller.selectMutiLanguList
                                                          .remove(element);
                                                    },
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color: const Color(
                                                                0xfff5f5f5),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(15)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  8.0),
                                                          child: Wrap(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left: 4.0),
                                                                child: Text(
                                                                    element.name!,
                                                                    style: TextStyle(
                                                                        color:
                                                                            black_121925,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontFamily:
                                                                            helveticaNeueNeue_medium,
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            14.sp)),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top: 2.5,
                                                                        left: 4),
                                                                child: Icon(
                                                                  Icons.close,
                                                                  size: 13.r,
                                                                  color:
                                                                      grey_aaaaaa,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                ))
                                            .toList()),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            controller.selectIdTopic.clear();
                                            controller.selectIdLanguage.clear();

                                            if (controller.selectMutiTopicList
                                                    .isNotEmpty ||
                                                controller.selectMutiLanguList
                                                    .isNotEmpty) {
                                              controller.selectMutiTopicList
                                                  .forEach((element) {
                                                controller.selectIdTopic
                                                    .add(element.name!);
                                              });

                                              controller.selectMutiLanguList
                                                  .forEach((element) {
                                                controller.selectIdLanguage
                                                    .add(element.name!);
                                              });
                                              controller.videoList.clear();
                                              controller.pageNo.value = 0;
                                              controller.isLoadingBCT.value = true;
                                              topic = controller
                                                      .selectIdTopic
                                                      .toJson()
                                                      .toString();
                                              language = controller
                                                      .selectIdLanguage
                                                      .toJson()
                                                      .toString();
                                              controller.videoListApi(
                                                  topicFilter: controller
                                                      .selectIdTopic
                                                      .toJson()
                                                      .toString(),
                                                  languageFilter: controller
                                                      .selectIdLanguage
                                                      .toJson()
                                                      .toString());
                                              controller.filter.value = 'Clear filters';
                                              controller.clearFilter.value = true;
                                              controller.isTextChange.value = false;
                                              controller.isLayoutFirst.value = false;
                                              setState(() {});
                                            }
                                          },
                                          child: Container(
                                            height: 50.h,
                                            decoration: BoxDecoration(
                                              gradient: const LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [ Color.fromARGB(255, 36, 48, 69),  Color(0xff04080f)],
                                                stops: [0.0, 1.0],
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                            ),
                                            child: Center(
                                              child: Text("Apply Filter",
                                                  style: TextStyle(
                                                      color: white_ffffff,
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: helveticaNeue,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 12.sp),
                                                  textAlign: TextAlign.left),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {
                                            controller.selectedLanguage.value.id =
                                                -1;
                                            controller.selectedTopic.value.id = -1;
                                            controller.selectMutiTopicList.clear();
                                            controller.selectMutiLanguList.clear();
                                            controller.selectIdTopic.clear();
                                            controller.selectIdLanguage.clear();

                                            controller.videoList.clear();
                                            controller.pageNo.value = 1;
                                            controller.isLoadingBCT.value = true;
                                            controller.videoListApi();
                                            controller.filter.value = 'More filters';
                                            controller.clearFilter.value = false;
                                            controller.isTextChange.value = false;
                                            controller.isLayoutFirst.value = false;
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 50.h,
                                            decoration: BoxDecoration(
                                              color: const Color(0xfff5f5f5),
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                            ),
                                            child: Center(
                                              child: Text("Clear",
                                                  style: TextStyle(
                                                      color:
                                                          const Color(0xff121212),
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: helveticaNeue,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 12.sp),
                                                  textAlign: TextAlign.left),
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

                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FilterList(),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
        
      ]),
    );
  }
}
