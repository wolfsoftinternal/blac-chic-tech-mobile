import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

displayBottomSheet(context) {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 50,
                                height: 3,
                                decoration: BoxDecoration(
                                    color: grey_3f3f3f.withOpacity(0.4),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    )),
                              )),
                          const SizedBox(
                            height: 25,
                          ),
                          setHelceticaBold(
                              "Report this profile",
                              16,
                              black_121212,
                              FontWeight.w500,
                              FontStyle.normal,
                              1.6),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  controller.selectedIndex.value = 1;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                      height: 20.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3.r)),
                                          border: Border.all(
                                              color: controller.selectedIndex
                                                          .value ==
                                                      1
                                                  ? orange_ff881a
                                                  : const Color(0xffdbdbdb),
                                              width: 1),
                                          color:
                                              controller.selectedIndex.value ==
                                                      1
                                                  ? orange_ff881a
                                                  : const Color(0xffffffff)),
                                      child: controller.selectedIndex.value == 1
                                          ? Icon(
                                              Icons.check,
                                              size: 18.0.r,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.check,
                                              size: 18.0.r,
                                              color: Colors.white,
                                            )),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  setHelceticaBold("Posts", 16, black_121212,
                                      FontWeight.w500, FontStyle.normal, -0.32),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  controller.selectedIndex.value = 2;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                      height: 20.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3.r)),
                                          border: Border.all(
                                              color: controller.selectedIndex
                                                          .value ==
                                                      2
                                                  ? orange_ff881a
                                                  : const Color(0xffdbdbdb),
                                              width: 1),
                                          color:
                                              controller.selectedIndex.value ==
                                                      2
                                                  ? orange_ff881a
                                                  : const Color(0xffffffff)),
                                      child: controller.selectedIndex.value == 2
                                          ? Icon(
                                              Icons.check,
                                              size: 18.0.r,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.check,
                                              size: 18.0.r,
                                              color: Colors.white,
                                            )),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  setHelceticaBold("Videos", 16, black_121212,
                                      FontWeight.w500, FontStyle.normal, -0.32),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 40.0, bottom: 10.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  controller.selectedIndex.value = 3;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                      height: 20.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(3.r)),
                                          border: Border.all(
                                              color: controller.selectedIndex
                                                          .value ==
                                                      3
                                                  ? orange_ff881a
                                                  : const Color(0xffdbdbdb),
                                              width: 1),
                                          color:
                                              controller.selectedIndex.value ==
                                                      3
                                                  ? orange_ff881a
                                                  : const Color(0xffffffff)),
                                      child: controller.selectedIndex.value == 3
                                          ? Icon(
                                              Icons.check,
                                              size: 18.0.r,
                                              color: Colors.white,
                                            )
                                          : Icon(
                                              Icons.check,
                                              size: 18.0.r,
                                              color: Colors.white,
                                            )),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  setHelceticaBold("Events", 16, black_121212,
                                      FontWeight.w500, FontStyle.normal, -0.32),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          BlackButton('Report', white_ffffff, () {}),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ));
      });
}
