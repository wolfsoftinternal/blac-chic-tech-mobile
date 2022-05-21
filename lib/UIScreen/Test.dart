import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
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
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                  boxShadow: [
                    BoxShadow(
                      color:
                      Color(0x19121212),
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
                        Image.asset(
                          icon_instagram,
                          height: 134,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          // height: double.infinity,
                          // width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0x00121212), Color(0xff121212)],
                              stops: [0.0, 5.0],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 55),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Jessie J",
                                    style: TextStyle(
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontSize: 12.sp,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  SvgPicture.asset(filter),
                                ],
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Center(
                                child: Text(
                                  "Product manager and brand\nstrategist @capitalone",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: 1.3,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontSize: 12.sp,
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
                        padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 11.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          boxShadow: [
                            BoxShadow(
                              color:
                              Color(0x194343b2).withOpacity(0.15),
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
                        child: Text("Followed",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: helvetica_neu_bold,fontSize: 11
                        ),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0,left: 16),
                      child: Text("Come to me for",style: TextStyle(
                        fontSize: 8.sp,fontFamily: helveticaNeueNeue_medium,
                        color: grey_aaaaaa
                      ),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4,left: 16,right: 16),
                      child: Text("UI/UX Design | Venture Capital Funding | Life Advice Kubernetes Talk",style: TextStyle(
                        fontSize: 10.sp,fontFamily: helvetica_neu_bold,
                        color: black_121212
                      ),),
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
