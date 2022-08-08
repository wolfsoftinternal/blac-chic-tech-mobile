import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadVideos extends StatefulWidget {
  const UploadVideos({Key? key}) : super(key: key);

  @override
  _UploadVideosState createState() => _UploadVideosState();
}

class _UploadVideosState extends State<UploadVideos> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: ToolbarLocation(
          context, "UPLOAD VIDEO", "assets/images/location_icon.png"),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 24.w, right: 24.w, top: 40.h, bottom: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // UPLOAD VIDEO
                    Text("UPLOAD VIDEO",
                        style: TextStyle(
                            color: grey_aaaaaa,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp),
                        textAlign: TextAlign.left),

                    SizedBox(
                      height: 25.h,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: const Color(0xfff5f5f5),
                        border: Border.all(
                            width: 1, color: const Color(0x66f5f5f5)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 56.h, bottom: 56.h, left: 40.w, right: 40.w),
                        child: Column(
                          children: [
                            SvgPicture.asset(upload_video_icon,
                                width: 52.w, height: 52.h),
                            SizedBox(
                              height: 16.h,
                            ),
                            // Upload Video
                            Text("Upload Video",
                                style: TextStyle(
                                    color: const Color(0xff273433),
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "NeueHelvetica",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp),
                                textAlign: TextAlign.center),
                            SizedBox(
                              height: 8.sp,
                            ),
                            // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae facilisis sit nunc lorem. Morbi orci,
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae facilisis sit nunc lorem. Morbi orci, risus,",
                                style: TextStyle(
                                    color: const Color(0xff96a6a3),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.sp,
                                    height: 1.5),
                                textAlign: TextAlign.center)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlackButton("Next", Colors.white, () {}),
          )
        ],
      ),
    ));
  }
}
