import 'dart:io';

import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderAction.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AddCompany.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/ExperienceInfoFormView.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_height.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/SearchBar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({Key? key}) : super(key: key);

  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  StepsController controller = Get.put(StepsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkNet(context).then((value) => controller.companyListAPI(context, null));
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
              padding:  EdgeInsets.only(right: 24.0.r),
              child: ToolbarWithHeaderAction(
                'Select Your Company',
                plus,
                () {
                  setState(() {
                    imagePath = File("");
                    controller.currentCompanyNameController.value.text = "";
                    showGeneralDialog(
                      context: context,
                      pageBuilder: (BuildContext buildContext,
                          Animation animation, Animation secondaryAnimation) {
                        return AddComapny();
                      });
                  });
                  
                },
              ),
            ),
            Padding(
              padding:
                   EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
              child: SearchBar(
                controller: controller.searchCompanyController.value,
                onSubmit: (v) {
                  var body = {
                    'search': controller.searchCompanyController.value.text,
                  };
                  controller.companyListAPI(context, body);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: controller.companyList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.only(left: 24.w, right: 24.w, bottom: 24.h),
                      child: InkWell(
                        onTap: () {
                          controller.companyName.value =
                              controller.companyList[index]['name'];
                          Get.back();
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(3.r),
                              child: CachedNetworkImage(
                                imageUrl: controller.companyList[index]['logo'],
                                height: 50.r, width: 50.r,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                        SvgPicture.asset(placeholder, height: 50.r, width: 50.r,),
                                errorWidget: (context, url, error) => SvgPicture.asset(placeholder, height: 50.r, width: 50.r,),
                              ),
                            ),
                             SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              controller.companyList[index]['name'],
                              style:  TextStyle(
                                  fontFamily: helveticaNeueNeue_medium,
                                  color: black_121212,
                                  fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
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
