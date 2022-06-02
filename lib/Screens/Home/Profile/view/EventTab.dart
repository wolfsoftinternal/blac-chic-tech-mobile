import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/EventDetail.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/EventListDetail.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventTab extends StatefulWidget {
  EventTab({Key? key}) : super(key: key);

  @override
  State<EventTab> createState() => _EventTabState();
}

class _EventTabState extends State<EventTab> {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => controller.eventList.isEmpty
            ? Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      img_logo,
                      height: 80.h,
                      width: 80.w,
                    ),
                    setHelceticaBold("NO EVENTS YET", 16.sp, grey_aaaaaa,
                        FontWeight.w500, FontStyle.normal, 0.5)
                  ],
                ),
              )
            : Padding(
                padding:  EdgeInsets.only(left: 24.w, right: 24.w),
                child: ListView(
                  physics: ScrollPhysics(), // <-- this will disable scroll
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        setHelceticaBold('Upcomming Events', 14.sp, black_121212,
                            FontWeight.w500, FontStyle.normal, -0.56),
                        SizedBox(
                          height: 32.h,
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: controller.eventList.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(EventListDetail(
                                      id: controller.eventList[index].id));
                                },
                                child: Padding(
                                  padding:  EdgeInsets.only(bottom: 16.h),
                                  child: Stack(
                                    children: [
                                      Container(
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
                                            width: MediaQuery.of(context).size.width,
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
                                            width: MediaQuery.of(context).size.width,
                                            height: 207.h,
                                            progressIndicatorBuilder:
                                                (context, url,
                                                downloadProgress) =>
                                                SvgPicture.asset(
                                                  placeholder,
                                                  fit: BoxFit.cover,
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 207.h,
                                                ),
                                            errorWidget:
                                                (context, url, error) =>
                                                SvgPicture.asset(
                                                  placeholder,
                                                  fit: BoxFit.cover,
                                                  width: MediaQuery.of(context).size.width,
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
                                                end:Alignment.bottomCenter,
                                                colors: [ Color(0x00121212),
                                                  Color(0xff121212)])

                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.only(
                                                top: 8.h, left: 8.w),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: orange.withOpacity(0.7),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(40.r)),
                                                ),
                                                child: Padding(
                                                  padding:
                                                   EdgeInsets.only(left: 14.w,right: 14.w,top: 7.h,bottom: 7.h),
                                                  child:// Paid
                                                  Text(
                                                      controller
                                                          .eventList[index].type!,
                                                      style:  TextStyle(
                                                          color:  Colors.white,
                                                          fontWeight: FontWeight.w700,
                                                          fontFamily: roboto_bold,
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 12.sp
                                                      ),
                                                      textAlign: TextAlign.center
                                                  ),
                                                  // setHelveticaMedium(
                                                  //     controller
                                                  //         .eventList[index].type!,
                                                  //     12.sp,
                                                  //     white_ffffff,
                                                  //     FontWeight.w500,
                                                  //     FontStyle.normal),
                                                )),
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.only(
                                                top: 8.h, right: 8.w),
                                            child: Container(
                                                height: 29.h,

                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(colors: [
                                                    Color(0xff1c2535),
                                                    Color(0xff04080f)
                                                  ]),
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(4.r)),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                      EdgeInsets.only(
                                                          left: 6.w,
                                                          right: 6.w),
                                                      child: Icon(
                                                        Icons.person,
                                                        size: 15.r,
                                                        color: grey_aaaaaa,
                                                      ),
                                                    ),
                                                    setHelceticaBold(
                                                        controller
                                                            .eventList[index]
                                                            .hosts![0]
                                                            .firstName! +
                                                            controller
                                                                .eventList[index]
                                                                .hosts![0]
                                                                .lastName!,
                                                        11.sp,
                                                        white_ffffff,
                                                        FontWeight.w500,
                                                        FontStyle.normal,
                                                        -0.22),

                                                    SizedBox(width: 6.w,)
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),

                                      Positioned(
                                          bottom: 19.h,
                                          child: Padding(
                                            padding:
                                            EdgeInsets.only(left: 16.w),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  calendar_icon,
                                                  height: 12.h,
                                                  width: 12.w,
                                                ),
                                                Padding(
                                                  padding:  EdgeInsets.only(
                                                      left: 4.w),
                                                  child: setHelveticaMedium(
                                                      '${DateFormat("MMM dd, yyyy").format(controller.eventList[index].startDateTime!)} at ${DateFormat("hh:mm a").format(controller.eventList[index].startDateTime!)}',
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
                                            padding:
                                            EdgeInsets.only(left: 16.w),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:  EdgeInsets.only(
                                                      right: 4.w),
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
                                            padding:
                                            EdgeInsets.only(left: 16.w),
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
                              );
                            }),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
