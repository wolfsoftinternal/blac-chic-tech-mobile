import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/view/EventLocation.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_height.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utilities/TextfieldUtility.dart';
import 'package:blackchecktech/Utilities/Validator.dart';
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

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            setRoboto('LANDMARK', 12.sp, grey_aaaaaa, FontWeight.w900),
                            Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: setTextFieldHelveticaMediumOrangeBorder(
                                controller.landmarkController.value,
                                "Landmark",
                                false,
                                TextInputType.text,
                                TextInputAction.next,
                                () => {
                                  // on Chnages
                                },
                                validatetitle,
                                false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            setRoboto('ADDRESS', 12.sp, grey_aaaaaa, FontWeight.w900),
                            Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: setTextFieldHelveticaMediumOrangeBorder(
                                controller.street1Controller.value,
                                "Address",
                                false,
                                TextInputType.text,
                                TextInputAction.next,
                                () => {
                                  // on Chnages
                                },
                                validatetitle,
                                false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            setRoboto('ADDRESS 2', 12.sp, grey_aaaaaa, FontWeight.w900),
                            Padding(
                              padding: const EdgeInsets.only(top: 14.0),
                              child: setTextFieldHelveticaMediumOrangeBorder(
                                controller.street2Controller.value,
                                "Address 2",
                                false,
                                TextInputType.text,
                                TextInputAction.next,
                                () => {
                                  // on Chnages
                                },
                                validatetitle,
                                false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  setRoboto('CITY', 12.sp, grey_aaaaaa, FontWeight.w900),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 14.0),
                                    child: setTextFieldHelveticaMediumOrangeBorder(
                                      controller.cityController.value,
                                      "City",
                                      false,
                                      TextInputType.text,
                                      TextInputAction.next,
                                      () => {
                                        // on Chnages
                                      },
                                      validatetitle,
                                      false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  setRoboto('COUNTRY', 12.sp, grey_aaaaaa, FontWeight.w900),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 14.0),
                                    child: setTextFieldHelveticaMediumOrangeBorder(
                                      controller.countryController.value,
                                      "Country",
                                      false,
                                      TextInputType.text,
                                      TextInputAction.next,
                                      () => {
                                        // on Chnages
                                      },
                                      validatetitle,
                                      false
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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