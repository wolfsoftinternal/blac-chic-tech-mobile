import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Utilities/Constant.dart';

class SearchBar extends StatefulWidget {
  String? title;

  SearchBar(_title, {Key? key}) : super(key: key) {
    title = _title;
  }
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return               Container(
      margin: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w),
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 16.w),
      decoration: const BoxDecoration(
        // border: Border.all(color: grey_e9ecec, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: grey_f5f5f5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SvgPicture.asset(
            search,
            color: grey_aaaaaa,
          ),
          SizedBox(width: 16.w,),
          const Expanded(
            child: TextField(
              style: TextStyle(
                  color: black_121212,
                  fontFamily: roboto_medium,
                  fontSize: 14.0),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Search.......",
                hintStyle: TextStyle(
                    color: grey_aaaaaa,
                    fontFamily: roboto_medium,
                    fontSize: 14.0),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ),
          Image.asset(img_close,
            color: black_121212,width: 12.w,height: 12.h,)
        ],
      ),
    );

  }
}
