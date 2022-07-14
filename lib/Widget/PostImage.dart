import 'dart:io';

import 'package:blackchecktech/Screens/Home/CreatePost/controller/PostController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Screens/Home/CreatePost/view/multi_assets_page.dart';

class PostImage extends StatefulWidget {
  final index;
  PostImage({Key? key, this.index}) : super(key: key);

  @override
  State<PostImage> createState() => _PostImageState();
}

class _PostImageState extends State<PostImage> {
  PostController controller = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
              File(controller.assetImages[widget.index].relativePath
                      .toString()
                      .contains(
                          '/storage/emulated/0/')
                  ? (controller.assetImages[widget.index]
                              .relativePath ??
                          "") +
                      "/" +
                      (controller.assetImages[widget.index].title ??
                          "")
                  : '/storage/emulated/0/' +
                      (controller.assetImages[widget.index]
                              .relativePath ??
                          "") +
                      "/" +
                      (controller.assetImages[widget.index].title ??
                          "")),
              width: double.infinity,
              height: 375.h,
              fit: BoxFit.cover,
            ),
            Center(
                          child: Container(
                              height: 375.h,
                              width: double.infinity,
                              child: MultiAssetsPage(375.h))),
      ],
    );
  }
}