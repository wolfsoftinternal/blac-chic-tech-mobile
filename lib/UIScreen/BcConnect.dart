import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/InputTextLayout.dart';
import 'package:blackchecktech/Layout/InputTextStatic.dart';
import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';

import '../Model/FollowFriendModel.dart';
import '../Styles/my_strings.dart';


class BcConnect extends StatefulWidget {
  const BcConnect({Key? key}) : super(key: key);

  @override
  _BcConnectState createState() => _BcConnectState();
}

class _BcConnectState extends State<BcConnect> {

  List<FollowFriendModel> onFollowFriendModel = [
    FollowFriendModel('assets/images/grid_img_one.png', 'Fruit'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Cold Drink'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Fruit'),
    FollowFriendModel('assets/images/grid_img_one.png', 'Cold Drink'),
  ];

  var _firstnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
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

              Padding(
                padding:  EdgeInsets.only(left: 16.w,right: 16.w,top: 32.h),
                child: InputTextStaic(
                  str_first_name,
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


              SizedBox(height: 16.h,),
              // Rectangle 1363
              GridView.builder(
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 8.w,right: 8.w,bottom: 10),
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.73,
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0),
                itemCount: onFollowFriendModel.length,
                itemBuilder: (context, i) => Padding(
                  padding:  EdgeInsets.only(left: 8.w,right: 8.w,bottom: 16),
                  child: Container(
                      width: double.infinity,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(4.r)
                          ),
                          boxShadow: [BoxShadow(
                              color: const Color(0x19121212),
                              offset: Offset(0,30),
                              blurRadius: 60,
                              spreadRadius: 0
                          )] ,
                          color: const Color(0xffffffff)
                      ),
                    child: Stack(
                      alignment: Alignment.center,
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
                                        topLeft: Radius.circular(4)
                                        ,topRight: Radius.circular(4)),
                                    child: Image.asset(onFollowFriendModel[i].title,width: double.infinity,fit: BoxFit.fill,height: 134.h,)),

                                // unsplash:27xbM3bF9_s
                                Container(
                                    width: double.infinity,
                                    height: 134.h,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [ Color(0x00121212),  Color(0xff121212)]),

                                    )
                                ),

                                // Jessie J
                                Center(
                                  child: Padding(
                                    padding:  EdgeInsets.only(bottom: 20.h),
                                    child: Column(
                                      children: [
                                        Text(
                                            onFollowFriendModel[i].subtitle,
                                            style:  TextStyle(
                                                color:  white_ffffff,
                                                fontWeight: FontWeight.w900,
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
                                                  fontSize: 8.0
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
                                      style: const TextStyle(
                                          color:  const Color(0xffaaaaaa),
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "NeueHelvetica",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 8.0
                                      ),
                                      textAlign: TextAlign.left
                                  ),
                                  SizedBox(height: 2.h,),
                                  // UI/UX Design | Venture Capital Funding | Life Advice Kubernetes Talk
                                  Text(
                                      "UI/UX Design | Venture Capital Funding | Life Advice Kubernetes Talk",
                                      style: const TextStyle(
                                          color:  const Color(0xff121212),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "NeueHelvetica",
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 10.0
                                      ),
                                      textAlign: TextAlign.left
                                  )
                                ],
                              ),
                            )

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 33),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [Color(0xff1c2535), Color(0xff04080f)]),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x26121212).withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: // Followed
                            Padding(
                              padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                              child: Text(
                                  "Followed",
                                  style: const TextStyle(
                                      color:  const Color(0xffffffff),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "NeueHelvetica",
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 11.0
                                  ),
                                  textAlign: TextAlign.left
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ));
  }
}