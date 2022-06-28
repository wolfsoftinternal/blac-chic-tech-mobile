// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ReplaceWith extends StatefulWidget {
  final name;
  final id;
  final isFrom;
  const ReplaceWith({Key? key, this.name, this.id, this.isFrom})
      : super(key: key);

  @override
  _ReplaceWithState createState() => _ReplaceWithState();
}

class _ReplaceWithState extends State<ReplaceWith> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  // VideoController videoController = Get.put(VideoController());

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
                    controller.replaceUserList(
                        context, controller.searchController.value.text);
                  });
                  for (var item in controller.userList) {
                    if (controller.selectedList.contains(item)) {
                      controller.searchList.clear();
                      controller.searchList.add(item);
                    }
                  }
                },
                autoFocus: false,
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
                            itemCount: controller.userList.length,
                            itemBuilder: (context, i) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  controller.selectedList.clear();
                                  controller.selectedList
                                      .add(controller.userList[i]);
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
                                      CircularProfileAvatar(
                                        '',
                                        radius: 22,
                                        child:
                                            controller.userList[i].image == null
                                                ? SvgPicture.asset(
                                                    placeholder,
                                                    height: 44.h,
                                                    width: 44.w,
                                                    fit: BoxFit.cover,
                                                  )
                                                : CachedNetworkImage(
                                                    imageUrl: controller
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
                                                controller.userList[i]
                                                            .userName !=
                                                        null
                                                    ? controller
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
                                                controller.userList[i]
                                                            .firstName !=
                                                        null
                                                    ? controller
                                                            .userList[i]
                                                            .firstName!
                                                            .capitalizeFirst! +
                                                        " " +
                                                        controller
                                                            .userList[i]
                                                            .lastName!
                                                            .capitalizeFirst!
                                                    : "",
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 14.sp),
                                                textAlign: TextAlign.left)
                                          ],
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        controller.selectedList.contains(
                                                controller.userList[i])
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
              child: controller.selectedList.isEmpty
                  ? Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: const Color(0x17747796).withOpacity(0.07),
                          spreadRadius: 10,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 10), // changes position of shadow
                        ),
                      ]),
                      child: SizedBox(
                        width: double.infinity,
                        //height: HeightData.fiftyfive,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: grey_aaaaaa),
                          child: ElevatedButton(
                              child: //
                                  Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Replace',
                                        style: TextStyle(
                                            fontFamily: helvetica_neu_bold,
                                            fontSize: 16.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              ), // Button
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onSurface: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: const BorderSide(
                                      color: grey_aaaaaa, width: 0),
                                ),
                              )),
                        ),
                      ),
                    )
                  : BlackButton('Replace', white_ffffff, () {
                      if (controller.selectedList.isEmpty) {
                        snackBar(context, 'Select replacement');
                      }
                      checkNet(context).then((value) async {
                        if (widget.isFrom == 'user') {
                          await controller.replaceAdmireAPI(context, widget.id,
                              controller.selectedList[0].id, null);
                          controller.admireListAPI(context, null);
                          Get.back();
                        } else {
                          dynamic body = {
                            'user_id': controller.details.value.id.toString()
                          };
                          await controller.replaceAdmireAPI(context, widget.id,
                              controller.selectedList[0].id, body);
                          controller.admireListAPI(
                              context, controller.details.value.id.toString());
                          Get.back();
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
