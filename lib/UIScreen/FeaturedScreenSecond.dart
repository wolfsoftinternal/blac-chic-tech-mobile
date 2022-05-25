import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';


class FeaturedScreenSecond extends StatefulWidget {
  const FeaturedScreenSecond({Key? key}) : super(key: key);

  @override
  _FeaturedScreenOneState createState() => _FeaturedScreenOneState();
}

class _FeaturedScreenOneState extends State<FeaturedScreenSecond> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      feature_img_1,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),

              // OSA UX OF LIVING
              Center(
                child: Text(
                    "OSA \nUI OF LIVING",
                style: const TextStyle(
                color:  const Color(0xffffffff),
                fontWeight: FontWeight.w900,
                fontFamily: "NeueHelvetica",
                fontStyle:  FontStyle.normal,
                fontSize: 40.0
          ),
            textAlign: TextAlign.center
        ),
              )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
