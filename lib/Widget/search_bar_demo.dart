import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

class SearchBarDemo extends StatefulWidget {
  const SearchBarDemo({
    Key? key,
    required this.onChanged(String text),
    this.onTap,
    this.readOnly = false,
    this.autoFoucs = false,
    required this.placeholder,
    required this.fillcolor,
  }) : super(key: key);
  final Function? onChanged;
  final VoidCallback? onTap;
  final String placeholder;
  final Color fillcolor;
  final bool? readOnly;
  final bool? autoFoucs;

  @override
  State<SearchBarDemo> createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: widget.autoFoucs!,
      readOnly: widget.readOnly!,
      onTap: () => widget.onTap!(),
      onChanged: (text) {
        widget.onChanged!(text);
      },
      decoration: InputDecoration(
        filled: true,
        hintText: widget.placeholder,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        prefixIcon: Icon(
          IconlyLight.search,
          color: grey_aaaaaa,
          size: 18.r,
        ),
        fillColor: widget.fillcolor,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          // fontWeight: FontWeight.w500,
          color: grey_aaaaaa,
          fontFamily: helveticaNeueNeue_medium
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
    );
  }
}
