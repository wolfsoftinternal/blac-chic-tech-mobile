// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/view/AddSpeaker.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/UserListModel.dart';
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

class SpeakerHostBottomSheet extends StatefulWidget {
  final type;
  const SpeakerHostBottomSheet({Key? key, this.type}) : super(key: key);

  @override
  State<SpeakerHostBottomSheet> createState() => _SpeakerHostBottomSheetState();
}

class _SpeakerHostBottomSheetState extends State<SpeakerHostBottomSheet> {
  EventController controller = Get.put(EventController());
  VideoController videoController = Get.put(VideoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoController.initScrolling(context);
      checkNet(context).then((value) async {
        videoController.PageNumber.value = 0;
        videoController.userList.clear();
        await videoController.userListAPI(context);
        Future.delayed(Duration(milliseconds: 3), () {
          for (var item in videoController.userList) {
            for (var selectedItem in controller.selectedSpeaker) {
              if (selectedItem.id == item.id) {
                item.isSpeakerSelected = selectedItem.isSpeakerSelected;
              }
            }
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
      child: SingleChildScrollView(
        controller: videoController.scrollController,
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
                      SizedBox(
                        height: 15.h,
                      ),

                      // Rectangle 1329
                      Align(
                        alignment: Alignment.topCenter,
                        child: Opacity(
                          opacity: 0.4000000059604645,
                          child: Container(
                              width: 48.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.r)),
                                  color: const Color(0xff96a6a3))),
                        ),
                      ),

                      SizedBox(
                        height: 24.h,
                      ),

                      // SPEAKERS
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                  widget.type == 'host' ? "HOST" : "SPEAKERS",
                                  style: TextStyle(
                                      color: Color(0xff121212),
                                      fontWeight: FontWeight.w900,
                                      fontFamily: "NeueHelvetica",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.left),
                            ),
                            // +ADD
                            widget.type == 'host'
                                ? Container()
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showGeneralDialog(
                                            context: context,
                                            pageBuilder: (BuildContext
                                                    buildContext,
                                                Animation animation,
                                                Animation secondaryAnimation) {
                                              return AddSpeaker();
                                            });
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text("+ADD",
                                          style: TextStyle(
                                              color: Color(0xffff8819),
                                              fontFamily: "Roboto",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.left),
                                    ),
                                  )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),

                      Divider(
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
                            /*--------------Please Uncomment the below search bar--------------*/

                            //   SearchBarTag(placeholder: "Search people"),

                            SearchBarTag(
                              placeholder: "Search people",
                              autoFocus: false,
                              onSubmit: (value) {
                                checkNet(context).then((value) async {
                                  if (videoController
                                          .searchController.value.text ==
                                      '') {
                                    videoController.PageNumber.value = 0;
                                    videoController.userList.clear();
                                    await videoController.userListAPI(context);
                                    Future.delayed(Duration(milliseconds: 3),
                                        () {
                                      for (var item
                                          in videoController.userList) {
                                        for (var selectedItem
                                            in controller.selectedSpeaker) {
                                          if (selectedItem.id == item.id) {
                                            item.isSpeakerSelected =
                                                selectedItem.isSpeakerSelected;
                                          }
                                        }
                                      }
                                    });
                                  } else {
                                    videoController.PageNumber.value = 0;
                                    await videoController.userListAPI(context);
                                    Future.delayed(Duration(milliseconds: 3),
                                        () {
                                      for (var item
                                          in videoController.userList) {
                                        for (var selectedItem
                                            in controller.selectedSpeaker) {
                                          if (selectedItem.id == item.id) {
                                            item.isSpeakerSelected =
                                                selectedItem.isSpeakerSelected;
                                          }
                                        }
                                      }
                                    });
                                  }
                                });
                              },
                              controller:
                                  videoController.searchController.value,
                            ),
                            SizedBox(
                              height: 24.h,
                            ),

                            ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              padding: EdgeInsets.all(0),
                              itemCount: videoController.userList.length,
                              itemBuilder: (context, i) => InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      if (widget.type == 'host') {
                                        videoController
                                                .userList[i].isSpeakerSelected ==
                                            false;
                                        controller.selectedHost.clear();
                                        controller.selectedHost
                                            .add(videoController.userList[i]);
                                      } else {
                                        videoController.userList[i].isSpeakerSelected =
                                            true;
                                        print(videoController
                                            .userList[i].isSpeakerSelected);
                                        if (controller.selectedSpeaker.contains(
                                            videoController.userList[i])) {
                                          controller.selectedSpeaker.remove(
                                              videoController.userList[i]);
                                              videoController.userList[i].isSpeakerSelected =
                                            false;
                                        } else {
                                          controller.selectedSpeaker
                                              .add(videoController.userList[i]);
                                        }
                                      }
                                    },
                                  );
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
                                          child: videoController
                                                  .userList.isNotEmpty
                                              ? videoController
                                                          .userList[i].image ==
                                                      null
                                                  ? SvgPicture.asset(
                                                      placeholder,
                                                      height: 40.h,
                                                      width: 40.w,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : CachedNetworkImage(
                                                      imageUrl: videoController
                                                          .userList[i].image!,
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
                                                    )
                                              : SvgPicture.asset(
                                                  placeholder,
                                                  height: 40.h,
                                                  width: 40.w,
                                                  fit: BoxFit.cover,
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
                                                  videoController.userList[i]
                                                              .userName !=
                                                          null
                                                      ? videoController
                                                          .userList[i].userName!
                                                      : "",
                                                  style: TextStyle(
                                                      color: grey_aaaaaa,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helveticaNeueNeue_medium,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  textAlign: TextAlign.left),
                                              SizedBox(
                                                height: 2.h,
                                              ),

                                            ],
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          widget.type == 'host'
                                              ? controller.selectedHost
                                                      .contains(videoController
                                                          .userList[i])
                                                  ? orange_tick_icon
                                                  : icon_next_arrow
                                              : videoController.userList[i]
                                                          .isSpeakerSelected ==
                                                      true
                                                  // : controller.selectedSpeaker
                                                  //         .contains(videoController
                                                  //             .userList[i])
                                                  // videoController.userList.contains(controller.selectedSpeaker[i])
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
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    videoController.searchController.value.text = "";
  }
}
