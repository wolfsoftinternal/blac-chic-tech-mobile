import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/BottomNavigation.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Feed extends StatefulWidget {
  Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 60.h,),
                ToolbarWithHeaderCenterTitle("FEED"),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Container(
                  child: SvgPicture.asset(feed),
                ),
                setHelveticaMedium('COMING SOON', 14.sp, grey_aaaaaa, FontWeight.w500, FontStyle.normal)
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigation(
              selectedIndex: 1,
            ),
          )
        ],
      ),
    );
  }
}