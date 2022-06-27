import 'dart:io';

import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_height.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddComapny extends StatefulWidget {
  const AddComapny({Key? key}) : super(key: key);

  @override
  State<AddComapny> createState() => _AddComapnyState();
}

class _AddComapnyState extends State<AddComapny> {
  StepsController controller = Get.put(StepsController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
          type: MaterialType.transparency,
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: white_ffffff,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    //height: 198,
                    child: Wrap(children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, bottom: 24.0),
                              child: Row(
                                children: [
                                  Icon(Icons.close, color: white,),
                                  const Spacer(),
                                  const Center(
                                    child: Text(
                                      "Add Company",
                                      style: TextStyle(
                                          fontFamily: helvetica_neu_bold,
                                          color: black_121212,
                                          fontSize: 18),
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Icon(Icons.close)),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              height: 1,
                            ),
                            const SizedBox(
                              height: 15.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: 110.h,
                                      width: 110.w,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0Xffeaeaea),
                                        ),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(4.r)),
                                      ),
                                      child: imagePath.toString() != "File: ''"
                                          ? InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectPhoto();
                                                });
                                              },
                                              child: Image.file(
                                                imagePath,
                                                fit: BoxFit.fill,
                                                height: 110.h,
                                                width: 110.w,
                                              ),
                                            )
                                          : InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectPhoto();
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                    plus,
                                                    width: 13,
                                                    height: 13,
                                                  ),
                                                  SizedBox(width: 4.w,),
                                                  Text(
                                                    "Company Logo",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            helveticaNeueNeue_medium,
                                                        color: black_121212,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              )),
                                    ),
                                    imagePath.toString() != "File: ''"
                                        ? Positioned(
                                          top: 5,
                                          right: 5,
                                          child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                imagePath = File("");
                                              });
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              size: 15,
                                            ),
                                          )
                                        )
                                        : Container(),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.w, right: 24.w),
                              child: Container(
                                height: 48.h,
                                decoration: EditTextDecoration,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 16.w,
                                    right: 16.w,
                                  ),
                                  child: TextField(
                                    controller: controller
                                        .currentCompanyNameController.value,
                                    cursorColor: black_121212,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: helveticaNeueNeue_medium
                                      ),
                                    decoration: InputDecoration(
                                      hintText: "Company Name",
                                      hintStyle: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: helveticaNeueNeue_medium
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                              child: BlackNextButton('Save', black_121212, () {
                                if (controller
                                    .checkAddCompanyValidation(context)) {
                                  checkNet(context).then((value) {
                                    controller.companyName.value = controller
                                        .currentCompanyNameController.value.text;
                                    controller.createCompanyAPI(
                                        context, imagePath.path.toString());
                                  });
                                }
                              }),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )))),
    );
  }

  selectPhoto() {
    showImagePicker(context).then((value) {
      setState(() {
        if (imagePath.toString() != "File: ''") {
          controller.boolComapnyLogo.value = true;
        }
      });
    });
  }
}
