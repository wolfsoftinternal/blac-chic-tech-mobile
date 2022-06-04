import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Styles/my_colors.dart';
import 'ToolbarBackOnly.dart';

class ToolbarWithTitle extends StatelessWidget {
  String? title;

  ToolbarWithTitle(_title, {Key? key}) : super(key: key) {
    title = _title;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackLayout(),
        // BC-CONNECT
        Padding(
          padding: EdgeInsets.only(top: 14.h),
          child: Center(
            child: Text(title!,
                style: TextStyle(
                    color: black_121212,
                    fontWeight: FontWeight.w900,
                    fontFamily: "NeueHelvetica",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.sp),
                textAlign: TextAlign.right),
          ),
        )
      ],
    );
  }
}
