import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Utilities/Constant.dart';

class SearchBarWithRightIcon extends StatelessWidget {
  const SearchBarWithRightIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.h, right: 24.w, left: 24.w),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      decoration: BoxDecoration(
        // border: Border.all(color: grey_e9ecec, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: grey_f5f5f5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(
                  color: black_121212,
                  fontFamily: roboto_medium,
                  fontSize: 14.0),
              decoration: new InputDecoration(
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
          SvgPicture.asset(
            search,
            color: black_121212,
          ),
        ],
      ),
    );

  }
}
