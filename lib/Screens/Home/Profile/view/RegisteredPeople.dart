import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisteredPeople extends StatefulWidget {
  final id;
  const RegisteredPeople({Key? key, this.id}) : super(key: key);

  @override
  _RegisteredPeopleState createState() => _RegisteredPeopleState();
}

class _RegisteredPeopleState extends State<RegisteredPeople> {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  @override
  void initState() {
    super.initState();
    controller.initRegisterScrolling(context, widget.id);
    checkNet(context).then((value) {
      controller.registeredUserApi(context, widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            ToolbarWithHeaderCenterTitle("REGISTERED PEOPLE"),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(right: 24.w, top: 40.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: GridView.builder(
                            primary: false,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.5.h,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 5),
                            itemCount: controller
                                .eventDetails.value.admissionData!.length,
                            itemBuilder: (context, i) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 16.5.w,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            color: const Color(0xfff5f5f5)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  // Bronze
                                                  Text(
                                                      controller
                                                          .eventDetails
                                                          .value
                                                          .admissionData![i]
                                                          .category!,
                                                      style: TextStyle(
                                                          fontFamily: "Roboto",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 16.sp),
                                                      textAlign: TextAlign.left),

                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  //
                                                  Text("",
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xffaaaaaa),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: "Roboto",
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 16.sp),
                                                      textAlign: TextAlign.left)
                                                ],
                                              ),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              // 111 Sold
                                              Text("111 Sold",
                                                  style: TextStyle(
                                                      color:
                                                          const Color(0xff0a84ff),
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: "Roboto",
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16.sp),
                                                  textAlign: TextAlign.left),

                                              //
                                              Text("",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: "Roboto",
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 14.sp),
                                                  textAlign: TextAlign.left)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                      ),

                      SizedBox(
                        height: 16.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: SearchBarTag(placeholder: "Search people", onSubmit: (value){
                          checkNet(context).then((value) {
                            controller.registeredUserApi(context, widget.id);
                          });
                        }, controller: controller.registeredUserSearch.value, autoFocus: false,),
                      ),

                      SizedBox(
                        height: 16.h,
                      ),

                      // 100 Users
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Text(controller.registerList.length.toString() + 'Users',
                            style: TextStyle(
                                color: grey_aaaaaa,
                                fontFamily: "Roboto",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                            textAlign: TextAlign.left),
                      ),

                      SizedBox(
                        height: 16.h,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: SingleChildScrollView(
                          controller: controller.registerScrollController,
                          child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemCount: controller.registerList.length,
                            itemBuilder: (context, i) => Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(50),
                                                    child: controller.registerList.isNotEmpty
                                                        ? controller.registerList[i].image ==
                                                                null
                                                            ? SvgPicture.asset(
                                                                placeholder,
                                                                height: 40.h,
                                                                width: 40.w,
                                                                fit: BoxFit.cover,
                                                              )
                                                            : CachedNetworkImage(
                                                                imageUrl: controller.registerList[i].image!,
                                                                height: 40.h,
                                                                width: 40.w,
                                                                fit: BoxFit.cover,
                                                                progressIndicatorBuilder:
                                                                    (context, url,
                                                                            downloadProgress) =>
                                                                        SvgPicture
                                                                            .asset(
                                                                  placeholder,
                                                                  height: 40.h,
                                                                  width: 40.w,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                                errorWidget:
                                                                    (context, url,
                                                                            error) =>
                                                                        SvgPicture
                                                                            .asset(
                                                                  placeholder,
                                                                  height: 40.h,
                                                                  width: 40.w,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              )
                                                        : SvgPicture.asset(
                                                            placeholder,
                                                            height: 40.h,
                                                            width: 40.w,
                                                            fit: BoxFit.cover,
                                                          ),
                                                  ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // claireroman
                                          Text(controller.registerList[i].userName ?? controller.registerList[i].fullName ?? "", 
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
                                          Text(controller.registerList[i].fullName ?? controller.registerList[i].userName ?? "",
                                              style: TextStyle(
                                                  color: black_121212,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily:
                                                      helveticaNeueNeue_medium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 14.sp),
                                              textAlign: TextAlign.left),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          // 12 Jun 2020, 110:00 AM
                                          Text(controller.registerList[i].createdAt != null ?
                                            DateFormat('dd MMM yyyy, hh:mm a').format(controller.registerList[i].createdAt!).toString() : "",
                                              style: TextStyle(
                                                  color: Color(0xffaaaaaa),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Roboto",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10.0),
                                              textAlign: TextAlign.left)
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        //
                                        Text(controller.registerList[i].price ?? "",
                                            style: TextStyle(
                                                color: grey_aaaaaa,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Roboto",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.right),

                                        // Gold
                                        Text(controller.registerList[i].category ?? "",
                                            style: TextStyle(
                                                color: orange_ff881a,
                                                fontFamily: "Roboto",
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.right)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
