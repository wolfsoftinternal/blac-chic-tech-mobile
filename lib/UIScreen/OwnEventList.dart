import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Layout/ToolbarBackOnly.dart';
import '../Model/EventList2Model.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Utilities/Constant.dart';
import '../Utilities/TextUtilities.dart';

class OwnEventList extends StatefulWidget {
  const OwnEventList({Key? key}) : super(key: key);

  @override
  _OwnEventListState createState() => _OwnEventListState();
}

class _OwnEventListState extends State<OwnEventList> {
  List<EventList2Model> eventList = [
    EventList2Model('Ria Rich', 'Startup Bootcamp 2022',
        "Dec 24, 2021 at 14:00 PM", "Royal Avenue", "Paid"),
    EventList2Model('Ria Rich', 'Startup Bootcamp 2022',
        "Dec 24, 2021 at 14:00 PM", "Royal Avenue", "Free"),
    EventList2Model('Ria Rich', 'Startup Bootcamp 2022',
        "Dec 24, 2021 at 14:00 PM", "Royal Avenue", "Invite only"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*---- Toolbar ----*/
                Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Row(
                    children: [
                      BackLayout(),
                      Container(
                        height: 48.h,
                        width: 48.w,
                      ),
                      const Spacer(),
                      Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: SvgPicture.asset(
                                placeholder,
                                height: 48.h,
                                width: 48.w,
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          // createBottomSheet(context);
                        },
                        child: Container(
                          width: 48.w,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 8.w),
                            child: SvgPicture.asset(
                              add_icon,
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: GestureDetector(
                          onTap: () {},
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
                    ],
                  ),
                ),

                SizedBox(
                  height: 24.h,
                ),

                /*------ List View ------*/
                Container(
                  margin: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      itemCount: eventList.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 32.h),
                          child: Stack(
                            children: [
                              Container(
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
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xe6ff881a),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.r)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            eventList[i].tvPaymentType,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontFamily: roboto_bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: 29.h,
                                          width: 133.w,
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
                                                padding: EdgeInsets.only(
                                                    left: 6.0.w, right: 6.0.w),
                                                child: Icon(
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
                      }
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
