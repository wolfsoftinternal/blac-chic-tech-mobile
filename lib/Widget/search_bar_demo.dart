import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';


class SearchBarDemo extends StatelessWidget {
  const SearchBarDemo({Key? key, required this.placeholder}) : super(key: key);

  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        hintText: placeholder,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        prefixIcon:  Icon(
          IconlyLight.search,
          color: grey_aaaaaa,
          size: 20.r,
        ),
        fillColor: white_ffffff,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          // fontWeight: FontWeight.w500,
          color: const Color(0xff96A6A3),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),

    );
  }
}
