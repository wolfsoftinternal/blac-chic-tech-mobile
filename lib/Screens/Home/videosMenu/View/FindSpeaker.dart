import 'package:blackchecktech/Screens/Home/videosMenu/Controller/videoMenuController.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/SpeakersVideos.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      controller.isLoading.value = true;
      controller.isLoadingButton.value = false;
    }
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
      home: SafeArea(
        child: Scaffold(
          backgroundColor: white_ffffff,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 15.h),
                            child:
                                ToolbarWithHeaderCenterTitle("FIND A SPEAKER")),
                        SearchBarWithRightIcon(
                          onSearch: (value) =>
                              controller.findSpeakerApi(search: value),
                        ),
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
                        Container(
                          margin: EdgeInsets.only(
                              top: 16.h, left: 24.w, right: 24.w),
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
                              : controller.findSpeakerList == null
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
                                          controller.findSpeakerList.length + 1,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, i) {
                                        if (i <
                                            controller.findSpeakerList.length) {
                                          return Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 16.h),
                                            child: InkWell(
                                              onTap: () {
                                                controller.speakerDataVideoAPI(
                                                    search: "",
                                                    videoId: controller
                                                        .findSpeakerList[i].id);
                                                Get.to((SpeakersVideos(
                                                    id: int.parse(controller
                                                        .findSpeakerList[i].id
                                                        .toString()))));
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
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child:
                                                            CachedNetworkImage(
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
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 16.w,
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
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
                                                                    .toString(),
                                                            style: const TextStyle(
                                                                fontFamily:
                                                                    helveticaNeueNeue_medium,
                                                                color:
                                                                    grey_aaaaaa,
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
                                                                color:
                                                                    black_121212,
                                                                fontSize: 14),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  )),
                                            ),
                                          );
                                        } else {
                                          return controller.hasMore.value ==
                                                  false
                                              ? const SizedBox()
                                              : InkWell(
                                                  onTap: () {
                                                    controller.findSpeakerPage
                                                        .value++;
                                                    controller.pageAdd();
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        bottom: 25.h),
                                                    child: Center(
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
