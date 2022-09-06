import 'package:blackchecktech/Screens/Home/videosMenu/Controller/videoMenuController.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/SpeakersVideos.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Layout/SearchBarWithRightIcon.dart';
import '../../../../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../../../../Model/FindSpeakerModel.dart';
import '../../../../Styles/my_colors.dart';
import '../../../../Styles/my_icons.dart';
import '../../../../Utilities/Constant.dart';

class FindSpeaker extends StatefulWidget {
  const FindSpeaker({Key? key}) : super(key: key);

  @override
  _FindSpeakerState createState() => _FindSpeakerState();
}

class _FindSpeakerState extends State<FindSpeaker> {
  VideoMenuController controller = Get.find<VideoMenuController>();
  String search = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.isShimmerSpeaker.value = true;
    initScrolling(context);
    if (mounted) {
      controller.isLoading.value = true;
      controller.isLoadingButton.value = false;
      controller.findSpeakerApi(search: "");
    }
  }

  initScrolling(BuildContext context) {
    controller.scrollSpeakerListController.addListener(() async {
      if (controller.scrollSpeakerListController.position.maxScrollExtent ==
          controller.scrollSpeakerListController.position.pixels) {
        scrollDown();
        controller.isPaginationLoading.value = true;
        controller.speakerPageNo = controller.speakerPageNo + 1;
        controller.findSpeakerApi(search: search);

        controller.isPaginationLoading.value = false;
      }
    });
  }

  void scrollDown() {
    controller.scrollSpeakerListController.jumpTo(
        controller.scrollSpeakerListController.position.maxScrollExtent);
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: white_ffffff,
        body: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: ToolbarWithHeaderCenterTitle("FIND A SPEAKER")),
              SearchBarWithRightIcon(onSearch: (value) {
                controller.findSpeakerList.clear();
                controller.speakerPageNo.value = 1;
                search = value;
                controller.findSpeakerApi(search: value);
              }),
              Container(
                margin: EdgeInsets.only(top: 16.h, left: 24.w),
                child: Text(
                  controller.findSpeakerList.length == 0
                      ? "0 Speakers"
                      : controller.findSpeakerList.length.toString() +
                          " Speakers",
                  style: TextStyle(
                      color: grey_aaaaaa,
                      fontSize: 14.sp,
                      fontFamily: roboto_regular),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: controller.scrollSpeakerListController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: 16.h, left: 24.w, right: 24.w),
                        child: controller.isShimmerSpeaker.value
                            ? ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: 12,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, i) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 16.h),
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      enabled: true,
                                      child: SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                child: CachedNetworkImage(
                                                  imageUrl: "",
                                                  height: 42.h,
                                                  width: 42.w,
                                                  fit: BoxFit.cover,
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              downloadProgress) =>
                                                          SvgPicture.asset(
                                                    placeholder,
                                                    height: 42.h,
                                                    width: 42.w,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          SvgPicture.asset(
                                                    placeholder,
                                                    height: 42.h,
                                                    width: 42.w,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 16.w,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      height: 12,
                                                      width: 150,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          color: Colors.black)),
                                                  SizedBox(
                                                    height: 6.h,
                                                  ),
                                                  Container(
                                                      height: 8,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          color: Colors.black)),
                                                ],
                                              )
                                            ],
                                          )),
                                    ),
                                  );
                                })
                            :

                            // controller.isLoading.value
                            //     ? SizedBox(
                            //         width: double.infinity,
                            //         height: MediaQuery.of(context).size.height * 0.60,
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
                            controller.findSpeakerList.isEmpty
                                ? SizedBox(
                                    height: MediaQuery.of(context).size.height *
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
                                        controller.findSpeakerList.length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, i) {
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 16.h),
                                        child: InkWell(
                                          onTap: () {
                                            controller.speakerDataVideoAPI(
                                                search: "",
                                                videoId: controller
                                                    .findSpeakerList[i].id);
                                            Get.to((SpeakersVideos(
                                                id: int.parse(controller
                                                    .findSpeakerList[i].id
                                                    .toString()),
                                                name: controller
                                                        .findSpeakerList[i]
                                                        .fullName ??
                                                    controller
                                                        .findSpeakerList[i]
                                                        .userName ??
                                                    "")));
                                          },
                                          child: SizedBox(
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: CachedNetworkImage(
                                                      imageUrl: controller
                                                                  .findSpeakerList[
                                                                      i]
                                                                  .image ==
                                                              null
                                                          ? ""
                                                          : controller
                                                              .findSpeakerList[
                                                                  i]
                                                              .image
                                                              .toString(),
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
                                                      errorWidget: (context,
                                                              url, error) =>
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
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                                    .findSpeakerList[
                                                                        i]
                                                                    .fullName ==
                                                                null
                                                            ? ""
                                                            : controller
                                                                .findSpeakerList[
                                                                    i]
                                                                .fullName
                                                                .toString()
                                                                .capitalize!,
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                helveticaNeueNeue_medium,
                                                            color: grey_aaaaaa,
                                                            fontSize: 14),
                                                      ),
                                                      SizedBox(
                                                        height: 3.h,
                                                      ),
                                                      Text(
                                                        controller
                                                                    .findSpeakerList[
                                                                        i]
                                                                    .userName ==
                                                                null
                                                            ? ""
                                                            : controller
                                                                .findSpeakerList[
                                                                    i]
                                                                .userName
                                                                .toString(),
                                                        style: const TextStyle(
                                                            fontFamily:
                                                                helvetica_neu_bold,
                                                            color: black_121212,
                                                            fontSize: 14),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )),
                                        ),
                                      );
                                    }),
                      ),
                    ],
                  ),
                ),
              ),
              if (controller.isPaginationLoading.value == true)
                PaginationUtils().loader(),
            ],
          ),
        ),
      ),
    );
  }
}
