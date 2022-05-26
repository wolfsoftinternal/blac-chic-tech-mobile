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


class DetailTab extends StatefulWidget {
  const DetailTab({Key? key}) : super(key: key);

  @override
  _DetailTabState createState() => _DetailTabState();
}

class _DetailTabState extends State<DetailTab> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0x80f2f2f2),
          body: Padding(
            padding:  EdgeInsets.only(left: 16.w,right: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h,),
                // Black Chic Tech | December 2021
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              style: const TextStyle(
                                  color:  const Color(0xff3f3f3f),
                                  fontWeight: FontWeight.w700,
                                  fontFamily: "NeueHelvetica",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 12.0
                              ),
                              text: "Black Chic Tech "),
                          TextSpan(
                              style: const TextStyle(
                                  color:  const Color(0xff3f3f3f),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NeueHelvetica",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 12.0
                              ),
                              text: " |"),
                          TextSpan(
                              style: const TextStyle(
                                  color:  const Color(0xffaaaaaa),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NeueHelvetica",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 12.0
                              ),
                              text: "| December 2021")
                        ]
                    )
                ),

                SizedBox(height: 16.h,),


                // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum ut morbi nulla nisl montes, id pe
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Elementum ut morbi nulla nisl montes, id pellentesque. Arcu quis elit neque ac tincidunt id felis. Scelerisque nisi, nunc sodales egestas morbi tortor sed orci. Dui tortor, arcu, pulvinar in nulla sed pellentesque elementum. Amet nulla amet elit eget arcu. Ultrices hac maecenas euismod quam. Purus suscipit adipiscing mauris morbi. ",
                    style: const TextStyle(
                        color:  const Color(0xff3f3f3f),
                        fontWeight: FontWeight.w500,
                        fontFamily: "NeueHelvetica",
                        fontStyle:  FontStyle.normal,
                        fontSize: 12.0
                    ),
                    textAlign: TextAlign.left
                )

              ],
            ),
          ),
        ));
  }
}
