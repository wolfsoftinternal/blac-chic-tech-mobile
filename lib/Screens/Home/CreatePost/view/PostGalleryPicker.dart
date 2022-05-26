// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/view/multi_assets_page.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/picker_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostGalleryPicker extends StatefulWidget {
  const PostGalleryPicker({Key? key}) : super(key: key);

  @override
  _PostGalleryPickerState createState() => _PostGalleryPickerState();
}

class _PostGalleryPickerState extends State<PostGalleryPicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.close,
                      size: 24,
                    ),
                  ),
                  Spacer(),
                  Text('ALL PHOTOS',
                      style: TextStyle(
                          color: black_121212,
                          fontFamily: helvetica_neu_bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 16),
                      textAlign: TextAlign.left),
                  Stack(children: [
                    Positioned(top: 4, child: Icon(Icons.expand_more_rounded)),
                    Container(height: 30, width: 30, child: MultiAssetsPage()),
                  ]),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: orange_ff881a),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 8),
                      child: Text('NEXT',
                          style: const TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w900,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  // image!.isEmpty?
                  Image.asset(
                    img_girl,
                    height: 375.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                  // : Image.asset(
                  //     "${image![0].relativePath}${image![0].title}",
                  //     height: 375.h,
                  //     width: double.infinity,
                  //     fit: BoxFit.cover,
                  //   ),
                  // GridView.builder(
                  //     primary: false,
                  //     shrinkWrap: true,
                  //     padding: EdgeInsets.all(0),
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 3,
                  //       childAspectRatio: 0.86,
                  //       mainAxisSpacing: 10.0,
                  //       crossAxisSpacing: 12.0,
                  //     ),
                  //     itemCount: 1,
                  //     itemBuilder: (context, index) {
                  //       return MultiAssetsPage();
                  //     })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
