import 'dart:io';

import 'package:blackchecktech/Layout/ToolbarWithHeaderAction.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AddCompany.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:blackchecktech/Widget/SearchBar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompanyList extends StatefulWidget {
  final isFrom;
  const CompanyList({Key? key, this.isFrom}) : super(key: key);

  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  StepsController controller = Get.put(StepsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initScrolling(context);
    dynamic body = {'page': controller.pageNumber.toString()};
    checkNet(context)
        .then((value) => controller.companyListAPI(context, body))
        .then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 24.0.r),
              child: ToolbarWithHeaderCenterTitle(
                'Select Your Company',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 40.h, bottom: 8.h),
              child: Container(
                height: 48.h,
                decoration: EditTextDecoration,
                child: Row(
                  children: [
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(4.r),
                        child: TextField(
                          // searchInput,
                          controller: controller.searchCompanyController.value,
                          onChanged: (value) {
                            controller.pageNumber.value = 1;
                            var body = {
                              'search':
                                  controller.searchCompanyController.value.text,
                              'page': controller.pageNumber.toString(),
                            };
                            controller.companyListAPI(context, body);
                          },
                          style: TextStyle(
                              color: black_121212,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp),
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                color: grey_aaaaaa,
                                // fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontSize: 14.sp),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      search,
                      color: black_121212,
                      width: 15.r,
                      height: 15.r,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 8.h, bottom: 16.h, left: 24.w, right: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          setHelveticaRegular(
                              '${controller.companyCount} Companies',
                              14.sp,
                              grey_aaaaaa,
                              FontWeight.w500,
                              FontStyle.normal),
                          InkWell(
                            onTap: () {
                              setState(() {
                                imagePath = File("");
                                controller.currentCompanyNameController.value
                                    .text = "";
                                showGeneralDialog(
                                    context: context,
                                    pageBuilder: (BuildContext buildContext,
                                        Animation animation,
                                        Animation secondaryAnimation) {
                                      return const AddComapny();
                                    });
                              });
                            },
                            child: setHelveticaMedium(
                                '+ ADD',
                                14.sp,
                                orange_ff881a,
                                FontWeight.w500,
                                FontStyle.normal),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        itemCount: controller.companyList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 24.w, right: 24.w, bottom: 20.h),
                            child: InkWell(
                              onTap: () {
                                print("widget.isFrom :: " +
                                    widget.isFrom.toString());
                                if (widget.isFrom == 'past_job') {
                                  print(
                                      ("LOGO  :: " + widget.isFrom.toString()));
                                  controller.pastJobName.value =
                                      controller.companyList[index]['name'];
                                  controller.pastJobImage.value =
                                      controller.companyList[index]['logo'];
                                  controller.pastJobId.value =
                                      controller.companyList[index]['id'];
                                } else if (widget.isFrom ==
                                    'experience_pastjob') {
                                  print(
                                      ("LOGO  :: " + widget.isFrom.toString()));
                                  controller.pastJobController.value =
                                      controller.companyList[index]['name'];
                                  controller.pastJobImage.value =
                                      controller.companyList[index]['logo'];
                                  controller.pastJobId.value =
                                      controller.companyList[index]['id'];
                                } else {
                                  controller.companyName.value =
                                      controller.companyList[index]['name'];
                                  controller.companyImage.value =
                                      controller.companyList[index]['logo'];
                                  controller.companyImageId.value =
                                      controller.companyList[index]['id'];
                                }
                                Get.back();
                              },
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(3.r),
                                    child: CachedNetworkImage(
                                      imageUrl: controller.companyList[index]
                                          ['logo'],
                                      height: 40.r,
                                      width: 40.r,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              SvgPicture.asset(
                                        placeholder,
                                        height: 40.r,
                                        width: 40.r,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          SvgPicture.asset(
                                        placeholder,
                                        height: 40.r,
                                        width: 40.r,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    controller.companyList[index]['name'],
                                    style: TextStyle(
                                        fontFamily: helvetica_neu_bold,
                                        color: black_121212,
                                        fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
            if (controller.isPaginationLoading.value == true)
              PaginationUtils().loader(),
          ],
        ),
      ),
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
