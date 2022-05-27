// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Layout/ToolbarCreatePost.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/controller/PostController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/AddLocationView.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/EditTextDecorationBorder.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ReplaceWith extends StatefulWidget {
  final name;
  final id;
  final isFrom;
  const ReplaceWith({Key? key, this.name, this.id, this.isFrom}) : super(key: key);

  @override
  _ReplaceWithState createState() => _ReplaceWithState();
}

class _ReplaceWithState extends State<ReplaceWith> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Column(
          children: [
            SizedBox(
              height: 60,
            ),
            ToolbarWithHeaderCenterTitle(
                'REPLACE ${widget.name.toString().toUpperCase()} WITH'),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, top: 24.0, right: 24.0),
              child: SearchBarTag(
                placeholder: "Search people",
                onSubmit: (value) {
                  checkNet(context).then((value) {
                    videoController.userListAPI(
                        context, controller.searchController.value.text);
                  });
                  print(videoController);
                  for (var item in videoController.userList) {
                    if (controller.selectedList.contains(item)) {
                      controller.searchList.clear();
                      controller.searchList.add(item);
                    }
                  }
                },
                controller: controller.searchController.value,
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 24.0, bottom: 24.0, right: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 24.h,
                          ),
                          ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            itemCount: videoController.userList.length,
                            itemBuilder: (context, i) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  controller.selectedList.clear();
                                  controller.selectedList
                                      .add(videoController.userList[i]);
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: Container(
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child:
                                            videoController.userList[i].image ==
                                                    null
                                                ? SvgPicture.asset(
                                                    placeholder,
                                                    height: 44.h,
                                                    width: 44.w,
                                                    fit: BoxFit.cover,
                                                  )
                                                : CachedNetworkImage(
                                                    imageUrl: videoController
                                                        .userList[i].image!,
                                                    height: 44.h,
                                                    width: 44.w,
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            SvgPicture.asset(
                                                      placeholder,
                                                      height: 44.h,
                                                      width: 44.w,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            SvgPicture.asset(
                                                      placeholder,
                                                      height: 44.h,
                                                      width: 44.w,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                      ),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // claireroman
                                            Text(
                                                videoController.userList[i]
                                                            .userName !=
                                                        null
                                                    ? videoController
                                                        .userList[i].userName!
                                                    : "",
                                                style: TextStyle(
                                                    color: grey_aaaaaa,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            // Claire Roman
                                            Text(
                                                videoController.userList[i]
                                                            .firstName !=
                                                        null
                                                    ? videoController
                                                            .userList[i]
                                                            .firstName!
                                                            .capitalizeFirst! +
                                                        " " +
                                                        videoController
                                                            .userList[i]
                                                            .lastName!
                                                            .capitalizeFirst!
                                                    : "",
                                                style:
                                                    TextStyle(
                                                        color: black_121212,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily:
                                                            helveticaNeueNeue_medium,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 14.sp),
                                                textAlign: TextAlign.left)
                                          ],
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        controller.selectedList.contains(videoController.userList[i])
                                            ? orange_tick_icon
                                            : icon_next_arrow,
                                        width: 25.w,
                                        height: 25.h,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: BlackButton('Replace', white_ffffff, () {
                if(controller.selectedList.isEmpty){
                  snackBar(context, 'Select replacement');
                }
                checkNet(context).then((value) {
                  if(widget.isFrom == 'user'){
                    controller.replaceAdmireAPI(context, widget.id, controller.selectedList[0].id, null);
                  }else{
                    dynamic body = {'user_id': controller.details.value.id.toString()};
                    controller.replaceAdmireAPI(context, widget.id, controller.selectedList[0].id, body);
                  }
                });
              }),
            )
          ],
        ),
      ),
    );
  }
}
