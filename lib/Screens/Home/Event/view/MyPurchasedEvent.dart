import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Model/EventList2Model.dart';
import 'package:blackchecktech/Screens/Home/Event/controller/EventDetailController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyPurchasedEvent extends StatefulWidget {
  @override
  _MyPurchasedEventState createState() => _MyPurchasedEventState();
}

class _MyPurchasedEventState extends State<MyPurchasedEvent> {
  EventDetailController controller = Get.put(EventDetailController());
  AdmireProfileController admireProfileController =
      Get.put(AdmireProfileController());

  /*updated*/
  bool Bg1 = true;
  bool Bg2 = false;

  bool tv1 = true;
  bool tv2 = false;

  bool _isFirstLayout = true;
  bool _isSecondLayout = false;

  @override
  void initState() {
    super.initState();
    controller.initPastUpcomingScrolling(context);
    controller.pastUpcomingPageNumber.value = 1;
    dynamic body = {
      'page': controller.pastUpcomingPageNumber.toString(),
      'event_type': 'upcoming'
    };
    controller.allEventListApi(body, 'upcoming');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            ToolbarWithHeaderCenterTitle("MY EVENTS"),
            /*----- 2 Tab Layout ------*/
            Container(
              margin: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 20.w, bottom: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Bg1 = true;
                          Bg2 = false;
                          tv1 = true;
                          tv2 = false;
                          _isFirstLayout = true;
                          _isSecondLayout = false;

                          controller.pageNumber.value = 1;
                          dynamic body = {
                            'page': controller.pageNumber.toString(),
                            'event_type': 'past'
                          };
                          controller.isLoading.value = true;
                          controller.allEventListApi(body, 'past');
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        decoration: BoxDecoration(
                          color: Bg1 ? black_121212 : grey_f5f5f5,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Center(
                          child: Text(
                            "Upcoming",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: tv1 ? Colors.white : black_121212,
                                fontFamily: roboto_bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          Bg1 = false;
                          Bg2 = true;
                          tv1 = false;
                          tv2 = true;
                          _isFirstLayout = false;
                          _isSecondLayout = true;

                          controller.pageNumber.value = 1;
                          dynamic body = {
                            'page': controller.pageNumber.toString(),
                            'event_type': 'past'
                          };
                          controller.isLoading.value = true;
                          controller.allEventListApi(body, 'past');
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        decoration: BoxDecoration(
                          color: Bg2 ? black_121212 : grey_f5f5f5,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Center(
                          child: Text(
                            "Past",
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: tv2 ? Colors.white : black_121212,
                                fontFamily: roboto_bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /*--------------- Upcoming Tab --------------*/
            controller.isLoading.value == true
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.60,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: black,
                        strokeWidth: 2,
                      ),
                    ))
                : _isFirstLayout == true
                    ? controller.upcomingEventList.isEmpty
                        ? SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  img_logo,
                                  height: 80,
                                  width: 80,
                                ),
                                setHelceticaBold(
                                    "NO UPCOMING EVENTS YET",
                                    16.sp,
                                    grey_aaaaaa,
                                    FontWeight.w500,
                                    FontStyle.normal,
                                    0.5)
                              ],
                            ),
                          )
                        : eventList()
                    : controller.pastEventList.isEmpty
                        ? SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  img_logo,
                                  height: 80,
                                  width: 80,
                                ),
                                setHelceticaBold(
                                    "NO Past EVENTS YET",
                                    16.sp,
                                    grey_aaaaaa,
                                    FontWeight.w500,
                                    FontStyle.normal,
                                    0.5)
                              ],
                            ),
                          )
                        : eventList(),
            if (controller.isPastUpcomingPaginationLoading.value == true)
              PaginationUtils().loader(),

            // /*--------------- Past Tab --------------*/
            // Visibility(
            //   visible: _isSecondLayout,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [

            //       Container(
            //         margin: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
            //         padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            //         decoration: const BoxDecoration(
            //           // border: Border.all(color: grey_e9ecec, width: 1),
            //             borderRadius: BorderRadius.all(Radius.circular(4)),
            //             color: grey_f5f5f5),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           mainAxisSize: MainAxisSize.max,
            //           children: [
            //             SvgPicture.asset(
            //               search,
            //               color: grey_aaaaaa,
            //             ),
            //             SizedBox(
            //               width: 10.w,
            //             ),
            //             const Expanded(
            //               child: TextField(
            //                 style: TextStyle(
            //                     color: black_121212,
            //                     fontFamily: roboto_medium,
            //                     fontSize: 14.0),
            //                 decoration: InputDecoration(
            //                   isDense: true,
            //                   hintText: "Search.......",
            //                   hintStyle: TextStyle(
            //                       color: grey_aaaaaa,
            //                       fontFamily: roboto_medium,
            //                       fontSize: 14.0),
            //                   border: InputBorder.none,
            //                 ),
            //                 keyboardType: TextInputType.text,
            //                 textInputAction: TextInputAction.next,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),

            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Expanded eventList() {
    return Expanded(
      child: SingleChildScrollView(
        controller: controller.pastUpcomingScrollController,
        child: Container(
          margin: EdgeInsets.only(left: 16.w, right: 16.w),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              primary: false,
              itemCount: _isFirstLayout == true
                  ? controller.upcomingEventList.length
                  : controller.pastEventList.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    checkNet(context).then((value) {
                      if (_isFirstLayout == true) {
                        admireProfileController.eventDetailAPI(context,
                            controller.upcomingEventList[i].id, 'upcoming');
                      } else {
                        admireProfileController.eventDetailAPI(
                            context, controller.pastEventList[i].id, 'past');
                      }
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 207.h,
                          child: _isFirstLayout == true
                              ? controller.upcomingEventList[i].poster == null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.r)),
                                      child: SvgPicture.asset(
                                        placeholder,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 207.h,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: CachedNetworkImage(
                                        imageUrl: controller
                                            .upcomingEventList[i].poster!,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 207.h,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                SvgPicture.asset(
                                          placeholder,
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 207.h,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            SvgPicture.asset(
                                          placeholder,
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 207.h,
                                        ),
                                      ),
                                    )
                              : controller.pastEventList[i].poster == null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.r)),
                                      child: SvgPicture.asset(
                                        placeholder,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 207.h,
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            controller.pastEventList[i].poster!,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 207.h,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                SvgPicture.asset(
                                          placeholder,
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 207.h,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            SvgPicture.asset(
                                          placeholder,
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 207.h,
                                        ),
                                      ),
                                    ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 207.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0x00121212),
                                    Color(0xff121212)
                                  ])),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 8.h, left: 8.w, right: 8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  height: 26.h,
                                  decoration: BoxDecoration(
                                    color: orange.withOpacity(0.7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25.r)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      _isFirstLayout == true
                                          ? controller
                                              .upcomingEventList[i].type!
                                          : controller.pastEventList[i].type!,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white,
                                          fontFamily: roboto_bold),
                                    ),
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.only(right: 6.w),
                                    height: 29.h,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(colors: [
                                        Color(0xff1c2535),
                                        Color(0xff04080f)
                                      ]),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(4.r)),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 6.0.w, right: 6.0.w),
                                          child: CircularProfileAvatar(
                                            '',
                                            radius: 7.5,
                                            borderColor: black,
                                            child: _isFirstLayout == true
                                                ? controller.upcomingEventList[i].hosts ==
                                                            null ||
                                                        controller.upcomingEventList[i].hosts
                                                                .toString() ==
                                                            '[]'
                                                    ? Icon(
                                                        Icons.person,
                                                        size: 15.r,
                                                        color: grey_aaaaaa,
                                                      )
                                                    : controller
                                                                    .upcomingEventList[
                                                                        i]
                                                                    .hosts!
                                                                    .first
                                                                    .image
                                                                    .toString() ==
                                                                '' ||
                                                            controller.upcomingEventList[i].hosts ==
                                                                null
                                                        ? Icon(
                                                            Icons.person,
                                                            size: 15.r,
                                                            color: grey_aaaaaa,
                                                          )
                                                        : CachedNetworkImage(
                                                            imageUrl: controller
                                                                    .upcomingEventList[
                                                                        i]
                                                                    .hosts!
                                                                    .first
                                                                    .image ??
                                                                "",
                                                            height: 15.h,
                                                            width: 15.w,
                                                            fit: BoxFit.cover,
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        downloadProgress) =>
                                                                    Icon(
                                                              Icons.person,
                                                              size: 15.r,
                                                              color:
                                                                  grey_aaaaaa,
                                                            ),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Icon(
                                                              Icons.person,
                                                              size: 15.r,
                                                              color:
                                                                  grey_aaaaaa,
                                                            ),
                                                          )
                                                : controller.pastEventList[i]
                                                                .hosts ==
                                                            null ||
                                                        controller.pastEventList[i].hosts
                                                                .toString() ==
                                                            '[]'
                                                    ? Icon(
                                                        Icons.person,
                                                        size: 15.r,
                                                        color: grey_aaaaaa,
                                                      )
                                                    : controller.pastEventList[i]
                                                                    .hosts![0].image
                                                                    .toString() ==
                                                                '' ||
                                                            controller.pastEventList[i].hosts == null
                                                        ? Icon(
                                                            Icons.person,
                                                            size: 15.r,
                                                            color: grey_aaaaaa,
                                                          )
                                                        : CachedNetworkImage(
                                                            imageUrl: controller
                                                                    .pastEventList[
                                                                        i]
                                                                    .hosts![0]
                                                                    .image ??
                                                                "",
                                                            height: 15.h,
                                                            width: 15.w,
                                                            fit: BoxFit.cover,
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        downloadProgress) =>
                                                                    Icon(
                                                              Icons.person,
                                                              size: 15.r,
                                                              color:
                                                                  grey_aaaaaa,
                                                            ),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Icon(
                                                              Icons.person,
                                                              size: 15.r,
                                                              color:
                                                                  grey_aaaaaa,
                                                            ),
                                                          ),
                                          ),
                                        ),
                                        setHelveticaMedium(
                                            "Hosted by",
                                            11.sp,
                                            gray_b3ffffff,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            -0.22),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        setHelceticaBold(
                                            _isFirstLayout == true
                                                ? controller
                                                                .upcomingEventList[
                                                                    i]
                                                                .hosts
                                                                .toString() ==
                                                            '[]' ||
                                                        controller
                                                                .upcomingEventList[
                                                                    i]
                                                                .hosts ==
                                                            null
                                                    ? controller
                                                            .upcomingEventList[
                                                                i]
                                                            .hosts![0]
                                                            .firstName! +
                                                        controller
                                                            .upcomingEventList[
                                                                i]
                                                            .hosts![0]
                                                            .lastName!
                                                    : ""
                                                : controller.pastEventList[i]
                                                                .hosts
                                                                .toString() ==
                                                            '[]' ||
                                                        controller
                                                                .pastEventList[
                                                                    i]
                                                                .hosts ==
                                                            null
                                                    ? controller
                                                            .pastEventList[i]
                                                            .hosts![0]
                                                            .firstName! +
                                                        controller
                                                            .pastEventList[i]
                                                            .hosts![0]
                                                            .lastName!
                                                    : "",
                                            11.sp,
                                            white_ffffff,
                                            FontWeight.w500,
                                            FontStyle.normal,
                                            -0.22),
                                      ],
                                    )),
                              ],
                            ),
                          ),
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
                                    padding: EdgeInsets.only(left: 4.w),
                                    child: setHelveticaMedium(
                                        _isFirstLayout == true
                                            ? '${DateFormat("MMM dd, yyyy").format(controller.upcomingEventList[i].startDateTime!)} at ${DateFormat("hh:mm a").format(controller.upcomingEventList[i].startDateTime!)}'
                                            : '${DateFormat("MMM dd, yyyy").format(controller.pastEventList[i].startDateTime!)} at ${DateFormat("hh:mm a").format(controller.pastEventList[i].startDateTime!)}',
                                        10.sp,
                                        white_ffffff,
                                        FontWeight.w100,
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
                                    padding: EdgeInsets.only(right: 4.w),
                                    child: setHelveticaMedium(
                                        _isFirstLayout == true
                                            ? controller
                                                .upcomingEventList[i].venue!
                                            : controller
                                                .pastEventList[i].venue!,
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
                                  _isFirstLayout == true
                                      ? controller.upcomingEventList[i].title!
                                      : controller.pastEventList[i].title!,
                                  22.sp,
                                  white_ffffff,
                                  FontWeight.w500,
                                  FontStyle.normal,
                                  -0.88),
                            )),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
