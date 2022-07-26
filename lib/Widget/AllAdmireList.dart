import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/ReplaceWith.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AllAdmireList extends StatefulWidget {
  AdmireList admireList;
  final type;
  final limit;
  final userId;
  AllAdmireList(this.admireList, this.type, this.limit, this.userId);

  @override
  State<AllAdmireList> createState() => _AllAdmireListState();
}

class _AllAdmireListState extends State<AllAdmireList> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            widget.type == 'user' && widget.limit == 'completed' ?
            PopupMenuButton(
              tooltip: '',
                    child: SizedBox(
                      child: Center(
                        child: CircularProfileAvatar(
                          '',
                          radius: 32,
                          child: widget.admireList.admireDetails!.image ==
                                  null
                              ? SvgPicture.asset(
                                  placeholder,
                                  height: 64.h,
                                  width: 64.w,
                                  fit: BoxFit.cover,
                                )
                              : CachedNetworkImage(
                                  imageUrl: widget.admireList
                                      .admireDetails!.image!,
                                  height: 64.h,
                                  width: 62.w,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder: (context,
                                          url, downloadProgress) =>
                                      SvgPicture.asset(
                                    placeholder,
                                    height: 64.h,
                                    width: 64.w,
                                    fit: BoxFit.cover,
                                  ),
                                  errorWidget:
                                      (context, url, error) =>
                                          SvgPicture.asset(
                                    placeholder,
                                    height: 64.h,
                                    width: 64.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    onSelected: (i) {
                      if (i == 1) {
                        checkNet(context).then((value){
                          controller.replaceAdmireAPI(context, widget.admireList.admireId, controller.details.value.id);
                        }).then((value) {
                          setState(() {
                            // controller.widget.admireListAPI(context, null);
                            controller.admire.value = 'Admired';
                            Get.back();
                          });
                        });
                      } 
                    },
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            height: 35,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Replace with ${controller.details.value.firstName}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: roboto_medium,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp),
                                ),
                                Icon(
                                  Icons.repeat,
                                  color: blue_0a84ff,
                                  size: 15,
                                )
                              ],
                            ),
                            value: 1,
                          ),
                        ])
            : widget.type == 'user'
                ? PopupMenuButton(
                    position: PopupMenuPosition.under,
                    tooltip: '',
                    child: SizedBox(
                      child: Center(
                        child: CircularProfileAvatar(
                          '',
                          radius: 32,
                          child: widget.admireList.admireDetails!.image ==
                                  null
                              ? SvgPicture.asset(
                                  placeholder,
                                  height: 64.h,
                                  width: 64.w,
                                  fit: BoxFit.cover,
                                )
                              : CachedNetworkImage(
                                  imageUrl: widget.admireList
                                      .admireDetails!.image!,
                                  height: 64.h,
                                  width: 62.w,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder: (context,
                                          url, downloadProgress) =>
                                      SvgPicture.asset(
                                    placeholder,
                                    height: 64.h,
                                    width: 64.w,
                                    fit: BoxFit.cover,
                                  ),
                                  errorWidget:
                                      (context, url, error) =>
                                          SvgPicture.asset(
                                    placeholder,
                                    height: 64.h,
                                    width: 64.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    onSelected: (i) {
                      if (i == 1) {
                        if (widget.userId == widget.admireList.admireDetails!.id) {
                          controller.userProfileAPI(context, true);
                        } else {
                          controller.admireProfileAPI(
                              context, widget.admireList.admireDetails!.id);
                        }
                      } else if (i == 2) {
                        Get.to(ReplaceWith(
                          name: widget.admireList.admireDetails!.firstName,
                          id: widget.admireList.admireId,
                          isFrom: 'user',
                        ));
                      } else if (i == 3) {
                        setState(() {
                          Widget cancelButton = TextButton(
                            child: const Text("Yes"),
                            onPressed: () {
                              setState(() {
                                checkNet(context).then((value) {
                                  controller.admireDeleteAPI(
                                      context, widget.admireList.admireId);
                                });
                                Get.back();
                              });
                            },
                          );
                          Widget continueButton = TextButton(
                            child: const Text("No"),
                            onPressed: () {
                              setState(() {
                                Get.back();
                              });
                            },
                          );

                          AlertDialog alert = AlertDialog(
                            content: const Text(
                                "Are you sure you want to delete this admire?"),
                            actions: [
                              cancelButton,
                              continueButton,
                            ],
                          );

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        });
                      }
                    },
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            height: 35,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "View Profile",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: roboto_medium,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp),
                                ),
                                Icon(
                                  Icons.person,
                                  color: orange,
                                  size: 15,
                                )
                              ],
                            ),
                            value: 1,
                          ),
                          PopupMenuItem(
                            height: 35,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Replace with...",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: roboto_medium,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp),
                                ),
                                Icon(
                                  Icons.repeat,
                                  color: blue_0a84ff,
                                  size: 15,
                                )
                              ],
                            ),
                            value: 2,
                          ),
                          PopupMenuItem(
                            height: 35,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Remove ${widget.admireList.admireDetails!.firstName.toString().capitalizeFirst ?? ""}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: roboto_medium,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp),
                                ),
                                const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 15,
                                )
                              ],
                            ),
                            value: 3,
                          ),
                        ])
                : SizedBox(
                    child: CircularProfileAvatar(
                          '',
                          radius: 32,
                      child: widget.admireList.admireDetails!.image == null
                          ? SvgPicture.asset(
                              placeholder,
                              height: 64.h,
                              width: 64.w,
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  widget.admireList.admireDetails!.image!,
                              height: 64.h,
                              width: 62.w,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      SvgPicture.asset(
                                placeholder,
                                height: 64.h,
                                width: 64.w,
                              ),
                              errorWidget: (context, url, error) =>
                                  SvgPicture.asset(
                                placeholder,
                                height: 64.h,
                                width: 64.w,
                              ),
                            ),
                    ),
                  ),
            controller.isRearrange.value == true
                ? Positioned(
                    right: 0,
                    top: 1,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Widget cancelButton = TextButton(
                            child: const Text("Yes"),
                            onPressed: () {
                              setState(() {
                                checkNet(context).then((value) {
                                  controller.admireDeleteAPI(
                                      context, widget.admireList.admireId);
                                });
                                Get.back();
                              });
                            },
                          );
                          Widget continueButton = TextButton(
                            child: const Text("No"),
                            onPressed: () {
                              setState(() {
                                Get.back();
                              });
                            },
                          );

                          AlertDialog alert = AlertDialog(
                            content: const Text(
                                "Are you sure you want to delete this admire?"),
                            actions: [
                              cancelButton,
                              continueButton,
                            ],
                          );

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            },
                          );
                        });
                      },
                      child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                            color: grey_aaaaaa,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: white_ffffff,
                            size: 12,
                          )),
                    ),
                  )
                : Container()
          ],
        ),
        SizedBox(
          height: 6.h,
        ),
        setHelceticaBold(
            widget.admireList.admireDetails!.firstName.toString().capitalizeFirst ?? "",
            12.sp,
            black_121212,
            FontWeight.w500,
            FontStyle.normal,
            -0.1),
        SizedBox(
          height: 2.h,
        ),
        setHelveticaMedium(
            widget.admireList.admireDetails!.currentJobs != null
                ? widget.admireList.admireDetails!.currentJobs!.companyName.toString().capitalizeFirst ?? ""
                : "",
            12.sp,
            grey_aaaaaa,
            FontWeight.w500,
            FontStyle.normal,
            -0.1),
      ],
    );
  }
}