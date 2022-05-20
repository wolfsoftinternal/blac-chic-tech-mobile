import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/view/EventLocation.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_height.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ConfirmLocation extends StatefulWidget {
  ConfirmLocation({Key? key}) : super(key: key);

  @override
  State<ConfirmLocation> createState() => _ConfirmLocationState();
}

class _ConfirmLocationState extends State<ConfirmLocation> {
  EventController controller = Get.put(EventController());

  _onWillPop(){
    Get.back();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24.w),
                  child:  GestureDetector(
                    onTap: (){
                      Get.back();
                      Get.back();
                    },
                    child: Container(
                      width: 48.r,
                      height: 48.r,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 6,
                            blurRadius: 10,
                            offset: Offset(1, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(12.0.r),
                        child: SvgPicture.asset(icon_back_black_arrow,width: 24.w,height: 24.w,),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Text('Event Venue Address',
                    style: TextStyle(
                        color: black_121212,
                        fontWeight: FontWeight.w500,
                        fontFamily: helvetica_neu_bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 16),
                    textAlign: TextAlign.center),
                    Spacer(),
                   Container(height: 46, width: 46,)
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 24.0, right: 24.0),
              child: setRoboto('Location address', 12.sp, grey_aaaaaa, FontWeight.w900),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0, left: 24.0, right: 24.0),
              child: Row(
                children: [
                  SvgPicture.asset(location_pin, width: 24, height: 24),
                  setRoboto(controller.addressController.value.text, 12.sp, grey_aaaaaa, FontWeight.w900),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Icon(Icons.arrow_forward_ios_rounded)
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Divider(
                color: grey_e8e8e8,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: HeightData.fifty_eight,
                      width: MediaQuery.of(context).size.width,
                      decoration: EditTextDecoration,
                      child: Padding(
                        padding:  EdgeInsets.only(
                            left: 12.w, right: 12.w, top: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Landmark',
                              style: TextStyle(
                                  color: grey_aaaaaa,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helvetica_neu_bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              controller.landmarkController.value.text,
                              style: TextStyle(
                                  color: black_121212,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helvetica_neu_bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Container(
                        height: HeightData.fifty_eight,
                        width: MediaQuery.of(context).size.width,
                        decoration: EditTextDecoration,
                        child: Padding(
                          padding:  EdgeInsets.only(
                              left: 12.w, right: 12.w, top: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Street name',
                                style: TextStyle(
                                    color: grey_aaaaaa,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: helvetica_neu_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.sp),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                controller.street1Controller.value.text,
                                style: TextStyle(
                                    color: black_121212,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: helvetica_neu_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Container(
                        height: HeightData.fifty_eight,
                        width: MediaQuery.of(context).size.width,
                        decoration: EditTextDecoration,
                        child: Padding(
                          padding:  EdgeInsets.only(
                              left: 12.w, right: 12.w, top: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Street name 2',
                                style: TextStyle(
                                    color: grey_aaaaaa,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: helvetica_neu_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.sp),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                controller.street2Controller.value.text,
                                style: TextStyle(
                                    color: black_121212,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: helvetica_neu_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: BlackButton(
                "Save Address",
                Colors.white,
                () {
                  Get.back();
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}