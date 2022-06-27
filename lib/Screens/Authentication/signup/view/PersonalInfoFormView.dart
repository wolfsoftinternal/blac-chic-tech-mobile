import 'dart:io';

import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CityListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CountryListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/StateListModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';

import '../../../../Styles/my_height.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utilities/TextfieldUtility.dart';
import '../../../../Widget/EditTextDecoration.dart';

class PersonalInfoFormView extends StatefulWidget {
  const PersonalInfoFormView({Key? key}) : super(key: key);

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInfoFormView> {
  StepsController controller = Get.put(StepsController());
  String? strCountryName;
  String? strStateName;
  String? strCityName;
  bool checkColor = false;
  bool checkFillColor = true;
  File profileImage = File("");
  String? profilePath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.countryListApi();
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
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ToolbarWithHeader(
                step: 0,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Personal Information
                      Center(
                        child: Text(str_personal_info,
                            style: TextStyle(
                                color: black_121212,
                                fontWeight: FontWeight.w900,
                                fontFamily: helvetica_neu_bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 24.0.sp),
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Massa nulla.
                      Center(
                        child: Text(str_personal_info_lorem,
                            style: TextStyle(
                                color: grey_aaaaaa,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp,
                                height: 1.5.h),
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      // Rectangle 1407
                      Row(
                        children: [
                          Container(
                            width: 72.w,
                            height: 72.h,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.r)),
                                color: light_grey_f2f2f2),
                            child: profileImage.toString() != "File: ''"
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectPhoto();
                                      });
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: Image.file(
                                        profileImage,
                                        fit: BoxFit.fill,
                                        height: 72.r,
                                        width: 72.r,
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectPhoto();
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(18.0.r),
                                      child: SvgPicture.asset(
                                        icon_upload_img,
                                        width: 72.r,
                                        height: 72.r,
                                        color: grey_aaaaaa,
                                      ),
                                    )),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          // UPLOAD PHOTO
                          Text("UPLOAD PHOTO",
                              style: TextStyle(
                                  color: black_121212,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: helvetica_neu_bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp),
                              textAlign: TextAlign.left)
                        ],
                      ),

                      SizedBox(
                        height: 24.h,
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 48.h,
                              decoration: EditTextDecoration,
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.w, right: 16.w),
                                  child: DropdownButton(
                                      //  validator: (value) => value == null ? "Select a country" : null,
                                      dropdownColor: Colors.white,
                                      value: strCountryName,
                                      hint: Text("Country",
                                          style: TextStyle(
                                              color: grey_aaaaaa,
                                              fontWeight: FontWeight.w500,
                                              fontFamily:
                                                  helveticaNeueNeue_medium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                      icon: SvgPicture.asset(
                                        icon_down_arrow_spinner,
                                        width: 12.r,
                                        height: 12.r,
                                      ),
                                      onChanged: (String? value) {
                                        setState(() {
                                          controller.strCountryId.value =
                                              value!;
                                          strCountryName = value;
                                          strStateName = null;
                                          strCityName = null;
                                          controller.stateListApi(value);
                                        });
                                      },
                                      items: controller.countrylist
                                          .map((CountryDatum value) {
                                        return DropdownMenuItem<String>(
                                          value: value.id.toString(),
                                          child: Text(value.name.toString()),
                                        );
                                      }).toList()),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 48.h,
                              decoration: EditTextDecoration,
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.w, right: 16.w),
                                  child: DropdownButton(
                                    dropdownColor: Colors.white,
                                    value: strStateName,
                                    hint: Text("State",
                                        style: TextStyle(
                                            color: grey_aaaaaa,
                                            fontWeight: FontWeight.w500,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left),
                                    icon: SvgPicture.asset(
                                      icon_down_arrow_spinner,
                                      width: 12.r,
                                      height: 12.r,
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        strStateName = value;
                                        controller.strStateId.value = value!;
                                        strCityName = null;
                                        controller.cityListApi(
                                            controller.strCountryId.value,
                                            controller.strStateId.value);
                                      });
                                    },
                                    items: controller.stateList
                                        .map((StateDatum value) {
                                      return DropdownMenuItem<String>(
                                        value: value.id.toString(),
                                        child: Text(value.name.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 16.h,
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 48.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: EditTextDecoration,
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 16.w, right: 16.w),
                                  child: DropdownButton(
                                    dropdownColor: Colors.white,
                                    value: strCityName,
                                    hint: Text("City",
                                        style: TextStyle(
                                            color: grey_aaaaaa,
                                            fontWeight: FontWeight.w500,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left),
                                    icon: SvgPicture.asset(
                                      icon_down_arrow_spinner,
                                      width: 12.r,
                                      height: 12.r,
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        strCityName = value;
                                        controller.strCityId.value = value!;
                                      });
                                    },
                                    items: controller.cityList
                                        .map((CityDatum value) {
                                      return DropdownMenuItem<String>(
                                        value: value.id.toString(),
                                        child: Text(value.name.toString()),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 48.h,
                              decoration: EditTextDecoration,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 12.w,
                                  right: 12.w,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsets.all(5.r),
                                        child: setDobTextFieldNext(
                                          controller.dobController.value,
                                          "Date of Birth",
                                          false,
                                          TextInputType.emailAddress,
                                          false,
                                          "",
                                          TextInputAction.next,
                                          (value) {
                                            controller.dobController.value
                                                .text = value;
                                          },
                                          () {
                                            selectDate();
                                          },
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

                      SizedBox(
                        height: 24.h,
                      ),

                      Text(
                        'ABOUT ME',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: robotoBlack,
                          fontWeight: FontWeight.w900,
                          color: black,
                        ),
                      ),

                      SizedBox(
                        height: 16.h,
                      ),

                      Container(
                        decoration: EditTextDecoration,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.w, right: 16.w, top: 13.h, bottom: 12.h),
                          child: TextField(
                            controller: controller.aboutController.value,
                            maxLines: 10,
                            minLines: 7,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                                color: black_121212,
                                fontFamily: helveticaNeueNeue_medium,
                                fontSize: 14.sp),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              isDense: true,
                              // you can change this with the top text like you want
                              
                              labelStyle: TextStyle(
                                  color: grey_aaaaaa,
                                  fontFamily: helveticaNeueNeue_medium,
                                  fontSize: 14.sp),
                              hintText: 'Write here',
                              hintStyle: TextStyle(
                                  color: grey_aaaaaa,
                                  fontFamily: helveticaNeueNeue_medium,
                                  fontSize: 14.sp),
                              border: InputBorder.none,
                              filled: false,
                            ),
                            cursorColor: black_121212,
                            onEditingComplete: () {
                              FocusScope.of(context).unfocus();
                              FocusScope.of(context).nextFocus();
                            },
                            onChanged: (inputValue) {},
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 0.7.h,
                              color: Colors.black12,
                            ),
                          ),

                          SizedBox(
                            width: 5.w,
                          ),
                          // Social Media Account
                          Text("Social Media Account",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helveticaNeueNeue_medium,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: 0.5,
                                  fontSize: 14.sp),
                              textAlign: TextAlign.left),

                          SizedBox(
                            width: 5.w,
                          ),

                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 0.7.h,
                              color: Colors.black12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                                width: 1.w, color: light_grey_f2f2f2)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 17.5.w,
                                right: 17.5.w,
                                ),
                            child: setSocialTextFieldNext(
                                controller.linkedinController.value,
                                "Linkedin Account",
                                false,
                                TextInputType.name,
                                false,
                                "",
                                TextInputAction.next,
                                (value) {},
                                icon_linkedin),
                            // child: Row(
                            //   children: [
                            // SvgPicture.asset(
                            //   icon_linkedin,
                            //   width: 21,
                            //   height: 21,
                            // ),
                            //     const SizedBox(
                            //       width: 17.5,
                            //     ),
                            //     // www.linkedin.com/elmira
                            //     const Text("www.linkedin.com/elmira",
                            //         style: TextStyle(
                            //             color: black_121212,
                            //             fontWeight: FontWeight.w500,
                            //             fontFamily: helveticaNeueNeue_medium,
                            //             fontStyle: FontStyle.normal,
                            //             fontSize: 14.0),
                            //         textAlign: TextAlign.left)
                            //   ],
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                                width: 1.w, color: light_grey_f2f2f2)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 17.5.w,
                                right: 17.5.w,),
                            child: setSocialTextFieldNext(
                                controller.twitterController.value,
                                "Twitter Account",
                                false,
                                TextInputType.name,
                                false,
                                "",
                                TextInputAction.next,
                                (value) {},
                                icon_twitter),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        height: 48.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                                width: 1.w, color: light_grey_f2f2f2)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 17.5.w,
                                right: 17.5.w,
                                ),
                            child: setSocialTextFieldNext(
                                controller.instagramController.value,
                                "Instagram Account",
                                false,
                                TextInputType.name,
                                false,
                                "",
                                TextInputAction.next,
                                (value) {},
                                icon_instagram),
                          ),
                        ),
                      ),   
                      SizedBox(height: 30,),                   
                    ],
                  ),
                ),
              ),
            ),
            
            
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                    color:  Color(0x14aabab7).withOpacity(0.15),
                    offset: Offset(0,-20),
                    blurRadius: 20,
                    spreadRadius: 0
                )] ,
              ),
              child: Padding(
                padding: EdgeInsets.all(24.r),
                child: BlackNextButton(str_continue, black_121212, () {
                  FocusScope.of(context).unfocus();
                  if (imagePath.path.isNotEmpty) {
                    controller.imagePath.value = imagePath.path.toString();
                  }
                  if (controller.checkPersonalValidation(context)) {
                    checkNet(context).then((value) {
                      controller.personalInfoAPI(context, 'personal_info');
                    });
                  }
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  selectDate() async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime? tempPickedDate = DateTime.now();
        return SizedBox(
          height: 250.h,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: CupertinoButton(
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: orange_ff881a),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: CupertinoButton(
                        child: const Text('Done',
                            style: TextStyle(color: orange_ff881a)),
                        onPressed: () {
                          Navigator.of(context).pop(tempPickedDate);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    maximumDate: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formattedDate = formatter.format(pickedDate!);

    controller.dobController.value.text = formattedDate;
    print(controller.dobController.value.text);
  }

  selectPhoto() {
    showImagePicker(context).then((value) {
      setState(() {
        if (imagePath.toString() != "File: ''") {
          controller.boolComapnyLogo.value = true;
          _cropImage();
        }
      });
    });
  }

  Future<File> _cropImage() async {
    File? croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePath.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: const AndroidUiSettings(
            toolbarTitle: '',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: const IOSUiSettings(
          title: '',
        ));
    if (croppedFile != null) {
      setState(() {
        profileImage = croppedFile;
        profilePath = croppedFile.path;
      });
    }

    return croppedFile!;
  }
}
