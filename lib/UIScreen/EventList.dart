import 'package:blackchecktech/Screens/Home/Profile/model/EventList2Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Layout/BlackButton.dart';
import '../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Utilities/Constant.dart';
import '../Utilities/TextUtilities.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List<EventList2Model> eventList = [
    EventList2Model('Ria Rich', 'Startup Bootcamp 2022',
        "Dec 24, 2021 at 14:00 PM", "Royal Avenue", "Paid"),
    EventList2Model('Ria Rich', 'Startup Bootcamp 2022',
        "Dec 24, 2021 at 14:00 PM", "Royal Avenue", "Free"),
    EventList2Model('Ria Rich', 'Startup Bootcamp 2022',
        "Dec 24, 2021 at 14:00 PM", "Royal Avenue", "Invite only"),
  ];
  String? dropdownValue;
  String? cityValue;

  DateTime dateFrom = DateTime(2022, 01, 01);

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
                Container(
                    margin: EdgeInsets.only(top: 15.h),
                    child: ToolbarWithHeaderCenterTitle("EVENTS")),
                Container(
                  margin: EdgeInsets.only(top: 32.h, right: 16.w, left: 16.w),
                  padding: EdgeInsets.only(
                      top: 8.h, left: 16.w, right: 8.w, bottom: 8.h),
                  decoration: BoxDecoration(
                      // border: Border.all(color: grey_aaaaaa, width: 0.w),
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color: grey_f5f5f5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(search),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: new TextField(
                          // controller: titleController,
                          style: const TextStyle(
                              color: black_121212,
                              fontFamily: helveticaNeueNeue_medium,
                              fontSize: 14.0),
                          decoration: new InputDecoration(
                            isDense: true,
                            hintText:
                                "Search by event name, venue, speakers ...",
                            hintStyle: TextStyle(
                                color: grey_aaaaaa,
                                fontFamily: helveticaNeueNeue_medium,
                                fontSize: 14.0.sp),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Container(
                        width: 44.r,
                        height: 44.r,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 6,
                              blurRadius: 10,
                              offset:
                                  Offset(1, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.r),
                          child: SvgPicture.asset(
                            filter,
                            width: 16.w,
                            height: 16.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h, left: 16.w, right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Filter by",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: black_121212,
                            fontFamily: helvetica_neu_bold),
                      ),
                      Text(
                        "Clear filter",
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: black_121212,
                            fontFamily: roboto_regular),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 14.w, left: 35.w),
                            margin: EdgeInsets.only(left: 16.w, right: 8.w),
                            decoration: BoxDecoration(
                              color: grey_f5f5f5,
                              borderRadius: BorderRadius.circular(4.r),
                              // border: Border.all(color: Colors.black,width: 1)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: new Text("City",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontSize: 15.0.sp)),
                                value: cityValue,
                                isExpanded: true,
                                icon: SvgPicture.asset(
                                  icon_down_arrow_spinner,
                                  color: grey_aaaaaa,
                                  height: 15.h,
                                  width: 15.w,
                                ),
                                iconSize: 24.sp,
                                elevation: 16,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontFamily: helveticaNeueNeue_medium),
                                // underline: Container(
                                //   height: 2,
                                //   color: Colors.deepPurpleAccent,
                                // ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    cityValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Vadodara',
                                  'Mumbai',
                                  'Anand'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15.h, left: 25.w),
                              child: SvgPicture.asset(
                                icon_location,
                                height: 20.h,
                                width: 20.w,
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 14.h, horizontal: 15.w),
                          margin: EdgeInsets.only(left: 8.w, right: 16.w),
                          decoration: BoxDecoration(
                            color: grey_f5f5f5,
                            borderRadius: BorderRadius.circular(4.r),
                            // border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SvgPicture.asset(
                                icon_calendar,
                                height: 20.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Expanded(
                                flex: 1,
                                child: TextField(
                                    focusNode: AlwaysDisabledFocusNode(),
                                    decoration: new InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      hintText:
                                          '${dateFrom.day}/${dateFrom.month}/${dateFrom.year}',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                            fontSize: 15,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            color: Colors.black,
                                          ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontSize: 15.sp),
                                    onTap: () {
                                      selectDate(context);
                                    }),
                              ),
                              SvgPicture.asset(
                                icon_down_arrow_spinner,
                                color: grey_aaaaaa,
                                height: 15.h,
                                width: 15.w,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 14.w, left: 35.w),
                      margin: EdgeInsets.only(left: 16.w, right: 16.w),
                      decoration: BoxDecoration(
                        color: grey_f5f5f5,
                        borderRadius: BorderRadius.circular(4.r),
                        // border: Border.all(color: Colors.black,width: 1)
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: new Text("Type of event",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: helveticaNeueNeue_medium,
                                  fontSize: 15.0.sp)),

                          value: dropdownValue,
                          isExpanded: true,
                          icon: SvgPicture.asset(
                            icon_down_arrow_spinner,
                            color: grey_aaaaaa,
                            height: 15.h,
                            width: 15.w,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontFamily: helveticaNeueNeue_medium),
                          // underline: Container(
                          //   height: 2,
                          //   color: Colors.deepPurpleAccent,
                          // ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['CLassic', 'Rock', 'Filmy']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 15.h, left: 25.w),
                        child: SvgPicture.asset(
                          icon_ticket,
                          height: 20.h,
                          width: 20.w,
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                  child: BlackButton("Apply Filter", Colors.white, () {}),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 16.w, right: 10.w, bottom: 13.h, top: 13.h),
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
                          padding: const EdgeInsets.only(bottom: 32.0),
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
                      }),
                ),

                Container(
                  margin: EdgeInsets.only(bottom: 25.h),
                  child: Center(
                    child: Text("Load More",style: TextStyle(fontFamily: roboto_bold,
                    fontSize: 14.sp,color: blue_0a84ff),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2040),
    );
    if (newDate == null) return;
    setState(() => dateFrom = newDate);
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
