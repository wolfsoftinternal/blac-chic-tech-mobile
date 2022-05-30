import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/my_icons.dart';


class BackCircle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.w),
      child:  GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
          width: 48.r,
          height: 48.r,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 6,
                blurRadius: 10,
                offset: const Offset(1, 4), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding:  EdgeInsets.all(12.0.r),
            child: SvgPicture.asset(icon_back_black_arrow,width: 24.w,height: 24.w,),
          ),
        ),
      ),
    );
  }
}
