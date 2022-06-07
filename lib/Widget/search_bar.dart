import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class SearchBarTag extends StatelessWidget {
  const SearchBarTag(
      {Key? key, required this.placeholder, this.onSubmit, this.controller, this.autoFocus})
      : super(key: key);
  final Function(String)? onSubmit;
  final TextEditingController? controller;
  final String placeholder;
  final autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autoFocus,
      decoration: InputDecoration(
        filled: true,
        hintText: placeholder,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        suffixIcon: Icon(
          IconlyLight.search,
          color: black_121212,
          size: 20.r,
        ),
        fillColor: const Color(0xfff5f5f5),
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
      onChanged: onSubmit,
    );
  }
}
