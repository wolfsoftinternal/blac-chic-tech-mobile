import 'package:blackchecktech/Model/SpeakersVideoModel.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/Controller/videoMenuController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 15.h),
                          child: ToolbarWithHeaderCenterTitle("MY PLAY LIST")),
                      SearchBarWithRightIcon(
                        onSearch: (value) {
                          controller.myPlayListAPI(search: value);
                        },
                      ),
                      Obx(
                        () => Container(
                          margin: EdgeInsets.only(
                              top: 24.h, left: 24.w, right: 24.w),
                          child: controller.isLoading.value
                              ? const SizedBox(
                                  width: double.infinity,
                                  height: 100,
                                  child: Center(
                                      child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color(0xff04080f)),
                                    ),
                                  )))
                              : controller.myPlayList.length == 0
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
                                        return Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 20.h),
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
                                                        Alignment.bottomRight,
                                                    children: [
                                                      SizedBox(
                                                          height: 80.h,
                                                          width: 120.w,
                                                          child: Html(
                                                              data: controller
                                                                  .myPlayList[i]
                                                                  .embededCode)),
                                                      Positioned(
                                                        bottom: 2,
                                                        right: 3,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 6.w,
                                                                  bottom: 6.h),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      1.5.h,
                                                                  horizontal:
                                                                      6.w),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            gradient:
                                                                const LinearGradient(
                                                              begin: Alignment
                                                                  .topCenter,
                                                              end: Alignment
                                                                  .bottomCenter,
                                                              colors: [
                                                                Color(
                                                                    0xff1c2535),
                                                                Color(
                                                                    0xff04080f)
                                                              ],
                                                              stops: [0.0, 5.0],
                                                            ),
                                                          ),
                                                          child: Text(
                                                            "3.05",
                                                            style: TextStyle(
                                                                fontSize: 11.sp,
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    helveticaNeueNeue_medium),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
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
                                                                .myPlayList[i]
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
                                                                fontSize: 14),
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
                                                                fontSize: 10),
                                                          ),
                                                          SizedBox(
                                                            height: 2.h,
                                                          ),
                                                          Text(
                                                            "Posted " +
                                                                DateFormat
                                                                        .yMMMM()
                                                                    .format(DateTime.parse(controller
                                                                        .myPlayList[
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
                                                  PopupMenuButton(
                                                      onSelected: (value) {
                                                        controller
                                                            .removeFromPlaylist(
                                                                context:
                                                                    context,
                                                                videoId: controller
                                                                    .myPlayList[
                                                                        i]
                                                                    .id,
                                                                index: i);
                                                      },
                                                      itemBuilder: (context) =>
                                                          [
                                                            const PopupMenuItem(
                                                              child: Text(
                                                                  "Remove"),
                                                              textStyle: TextStyle(
                                                                  color:
                                                                      black_121212,
                                                                  fontFamily:
                                                                      roboto_regular,
                                                                  fontSize: 14),
                                                              value: 1,
                                                            ),
                                                          ],
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 24,
                                                          vertical: 10),
                                                      icon: Image.asset(
                                                        img_more,
                                                        width: 16.w,
                                                        height: 16.w,
                                                      )),
                                                ],
                                              )),
                                        );
                                      }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 25.h),
                child: Center(
                  child: Text(
                    "Load More",
                    style: TextStyle(
                        fontFamily: roboto_bold,
                        fontSize: 14.sp,
                        color: blue_0a84ff),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
