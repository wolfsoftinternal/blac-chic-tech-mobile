import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToolbarWithHeaderCenterTitle extends StatelessWidget {
  String? title;

  ToolbarWithHeaderCenterTitle(_title, {Key? key}) : super(key: key) {
    title = _title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackLayout(),
          const Spacer(),
          Text(title!,
              style: TextStyle(
                  color: black_121212,
                  fontWeight: FontWeight.w900,
                  fontFamily: helvetica_neu_bold,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1.2,
                  fontSize: 16.sp),
              textAlign: TextAlign.center),
          const Spacer(),
          const SizedBox(
            height: 46,
            width: 46,
          )
        ],
      ),
    );
  }
}
