import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VideoSpeakerList extends StatefulWidget {
  const VideoSpeakerList({Key? key}) : super(key: key);

  @override
  State<VideoSpeakerList> createState() => _VideoSpeakerListState();
}

class _VideoSpeakerListState extends State<VideoSpeakerList> {
  VideoController controller = Get.put(VideoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initScrolling(context);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: controller.scrollController,
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
                            const SizedBox(
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
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        color: Color(0xff96a6a3))),
                              ),
                            ),

                            SizedBox(
                              height: 24.h,
                            ),

                            // SPEAKERS
                            const Center(
                              child: Text("SPEAKERS",
                                  style: TextStyle(
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

                            const Divider(
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
                                  SearchBarTag(
                                    placeholder: "Search people",
                                    autoFocus: false,
                                    onSubmit: (value) {
                                      checkNet(context).then((value) {
                                        controller.PageNumber.value = 0;
                                        controller.userListAPI(
                                            context);
                                      });
                                    },
                                    controller:
                                        controller.searchController.value,
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.all(0),
                                    itemCount: controller.userList.length,
                                    itemBuilder: (context, i) =>
                                        GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            if (controller.selectedList
                                                .contains(
                                                    controller.userList[i])) {
                                              controller.selectedList.remove(
                                                  controller.userList[i]);
                                            } else {
                                              controller.selectedList
                                                  .add(controller.userList[i]);
                                            }
                                          },
                                        );
                                        print(controller.selectedList.length);
                                        print(controller.userList.length);
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
                                                child: controller.userList[i]
                                                            .image ==
                                                        null
                                                    ? SvgPicture.asset(
                                                        placeholder,
                                                        height: 40.h,
                                                        width: 40.w,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : CachedNetworkImage(
                                                        imageUrl: controller
                                                            .userList[i].image!,
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
                                                        controller.userList[i]
                                                                    .userName !=
                                                                null
                                                            ? controller
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
                                                        controller.userList[i]
                                                                    .firstName !=
                                                                null
                                                            ? controller
                                                                    .userList[i]
                                                                    .firstName!
                                                                    .capitalizeFirst! +
                                                                " " +
                                                                controller
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
                                                controller.selectedList
                                                        .contains(controller
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
          ),
          if (controller.isPaginationLoading.value == true)
            PaginationUtils().loader(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    controller.searchController.value.text = "";
  }
}
