import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarAdmire.dart';
import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Model/AdmiresModel.dart';


class AdmireGrid extends StatefulWidget {
  const AdmireGrid({Key? key}) : super(key: key);

  @override
  _AdmireGridState createState() => _AdmireGridState();
}

class _AdmireGridState extends State<AdmireGrid> {


  List<AdmiresModel> onAdmiresModel = [
    AdmiresModel('assets/images/grid_img_one.png', 'Claire','AdmiresModel'),
    AdmiresModel('assets/images/setting_girl_img.png', 'Jennifer','Adidas'),
    AdmiresModel('assets/images/grid_img_one.png', 'Georgia','Tesla'),
    AdmiresModel('assets/images/setting_girl_img.png', 'Reina','Apple'),
    AdmiresModel('assets/images/grid_img_one.png', 'Claire','AdmiresModel'),
    AdmiresModel('assets/images/grid_img_one.png', 'Jennifer','Adidas'),
    AdmiresModel('assets/images/grid_img_one.png', 'Georgia','Tesla'),
    AdmiresModel('assets/images/setting_girl_img.png', 'Reina','Apple'),
    AdmiresModel('assets/images/grid_img_one.png', 'Claire','AdmiresModel'),
    AdmiresModel('assets/images/setting_girl_img.png', 'Jennifer','Adidas'),
    AdmiresModel('assets/images/grid_img_one.png', 'Georgia','Tesla'),
    AdmiresModel('assets/images/grid_img_one.png', 'Reina','Apple'),
  ];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: ToolbarAdmire(context,"ADMIRES"),
          body: Column(
            children: [

              GridView.builder(
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 8.w,right: 8.w,bottom: 10.h,top: 16.h),
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.83.h,
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0),
                itemCount: onAdmiresModel.length,
                itemBuilder: (context, i) => Padding(
                  padding:  EdgeInsets.only(left: 8.w,right: 8.w,bottom: 16.h),
                  child: Column(
                    children: [

                      SizedBox(
                        width: 64.w,
                        height: 64.h,
                        child: CircularProfileAvatar(
                          '',
                          child: Image.asset(onAdmiresModel[i].image,fit: BoxFit.fill,),
                          borderColor: Colors.purpleAccent,
                          borderWidth: 0,
                          elevation: 0,
                          imageFit: BoxFit.fill,
                          radius: 50,
                        ),
                      ),
                      SizedBox(height: 6.h,),
                      // Claire
                      Text(
                          onAdmiresModel[i].title,
                          style:  TextStyle(
                              color:   Color(0xff273433),
                              fontWeight: FontWeight.w700,
                              fontFamily: "NeueHelvetica",
                              fontStyle:  FontStyle.normal,
                              fontSize: 10.sp
                          ),
                          textAlign: TextAlign.center
                      ),
                      SizedBox(height: 2.h,),
                      // Capital One
                      Text(
                          onAdmiresModel[i].subtitle,
                          style:  TextStyle(
                              color:  grey_aaaaaa,
                              fontWeight: FontWeight.w500,
                              fontFamily: "NeueHelvetica",
                              fontStyle:  FontStyle.normal,
                              fontSize: 10.sp
                          ),
                          textAlign: TextAlign.center
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
