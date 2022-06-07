import 'package:blackchecktech/Layout/ToolbarWithTitle.dart';
import 'package:blackchecktech/Model/EventList2Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Layout/InputTextStaticFilter.dart';
import '../Layout/ToolbarBackOnly.dart';
import '../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Utilities/Constant.dart';
import '../Utilities/TextUtilities.dart';

class EventList2 extends StatefulWidget {
  @override
  _EventList2State createState() => _EventList2State();
}

class _EventList2State extends State<EventList2> {
  List<EventList2Model> eventList = [
    EventList2Model('Ria Rich', 'Startup Bootcamp 2022',
        "Dec 24, 2021 at 14:00 PM", "Royal Avenue", "Paid"),
    EventList2Model('Ria Rich', 'Startup Bootcamp 2022',
        "Dec 24, 2021 at 14:00 PM", "Royal Avenue", "Free"),
    EventList2Model('Ria Rich', 'Startup Bootcamp 2022',
        "Dec 24, 2021 at 14:00 PM", "Royal Avenue", "Invite only"),
  ];


  bool isLayoutFirst = false;
  final _firstnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 15.h,),

              ToolbarWithTitle("EVENTS"),


              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 32.h),
                child: InputTextStaicFilter(
                    "Search by event name, venue, speakers ...",
                    _firstnameController,
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
              Container(
                margin: EdgeInsets.only(left: 16.w, right: 16.w),
                child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: eventList.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Stack(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                height: 207.h,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                                  child: SvgPicture.asset(
                                    placeholder,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 207.h,
                                  ),
                                )),
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
                                          eventList[i].tvPaymentType,
                                          style: const TextStyle(
                                              fontSize: 12,
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
                                                eventList[i].tvUserName,
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
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        calendar_icon,
                                        height: 12,
                                        width: 12,
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 4.0),
                                        child: setHelceticaBold(
                                            eventList[i].tvEventDate,
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
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(right: 4.0),
                                        child: setHelceticaBold(
                                            eventList[i].tvEventVenue,
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
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: setHelceticaBold(
                                      eventList[i].tvEventName,
                                      22,
                                      white_ffffff,
                                      FontWeight.w500,
                                      FontStyle.normal,
                                      -0.88),
                                )),
                          ],
                        ),
                      );
                    }),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 25.h),
                child: Center(
                  child: Text(
                    "Load More", style: TextStyle(fontFamily: roboto_bold,
                      fontSize: 14.sp, color: blue_0a84ff),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
