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

class PostLocation extends StatefulWidget {
  const PostLocation({Key? key}) : super(key: key);

  @override
  _PostLocationState createState() => _PostLocationState();
}

class _PostLocationState extends State<PostLocation> {
  List<TagPeopleModel> onTagPeopleModel = [
    TagPeopleModel("Central Park", "Jakarta, Indonesia"),
    TagPeopleModel("Neo Soho", "Semarang Indonesia"),
    TagPeopleModel("Central Park", "Jakarta, Indonesia"),
    TagPeopleModel("Neo Soho", "Semarang Indonesia"),
    TagPeopleModel("Central Park", "Jakarta, Indonesia"),
    TagPeopleModel("Neo Soho", "Semarang Indonesia"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.r,
            ),
            ToolbarLocation(
                context, "LOCATIONS", "assets/images/location_icon.png"),
            Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 5.h, bottom: 24.h),
              child: SearchBarTag(placeholder: "Search locations"),
            ),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 5.h, bottom: 24.h),
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                padding: EdgeInsets.all(0),
                itemCount: onTagPeopleModel.length,
                itemBuilder: (context, i) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Central Park
                    Text(onTagPeopleModel[i].image,
                        style: TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w700,
                            fontFamily: "NeueHelvetica",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp),
                        textAlign: TextAlign.left),
                    // Jakarta, Indonesia
                    Text(onTagPeopleModel[i].title,
                        style: TextStyle(
                            color: grey_aaaaaa,
                            fontWeight: FontWeight.w500,
                            fontFamily: "NeueHelvetica",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 16.h,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
