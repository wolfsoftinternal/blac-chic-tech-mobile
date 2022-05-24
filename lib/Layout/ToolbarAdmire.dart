import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import 'ToolbarBackOnly.dart';



ToolbarAdmire(BuildContext context,String title){
  return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 16,right: 22),
        child: Container(
          color: Colors.white,
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  width: 48.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.1),
                    //     spreadRadius: 6,
                    //     blurRadius: 10,
                    //     offset: Offset(1, 4), // changes position of shadow
                    //   ),
                    // ],
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(12.0.r),
                    child: SvgPicture.asset(icon_back_black_arrow,width: 24.w,height: 24.w,),
                  ),
                ),
              ),


              SizedBox(width: 1,),

              Text(
                 title,
                  style:  TextStyle(
                      color: black_121212,
                    /*  fontWeight: FontWeight.w700,*//*akib changes*/
                      fontFamily: helvetica_neu_bold,/*akib changes*/
                      fontStyle:  FontStyle.normal,
                      fontSize: 16/*akib changes*/
                  ),
                  textAlign: TextAlign.left
              ),

              // Rearrange
              Text(
                  "Rearrange",
                  style:  TextStyle(
                      color:  orange_ff881a,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Roboto",
                      fontStyle:  FontStyle.normal,
                      fontSize: 16.sp
                  ),
                  textAlign: TextAlign.right
              )
            ],
          ),
        ),
      ),

  );
}