import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ToolbarWithHeaderAction extends StatelessWidget {
  String? title;
  var actionIcon;
  VoidCallback? onCustomButtonPressed;

  ToolbarWithHeaderAction(_title, _actionIcon,
      VoidCallback _onCustomButtonPressed, {Key? key}) : super(key: key) {
    title = _title;
    actionIcon = _actionIcon;
    onCustomButtonPressed = _onCustomButtonPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackLayout(),
          Text(title!,
              style: TextStyle(
                  color: black_121212,
                  fontWeight: FontWeight.w500,
                  fontFamily: helvetica_neu_bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 16.sp),
              textAlign: TextAlign.center),
          InkWell(
            onTap: onCustomButtonPressed,
            child: Container(
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 6,
                    blurRadius: 10,
                    offset: Offset(1, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding:  EdgeInsets.all(12.r),
                child: SvgPicture.asset(
                  actionIcon,
                  width: 24.r,
                  height: 24.r,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
