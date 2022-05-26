import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../Model/EventList2Model.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Utilities/Constant.dart';
import '../Utilities/TextUtilities.dart';

class MyPurchasedEvent extends StatefulWidget {
  const MyPurchasedEvent({Key? key}) : super(key: key);

  @override
  _MyPurchasedEventState createState() => _MyPurchasedEventState();
}

class _MyPurchasedEventState extends State<MyPurchasedEvent> {
  bool Bg1 = true;
  bool Bg2 = false;

  bool tv1 = true;
  bool tv2 = false;

  bool _isFirstLayout = true;
  bool _isSecondLayout = false;
  @override
  Widget build(BuildContext context) {
    /*------------ 1st Tab Data ----------*/

    List<EventList2Model> eventList = [
      EventList2Model('Ria Rich', 'Startup Bootcamp 2022',
          "Dec 24, 2021 at 14:00 PM", "Royal Avenue", "Paid"),
      EventList2Model('Ria Rich', 'Startup Bootcamp 2022',
          "Dec 24, 2021 at 14:00 PM", "Royal Avenue", "Free"),
      EventList2Model('Ria Rich', 'Startup Bootcamp 2022',
          "Dec 24, 2021 at 14:00 PM", "Royal Avenue", "Invite only"),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: ToolbarWithHeaderCenterTitle("MY EVENTS")),
              /*----- 2 Tab Layout ------*/
              Container(
                margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.w),
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
              Visibility(
                visible: _isFirstLayout,
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 16.w, right: 16.w,top: 24.h),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        primary: false,
                        itemCount: eventList.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
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
                                          height: 26.h,
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
                        }),
                  ),
                ),
              ),
              /*--------------- Past Tab --------------*/
              Visibility(
                visible: _isSecondLayout,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      margin: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
                      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        // border: Border.all(color: grey_e9ecec, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: grey_f5f5f5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SvgPicture.asset(
                            search,
                            color: grey_aaaaaa,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                  color: black_121212,
                                  fontFamily: roboto_medium,
                                  fontSize: 14.0),
                              decoration: new InputDecoration(
                                isDense: true,
                                hintText: "Search.......",
                                hintStyle: TextStyle(
                                    color: grey_aaaaaa,
                                    fontFamily: roboto_medium,
                                    fontSize: 14.0),
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
