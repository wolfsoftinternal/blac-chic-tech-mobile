import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ToolbarWithHeaderTitle extends StatelessWidget {
  String? title;

  ToolbarWithHeaderTitle(_title, {Key? key}) : super(key: key) {
    title = _title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackLayout(),
          Spacer(),
          Text(title!,
              style: TextStyle(
                  color: black_121212,
                  fontWeight: FontWeight.w500,
                  fontFamily: helvetica_neu_bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 16),
              textAlign: TextAlign.center),
              Spacer(),
             Container(height: 46, width: 46,)
        ],
      ),
    );
  }
}
