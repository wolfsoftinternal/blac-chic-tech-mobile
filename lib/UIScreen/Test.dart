import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final PageController controller = PageController(initialPage: 200);

  void _pageChanged(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  transform: Matrix4.translationValues(0, -18, 0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 17.w, vertical: 11.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        icon_add_user,
                        height: 11.h,
                        width: 11.w,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        "Follow",
                        style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: helvetica_neu_bold,
                            color: black_121212),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  transform: Matrix4.translationValues(0, -18, 0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 11.h),
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
                      colors: [Color(0xff1c2535), Color(0xff04080f)],
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
              Center(child: InkWell(child: SvgPicture.asset(filter))),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Data",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
