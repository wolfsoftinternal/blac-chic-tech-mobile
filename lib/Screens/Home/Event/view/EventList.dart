import 'package:blackchecktech/Layout/InputTextStaticFilter.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/Event/controller/EventDetailController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  EventDetailController controller = Get.put(EventDetailController());
  AdmireProfileController admireProfileController = Get.put(AdmireProfileController());

  bool isLayoutFirst = false;
  final _firstnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkNet(context).then((value) {
      controller.allEventListApi(null);
      controller.cityListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Container(child: ToolbarWithHeaderCenterTitle("EVENTS")),

                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 32.h),
                  child: InputTextStaicFilter(
                      "Search by event name, venue, speakers ...",
                      controller.searchController.value,
                      false,
                      TextInputAction.next,
                      TextInputType.text),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 16.w, right: 10.w, bottom: 10.h, top: 10.h),
                  margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 15.h),
                  decoration: BoxDecoration(
                      border: Border.all(color: blue_0a84ff, width: 1.w),
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        icon_ticket,
                        height: 15.h,
                        width: 15.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Text(
                          "My Event",
                          style: TextStyle(
                              fontFamily: helveticaNeueNeue_medium,
                              fontSize: 15.sp,
                              color: black_121212),
                        ),
                      ),
                      SvgPicture.asset(
                        icon_right_forward_arrow,
                        height: 16.h,
                        width: 16.w,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                controller.eventList.isEmpty
                    ? SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              img_logo,
                              height: 80,
                              width: 80,
                            ),
                            setHelceticaBold("NO EVENTS YET", 16, grey_aaaaaa,
                                FontWeight.w500, FontStyle.normal, 0.5)
                          ],
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(left: 16.w, right: 16.w),
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: controller.eventList.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {
                                  checkNet(context).then((value) {
                                    admireProfileController.eventDetailAPI(context,
                                        controller.eventList[i].id, 'event');
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 32.h),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width,
                                        height: 207.h,
                                        child: controller.eventList[i].poster ==
                                                null
                                            ? ClipRRect(
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(5)),
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
                                                borderRadius: const BorderRadius.all(
                                                    Radius.circular(5)),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      controller.eventList[i].poster!,
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
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 8.h, left: 8.w, right: 8.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15.w),
                                                height: 26.h,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xe6ff881a),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(25.r)),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    controller.eventList[i].type!,
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        fontFamily: roboto_bold),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  padding:
                                                      EdgeInsets.only(right: 6.w),
                                                  height: 29.h,
                                                  decoration: BoxDecoration(
                                                    gradient: const LinearGradient(
                                                        colors: [
                                                          Color(0xff1c2535),
                                                          Color(0xff04080f)
                                                        ]),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(4.r)),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 6.0.w,
                                                            right: 6.0.w),
                                                        child: const Icon(
                                                          Icons.person,
                                                          size: 17,
                                                          color: grey_aaaaaa,
                                                        ),
                                                      ),
                                                      setHelveticaMedium(
                                                          "Hosted by",
                                                          11,
                                                          gray_b3ffffff,
                                                          FontWeight.w500,
                                                          FontStyle.normal,
                                                          -0.22),
                                                      SizedBox(
                                                        width: 4.w,
                                                      ),
                                                      setHelceticaBold(
                                                          controller.eventList[i]
                                                                  .hosts![0]
                                                                  .firstName! +
                                                              controller.eventList[i]
                                                                  .hosts![0]
                                                                  .lastName!,
                                                          11,
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
                                          bottom: 19,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 16.0),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  calendar_icon,
                                                  height: 12,
                                                  width: 12,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 4.0),
                                                  child: setHelceticaBold(
                                                      '${DateFormat("MMM dd, yyyy").format(controller.eventList[i].startDateTime!)} at ${DateFormat("hh:mm a").format(controller.eventList[i].startDateTime!)}',
                                                      10,
                                                      white_ffffff,
                                                      FontWeight.w500,
                                                      FontStyle.normal,
                                                      -0.4),
                                                ),
                                              ],
                                            ),
                                          )),
                                      Positioned(
                                          bottom: 19,
                                          right: 16,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 16.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 4.0),
                                                  child: setHelceticaBold(
                                                      controller.eventList[i].venue!,
                                                      10,
                                                      white_ffffff,
                                                      FontWeight.w500,
                                                      FontStyle.normal,
                                                      -0.4),
                                                ),
                                                SvgPicture.asset(
                                                  icon_location,
                                                  height: 12,
                                                  width: 12,
                                                ),
                                              ],
                                            ),
                                          )),
                                      Positioned(
                                          bottom: 40,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 16.0),
                                            child: setHelceticaBold(
                                                controller.eventList[i].title!,
                                                22,
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

                // Container(
                //   margin: EdgeInsets.only(bottom: 25.h),
                //   child: Center(
                //     child: Text(
                //       "Load More", style: TextStyle(fontFamily: roboto_bold,
                //         fontSize: 14.sp, color: blue_0a84ff),),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}