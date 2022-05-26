import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';

import 'ToolbarBackOnly.dart';

ToolbarCreatPost(BuildContext context, String title, String subtitle) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: Padding(
      padding: const EdgeInsets.only(right: 22),
      child: Container(
        color: Colors.white,
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Text(title,
                style: TextStyle(
                    color: black_121212,
                    /*  fontWeight: FontWeight.w700,*/ /*akib changes*/
                    fontFamily: helvetica_neu_bold,
                    /*akib changes*/
                    fontStyle: FontStyle.normal,
                    fontSize: 16 /*akib changes*/
                    ),
                textAlign: TextAlign.left),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: orange_ff881a),
              child: // Back btn
// POST
                  Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 8),
                child: Text(subtitle,
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                        fontFamily: helveticaNeueNeue_medium,
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    textAlign: TextAlign.left),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
