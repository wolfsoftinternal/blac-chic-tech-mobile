import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/EventSearchModel.dart';
import '../Utilities/TextUtilities.dart';

class EventSearch extends StatefulWidget {
  const EventSearch({Key? key}) : super(key: key);

  @override
  _EventSearchState createState() => _EventSearchState();
}

class _EventSearchState extends State<EventSearch> {
  List<EventSearchModel> eventSerchList = [
    EventSearchModel('Ria Rich', 'Startup Bootcamp 2022',
        "Dec 24, 2021 at 14:00 PM", "Royal Avenue"),
    EventSearchModel('Ria Rich', 'Startup Bootcamp 2022',
        "Dec 24, 2021 at 14:00 PM", "Royal Avenue"),
    EventSearchModel('Ria Rich', 'Startup Bootcamp 2022',
        "Dec 24, 2021 at 14:00 PM", "Royal Avenue"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  margin: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w),
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                      // border: Border.all(color: grey_e9ecec, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: grey_f5f5f5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(search),
                      SizedBox(width: 16.w,),
                      Expanded(
                        child: new TextField(
                          style: const TextStyle(
                              color: black_121212,
                              fontFamily: roboto_medium,
                              fontSize: 14.0),
                          decoration: new InputDecoration(
                            isDense: true,
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color: black_121212,
                                fontFamily: roboto_medium,
                                fontSize: 14.0),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      SvgPicture.asset(search),

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
                      itemCount: eventSerchList.length,
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
                                      top: 8.h, right: 8.w),
                                  child: Container(
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
                                              eventSerchList[i].tvUserName,
                                              11,
                                              white_ffffff,
                                              FontWeight.w500,
                                              FontStyle.normal,
                                              -0.22),
                                        ],
                                      )),
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
                                              eventSerchList[i].tvEventDate,
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
                                              eventSerchList[i].tvEventVenue,
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
                                        eventSerchList[i].tvEventName,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
