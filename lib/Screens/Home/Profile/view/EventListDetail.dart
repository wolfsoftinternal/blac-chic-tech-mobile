import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Settings/view/ProfileSetting.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/CreateBottomSheet.dart';
import 'package:blackchecktech/Widget/ReportBottomSheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Utilities/Constant.dart';

class EventListDetail extends StatefulWidget {
  final id;
  final userId;
  const EventListDetail({Key? key, this.userId, this.id}) : super(key: key);

  @override
  State<EventListDetail> createState() => _EventListDetailState();
}

class _EventListDetailState extends State<EventListDetail> {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initEventScrolling(context, widget.userId, widget.id);
    dynamic body = {
      'event_id': widget.id.toString(),
      'user_id': widget.userId.toString(),
      'page': controller.eventPageNumber.toString()
    };
    checkNet(context).then((value) {
      controller.eventListAPI(context, body, 'detail');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => Column(children: [
          SizedBox(
            height: 60.h,
          ),
          Container(
            child: Row(
              children: [
                BackLayout(),
                SizedBox(
                  height: 48.h,
                  width: 48.w,
                ),
                const Spacer(),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                      Get.back();
                    },
                    child: CircularProfileAvatar(
                      '',
                      radius: 24,
                      child: controller.details.value.image == null
                          ? SvgPicture.asset(
                              placeholder,
                              height: 48.h,
                              width: 48.w,
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl: controller.details.value.image!,
                              height: 48.h,
                              width: 48.w,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      SvgPicture.asset(
                                placeholder,
                                height: 48.h,
                                width: 48.w,
                                fit: BoxFit.cover,
                              ),
                              errorWidget: (context, url, error) =>
                                  SvgPicture.asset(
                                placeholder,
                                height: 48.h,
                                width: 48.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
                const Spacer(),
                widget.userId == controller.details.value.id
                    ? GestureDetector(
                        onTap: () {
                          createBottomSheet(context, widget.userId);
                        },
                        child: Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              add_icon,
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 48.w,
                        height: 48.h,
                      ),
                widget.userId == controller.details.value.id
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(ProfileSetting());
                          },
                          child: Container(
                            width: 55.w,
                            height: 55.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: SvgPicture.asset(
                              settings_icon,
                              width: 40.w,
                              height: 40.h,
                              color: black_121212,
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: GestureDetector(
                          onTap: () {
                            displayBottomSheet(context);
                          },
                          child: SizedBox(
                            width: 55.w,
                            height: 55.h,
                            child: const Icon(Icons.more_horiz,
                                color: black_121212),
                          ),
                        ),
                      )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          controller.eventList.isEmpty
              ? Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Center(
                  child: CircularProgressIndicator(
                    color: black, 
                    strokeWidth: 2
                  )
                ),
              )
              : Expanded(
                  child: SingleChildScrollView(
                    controller: controller.eventScrollController,
                    child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: controller.eventList.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 24.0, right: 24.0),
                            child: GestureDetector(
                              onTap: () {
                                checkNet(context).then((value) {
                                  controller.eventDetailAPI(context,
                                      controller.eventList[index].id, null);
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: 207.h,
                                      child: controller
                                                  .eventList[index].poster ==
                                              null
                                          ? ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.r)),
                                              child: SvgPicture.asset(
                                                placeholder,
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 207.h,
                                              ),
                                            )
                                          : ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.r)),
                                              child: CachedNetworkImage(
                                                imageUrl: controller
                                                    .eventList[index].poster!,
                                                fit: BoxFit.cover,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 207.h,
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        SvgPicture.asset(
                                                  placeholder,
                                                  fit: BoxFit.cover,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 207.h,
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        SvgPicture.asset(
                                                  placeholder,
                                                  fit: BoxFit.cover,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 207.h,
                                                ),
                                              ),
                                            ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 207.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.r),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0x00121212),
                                                Color(0xff121212)
                                              ])),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 8.h, left: 8.w),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: orange.withOpacity(0.7),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(40.r)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 14.w,
                                                    right: 14.w,
                                                    top: 7.h,
                                                    bottom: 7.h),
                                                child: Text(
                                                    controller
                                                        .eventList[index].type!,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: roboto_bold,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 12.sp),
                                                    textAlign:
                                                        TextAlign.center),
                                                // setHelveticaMedium(
                                                //     controller
                                                //         .eventList[index].type!,
                                                //     12,
                                                //     white_ffffff,
                                                //     FontWeight.w500,
                                                //     FontStyle.normal),
                                              )),
                                        ),
                                        controller.eventList[index].hosts
                                                    .toString()
                                                    .isEmpty ||
                                                controller
                                                        .eventList[index].hosts
                                                        .toString() ==
                                                    '[]'
                                            ? Container()
                                            : Padding(
                                                padding: EdgeInsets.only(
                                                    top: 8.h, right: 8.w),
                                                child: Container(
                                                    height: 29.h,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            Color(0xff1c2535),
                                                            Color(0xff04080f)
                                                          ]),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  4.r)),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 6.w,
                                                                  right: 6.w),
                                                          child:
                                                              CircularProfileAvatar(
                                                            '',
                                                            radius: 7.5,
                                                            borderColor:
                                                                Colors.black,
                                                            child: controller
                                                                    .eventList[
                                                                        index]
                                                                    .hosts![0]
                                                                    .image!
                                                                    .isEmpty
                                                                ? Icon(
                                                                    Icons
                                                                        .person,
                                                                    size: 15.r,
                                                                    color:
                                                                        grey_aaaaaa,
                                                                  )
                                                                : controller
                                                                            .eventList[index]
                                                                            .hosts![0]
                                                                            .image
                                                                            .toString() ==
                                                                        ''
                                                                    ? Icon(
                                                                        Icons
                                                                            .person,
                                                                        size: 15
                                                                            .r,
                                                                        color:
                                                                            grey_aaaaaa,
                                                                      )
                                                                    : CachedNetworkImage(
                                                                        imageUrl: controller
                                                                            .eventList[index]
                                                                            .hosts![0]
                                                                            .image!,
                                                                        height:
                                                                            15.h,
                                                                        width:
                                                                            15.w,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        progressIndicatorBuilder: (context,
                                                                                url,
                                                                                downloadProgress) =>
                                                                            Icon(
                                                                          Icons
                                                                              .person,
                                                                          size:
                                                                              15.r,
                                                                          color:
                                                                              grey_aaaaaa,
                                                                        ),
                                                                        errorWidget: (context,
                                                                                url,
                                                                                error) =>
                                                                            Icon(
                                                                          Icons
                                                                              .person,
                                                                          size:
                                                                              15.r,
                                                                          color:
                                                                              grey_aaaaaa,
                                                                        ),
                                                                      ),
                                                          ),
                                                        ),
                                                        setHelceticaBold(
                                                            controller
                                                                    .eventList[
                                                                        index]
                                                                    .hosts![0]
                                                                    .firstName! +
                                                                controller
                                                                    .eventList[
                                                                        index]
                                                                    .hosts![0]
                                                                    .lastName!,
                                                            11.sp,
                                                            white_ffffff,
                                                            FontWeight.w500,
                                                            FontStyle.normal,
                                                            -0.22),
                                                        SizedBox(
                                                          width: 6.w,
                                                        )
                                                      ],
                                                    )),
                                              ),
                                      ],
                                    ),
                                    Positioned(
                                        bottom: 19.h,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 16.w),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                calendar_icon,
                                                height: 12.h,
                                                width: 12.w,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 4.w),
                                                child: setHelveticaMedium(
                                                    '${DateFormat("MMM dd, yyyy").format(controller.eventList[index].startDateTime!)} at ${DateFormat("hh:mm a").format(controller.eventList[index].startDateTime!)}',
                                                    10.sp,
                                                    white_ffffff,
                                                    FontWeight.w500,
                                                    FontStyle.normal,
                                                    -0.4),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Positioned(
                                        bottom: 19.h,
                                        right: 16.w,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 16.w),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 4.w),
                                                child: setHelveticaMedium(
                                                    controller.eventList[index]
                                                        .venue!,
                                                    10.sp,
                                                    white_ffffff,
                                                    FontWeight.w100,
                                                    FontStyle.normal,
                                                    -0.4),
                                              ),
                                              SvgPicture.asset(
                                                icon_location,
                                                height: 12.h,
                                                width: 12.w,
                                              ),
                                            ],
                                          ),
                                        )),
                                    Positioned(
                                        bottom: 40.h,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 16.w),
                                          child: setHelceticaBold(
                                              controller
                                                  .eventList[index].title!,
                                              22.sp,
                                              white_ffffff,
                                              FontWeight.w500,
                                              FontStyle.normal,
                                              -0.88),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
          if (controller.isEventPaginationLoading.value == true)
            PaginationUtils().loader(),
        ]),
      ),
    );
  }
}
