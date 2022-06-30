import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/TagPeopleModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:blackchecktech/Widget/search_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
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
                        padding: EdgeInsets.only(left: 10.w),
                        child: GridView.builder(
                            primary: false,
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.42.h,
                                    mainAxisSpacing: 0,
                                    crossAxisSpacing: 0),
                            itemCount: controller.registerList.value.data!.transactionHistory!.length,
                            itemBuilder: (context, i) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 16.h),
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
                                                      controller.registerList.value.data!.transactionHistory![i].admissionType!,
                                                      style: TextStyle(
                                                          fontFamily: roboto_regular,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 16.sp),
                                                      textAlign: TextAlign.left),

                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  //
                                                  Text('\$' + double.parse(controller.registerList.value.data!.transactionHistory![i].perTicketPrice!).toInt().toString(),
                                                      style: TextStyle(
                                                          color: const Color(
                                                              0xffaaaaaa),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: roboto_regular,
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
                                              Text(controller.registerList.value.data!.transactionHistory![i].totalUsers!.toString() + ' Sold',
                                                  style: TextStyle(
                                                      color:
                                                          const Color(0xff0a84ff),
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: roboto_bold,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 16.sp),
                                                  textAlign: TextAlign.left),

                                              SizedBox(
                                                height: 12.h,
                                              ),

                                              Text('\$' + controller.registerList.value.data!.transactionHistory![i].totalPrice!.toString(),
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: roboto_regular,
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
                        child: Text(controller.registerList.value.data!.registeredUsers!.length.toString() + ' Users',
                            style: TextStyle(
                                color: grey_aaaaaa,
                                fontFamily: roboto_regular,
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
                          child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemCount: controller.registerList.value.data!.registeredUsers!.length,
                            itemBuilder: (context, i) => Padding(
                              padding: EdgeInsets.only(bottom: 16.h),
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircularProfileAvatar(
                                '',
                                radius: 20,
                                                    child: controller.registerList.value.data!.registeredUsers!.isNotEmpty
                                                        ? controller.registerList.value.data!.registeredUsers![i].image ==
                                                                null
                                                            ? SvgPicture.asset(
                                                                placeholder,
                                                                height: 40.h,
                                                                width: 40.w,
                                                                fit: BoxFit.cover,
                                                              )
                                                            : CachedNetworkImage(
                                                                imageUrl: controller.registerList.value.data!.registeredUsers![i].image!,
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
                                          Text(controller.registerList.value.data!.registeredUsers![i].userName ?? controller.registerList.value.data!.registeredUsers![i].fullName ?? "", 
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
                                          Text(controller.registerList.value.data!.registeredUsers![i].fullName ?? controller.registerList.value.data!.registeredUsers![i].userName ?? "",
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
                                          Text(controller.registerList.value.data!.registeredUsers![i].createdAt != null ?
                                            DateFormat('dd MMM yyyy, hh:mm a').format(controller.registerList.value.data!.registeredUsers![i].createdAt!).toString() : "",
                                              style: TextStyle(
                                                  color: Color(0xffaaaaaa),
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: roboto_medium,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10.sp),
                                              textAlign: TextAlign.left)
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        //
                                        Text(controller.registerList.value.data!.registeredUsers![i].price ?? "",
                                            style: TextStyle(
                                                color: grey_aaaaaa,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Roboto",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.right),

                                        // Gold
                                        Text(controller.registerList.value.data!.registeredUsers![i].category ?? "",
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
