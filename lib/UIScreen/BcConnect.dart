import 'package:blackchecktech/Layout/InputTextStatic.dart';
import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/FollowFriendModel.dart';


class BcConnect extends StatefulWidget {
  const BcConnect({Key? key}) : super(key: key);

  @override
  _BcConnectState createState() => _BcConnectState();
}

class _BcConnectState extends State<BcConnect> {

  String? dropdownValue;

  List<FollowFriendModel> onFollowFriendModel = [
    FollowFriendModel('assets/images/grid_img_one.png', 'Queen South'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Jessica J'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Queen South'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Jessica J'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Queen South'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Jessica J'),
  ];

  final _firstnameController = TextEditingController();

  bool isFollow = true;
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor:  Colors.white, // navigation bar color
      statusBarColor:  Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    ));


    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h,),
              Stack(
               children: [
                 BackLayout(),
                 // BC-CONNECT
                 Padding(
                   padding: EdgeInsets.only(top: 14.h),
                   child: Center(
                     child: Text(
                         "BC-CONNECT",
                         style:  TextStyle(
                             color:  black_121212,
                             fontWeight: FontWeight.w900,
                             fontFamily: "NeueHelvetica",
                             fontStyle:  FontStyle.normal,
                             fontSize: 16.sp
                         ),
                         textAlign: TextAlign.right
                     ),
                   ),
                 )
               ],
             ),

              SizedBox(height: 32.h,),

              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                        child: InputTextStaic(
                          "Search by speakers, industry, role ...",
                          _firstnameController,
                          false,
                          TextInputAction.next,
                          TextInputType.text),
                      ),


                      // Recently Search
                      Padding(
                        padding:  EdgeInsets.only(left: 16.w,top: 24.h),
                        child: Text(
                            "Recently Search",
                            style:  TextStyle(
                                color:  black_121212,
                                fontWeight: FontWeight.w900,
                                fontFamily: "NeueHelvetica",
                                fontStyle:  FontStyle.normal,
                                fontSize: 16.sp
                            ),
                            textAlign: TextAlign.left
                        ),
                      ),


                      //   SizedBox(height: 16.h,),
                      // Rectangle 1363
                      GridView.builder(
                        primary: false,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 8.w,right: 8.w,bottom: 10.h,top: 16.h),
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.78.h,
                            mainAxisSpacing: 0.0,
                            crossAxisSpacing: 0.0),
                        itemCount: onFollowFriendModel.length,
                        itemBuilder: (context, i) => Padding(
                          padding:  EdgeInsets.only(left: 8.w,right: 8.w,bottom: 16.h),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(4.r)
                                ),
                                boxShadow: const [BoxShadow(
                                    color:  Color(0x19121212),
                                    offset: Offset(0,30),
                                    blurRadius: 60,
                                    spreadRadius: 0
                                )] ,
                                color: white_ffffff
                            ),
                            child: Stack(
                          //    alignment: Alignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [

                                        ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.r)
                                                ,topRight: Radius.circular(4.r)),
                                            child: Image.asset(onFollowFriendModel[i].title,width: double.infinity,fit: BoxFit.fill,height: 134.h,)),

                                        // unsplash:27xbM3bF9_s
                                        Container(
                                            width: double.infinity,
                                            height: 134.h,
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [ Color(0x00121212),  Color(0xff121212)]),

                                            )
                                        ),

                                        // Jessie J
                                        Center(
                                          child: Padding(
                                            padding:  EdgeInsets.only(bottom: 25.h),
                                            child: Column(
                                              children: [
                                                Text(
                                                    onFollowFriendModel[i].subtitle,
                                                    style:  TextStyle(
                                                        color:  white_ffffff,
                                                        fontWeight: FontWeight.w500,
                                                        fontFamily: "NeueHelvetica",
                                                        fontStyle:  FontStyle.normal,
                                                        fontSize: 12.sp
                                                    ),
                                                    textAlign: TextAlign.left
                                                ),

                                                Opacity(
                                                  opacity : 0.699999988079071,
                                                  child:   Text(
                                                      "Product manager and brand strategist @capitalone",
                                                      style:  TextStyle(
                                                          color:  white_ffffff,
                                                          fontWeight: FontWeight.w500,
                                                          fontFamily: "NeueHelvetica",
                                                          fontStyle:  FontStyle.normal,
                                                          fontSize: 8.sp
                                                      ),
                                                      textAlign: TextAlign.center
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                        // Product manager and brand strategist @capitalone



                                      ],
                                    ),

                                    // Come to me for
                                    Padding(
                                      padding:  EdgeInsets.only(left: 16.w,top: 25.h,right: 16.w,bottom: 16.h),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Come to me for",
                                              style:  TextStyle(
                                                  color:  grey_aaaaaa,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: "NeueHelvetica",
                                                  fontStyle:  FontStyle.normal,
                                                  fontSize: 8.sp
                                              ),
                                              textAlign: TextAlign.left
                                          ),
                                          SizedBox(height: 2.h,),
                                          // UI/UX Design | Venture Capital Funding | Life Advice Kubernetes Talk
                                          Text(
                                              "UI/UX Design | Venture Capital Funding | Life Advice Kubernetes Talk",
                                              style:  TextStyle(
                                                  color:  black_121212,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "NeueHelvetica",
                                                  fontStyle:  FontStyle.normal,
                                                  fontSize: 10.sp
                                              ),
                                              textAlign: TextAlign.left
                                          )
                                        ],
                                      ),
                                    )

                                  ],
                                ),

                                Visibility(
                                  visible: isFollowed,
                                  child: Positioned(
                                    top: 115.h,
                                    left: 40.w,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          isFollowed = false;
                                          isFollow = true;
                                        });
                                      },
                                      child: Padding(
                                        padding:  EdgeInsets.only(top: 0.h),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50.r),
                                            gradient: const LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [Color(0xff1c2535), Color(0xff04080f)]),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0x26121212).withOpacity(0.2),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: // Followed
                                          Padding(
                                            padding:  EdgeInsets.only(left: 20.w,right: 20.w,top: 10.h,bottom: 10.h),
                                            child: Text(
                                                "Followed",
                                                style:  TextStyle(
                                                    color:  const Color(0xffffffff),
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "NeueHelvetica",
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 11.sp
                                                ),
                                                textAlign: TextAlign.left
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                Visibility(
                                  visible: isFollow,
                                  child: Positioned(
                                    top: 115.h,
                                    left: 40.w,
                                    child: GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          isFollowed = true;
                                          isFollow = false;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 17.w, vertical: 11.h),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(40.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0x194343b2).withOpacity(0.15),
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),



            ],
          ),
        ));
  }
}
