import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/my_strings.dart';

class SearchBar extends StatefulWidget {

  SearchBar(
      {
      this.controller, this.onSubmit});

  final Function(String)? onSubmit;
  final TextEditingController? controller;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
          borderRadius:  BorderRadius.all(Radius.circular(7.r)),
          border: Border.all(color: grey_aaaaaa, width: 1.w),
          color: white_ffffff),
      child: Row(
        children: [
           SizedBox(
            width: 10.w,
          ),
            SvgPicture.asset(
              search,
              color: black_121212,
              width: 20.r,
              height: 20.r,
            ),
           SizedBox(
            width: 7.7.w,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:  EdgeInsets.all(5.r),
              child: TextField(
                // searchInput,
                controller: widget.controller,
                onSubmitted: widget.onSubmit,
                style:  TextStyle(
                    color: black_121212,
                    fontFamily: helveticaNeueNeue_medium,
                    fontStyle: FontStyle.normal,
                    fontSize: 16.sp),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  hintText: 'Search',
                  hintStyle:  TextStyle(
                      color: grey_aaaaaa,
                      // fontWeight: FontWeight.w500,
                      fontFamily: helveticaNeueNeue_medium,
                      fontSize: 16.sp),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
