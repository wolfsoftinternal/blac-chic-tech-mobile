import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import 'ToolbarBackOnly.dart';



ToolbarCreatPost(BuildContext context,String title,String subtitle){
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
              // IconButton(
              //     icon: Icon(
              //       Icons.arrow_back,
              //       size: 30,
              //       color: Colors.black,
              //     ),
              //     onPressed: () {
              //       Navigator.pop(context);
              //     }),

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

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: orange_ff881a
                ),
                child: // Back btn
// POST
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
                  child: Text(
                      subtitle,
                      style: const TextStyle(
                          color:  const Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                          fontFamily: helveticaNeueNeue_medium,
                          fontStyle:  FontStyle.normal,
                          fontSize: 12.0
                      ),
                      textAlign: TextAlign.left
                  ),
                ),
              )
            ],
          ),
        ),
      ),

  );
}