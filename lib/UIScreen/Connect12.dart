import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Model/FollowGridModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

class Connect12 extends StatefulWidget {
  const Connect12({Key? key}) : super(key: key);

  @override
  _Connect12State createState() => _Connect12State();
}

class _Connect12State extends State<Connect12> {
  String? dropdownValue;
  List<FollowGridModel> resultGridModel = [
    FollowGridModel(
        photo_user,
        "Jessie Ellen",
        "Product manager and brand\nstrategist @capitalone",
        "UI/UX Design | Venture Capital Funding | Life Advice Kubernetes Talk"),
    FollowGridModel(
        photo_user,
        "Jessie J",
        "Product manager and brand\nstrategist @capitalone",
        "Growth Strategy | Help With Design | Kubernetes Talk"),
    FollowGridModel(
        photo_user,
        "Queen South",
        "Product manager and brand\nstrategist @capitalone",
        "UI/UX Design | Venture Capital Funding | Life Advice Kubernetes Talk"),
    FollowGridModel(
        photo_user,
        "Jessie J",
        "Product manager and brand\nstrategist @capitalone",
        "Growth Strategy | Help With Design | Kubernetes Talk"),
    FollowGridModel(
        photo_user,
        "Queen South",
        "Product manager and brand\nstrategist @capitalone",
        "UI/UX Design | Venture Capital Funding | Life Advice Kubernetes Talk"),
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
                Container(
                    margin: EdgeInsets.only(top: 33.h),
                    child: ToolbarWithHeaderCenterTitle("BC-CONNECT")),
                Container(
                  margin: EdgeInsets.only(top: 32.h, right: 16.w, left: 16.w),
                  padding: EdgeInsets.only(
                      top: 8.h, left: 16.w, right: 8.w, bottom: 8.h),
                  decoration: BoxDecoration(
                      // border: Border.all(color: grey_aaaaaa, width: 0.w),
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      color:grey_f5f5f5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
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
                            hintText: "Search",
                            hintStyle: TextStyle(
                                color: black_121212,
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
                Container(
                  margin: EdgeInsets.only(top: 16.h, right: 16.w, left: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 16, right: 10),
                          decoration: BoxDecoration(
                            color: grey_f5f5f5,
                            borderRadius: BorderRadius.circular(4),
                            // border: Border.all(color: Colors.black,width: 4)
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: new Text(
                                "Role",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: helveticaNeueNeue_medium),
                              ),
                              value: dropdownValue,
                              isExpanded: true,
                              icon: SvgPicture.asset(
                                icon_down_arrow_spinner,
                                color: grey_aaaaaa,
                                height: 16,
                                width: 16,
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
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
                              items: <String>[
                                'One',
                                'Two',
                                'Three',
                                'Four',
                                'Five',
                                'Six',
                                'Seven'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 16, right: 10),
                          decoration: BoxDecoration(
                            color: grey_f5f5f5,
                            borderRadius: BorderRadius.circular(4),
                            // border: Border.all(color: Colors.black,width: 4)
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: new Text(
                                "Industry",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: helveticaNeueNeue_medium),
                              ),
                              value: dropdownValue,
                              isExpanded: true,
                              icon: SvgPicture.asset(
                                icon_down_arrow_spinner,
                                color: grey_aaaaaa,
                                height: 16,
                                width: 16,
                              ),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
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
                              items: <String>[
                                'One',
                                'Two',
                                'Three',
                                'Four',
                                'Five',
                                'Six',
                                'Seven'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16, right: 10),
                  margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                  decoration: BoxDecoration(
                    color: grey_f5f5f5,
                    borderRadius: BorderRadius.circular(4),
                    // border: Border.all(color: Colors.black,width: 4)
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: new Text(
                        "Country",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: helveticaNeueNeue_medium),
                      ),
                      value: dropdownValue,
                      isExpanded: true,
                      icon: SvgPicture.asset(
                        icon_down_arrow_spinner,
                        color: grey_aaaaaa,
                        height: 16,
                        width: 16,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
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
                      items: <String>[
                        'One',
                        'Two',
                        'Three',
                        'Four',
                        'Five',
                        'Six',
                        'Seven'
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
                  margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                  child: BlackButton("Apply Filter", Colors.white, () {}),
                ),
                Container(
                  height: 1.h,
                  margin: EdgeInsets.only(top: 16.h),
                  color: grey_f4f6f6,
                ),
                Container(
                  margin: EdgeInsets.only(top: 24.h, left: 16.h),
                  child: Text(
                    "450 Results",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: black_121212,
                        fontFamily: helvetica_neu_bold),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 15.w, right: 10.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.72 / 1,
                      crossAxisSpacing: 17,
                      mainAxisSpacing: 3),
                  itemCount: resultGridModel.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 19),
                      height: 0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            bottomLeft: Radius.circular(8.0.w),
                            bottomRight: Radius.circular(8.0.w)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19121212),
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.0.w),
                                      topRight: Radius.circular(8.0.w)),
                                  child: Image.asset(
                                    resultGridModel[i].imgProfile,
                                    height: 134.h,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Image.asset(
                                resultGridModel[i].imgProfile,
                                height: 134.h,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0x00121212),
                                      Color(0xff121212)
                                    ],
                                    stops: [0.0, 5.0],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 60.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          resultGridModel[i].tvUName,
                                          style: TextStyle(
                                              fontFamily:
                                                  helveticaNeueNeue_medium,
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        ),

                                        SvgPicture.asset(icon_tick_blue,height: 30,width: 30,)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Center(
                                      child: Text(
                                        resultGridModel[i].tvSubTitle,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 1.3.h,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontSize: 9.sp,
                                            color: opcity_white_ffffff),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Center(
                            child: Container(
                              transform: Matrix4.translationValues(0, -18, 0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18.w, vertical: 11.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x194343b2).withOpacity(0.15),
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                    blurRadius: 10.0,
                                    spreadRadius: 2.0,
                                  ), //BoxShadow
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff1c2535),
                                    Color(0xff04080f)
                                  ],
                                  stops: [0.0, 5.0],
                                ),
                              ),
                              child: Text(
                                "Followed",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: helvetica_neu_bold,
                                    fontSize: 11.sp),
                              ),
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(0, -9, 0),
                            margin: EdgeInsets.only(top: 0, left: 16.w),
                            child: Text(
                              "Come to me for",
                              style: TextStyle(
                                  fontSize: 8.sp,
                                  fontFamily: helveticaNeueNeue_medium,
                                  color: grey_aaaaaa),
                            ),
                          ),
                          Container(
                            transform: Matrix4.translationValues(0, -5, 0),
                            margin: EdgeInsets.only(
                                top: 0, left: 16.w, right: 16.w),
                            child: Text(
                              resultGridModel[i].tvDescription,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: helvetica_neu_bold,
                                  color: black_121212),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
