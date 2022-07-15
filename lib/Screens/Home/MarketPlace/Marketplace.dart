import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Marketplace extends StatefulWidget {
  Marketplace({Key? key}) : super(key: key);

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Column(
        children: [
          SizedBox(height: 60.h,),
          ToolbarWithHeaderCenterTitle("NFT MARKETPLACE"),
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Container(
            child: SvgPicture.asset(nft),
          ),
          setHelveticaMedium('COMING SOON', 14.sp, grey_aaaaaa, FontWeight.w500, FontStyle.normal)
        ],
      ),
    );
  }
}