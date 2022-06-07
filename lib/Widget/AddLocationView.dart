import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddLocationView extends StatelessWidget {
  const AddLocationView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: const Color(0xfff5f5f5),
      ),
      child: Text(title,
          style:  TextStyle(
              color: black_121212,
              fontWeight: FontWeight.w500,
              fontFamily: helveticaNeueNeue_medium,
              fontStyle: FontStyle.normal,
              fontSize: 12.sp),
          textAlign: TextAlign.left),
    );
  }
}
