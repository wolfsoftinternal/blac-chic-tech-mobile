import 'dart:io';

import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/InputTextLayoutDemo.dart';
import 'package:blackchecktech/Layout/ToolbarLocation.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/SignupController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CityListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CountryListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/StateListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Settings/controller/SettingsController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_height.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Styles/my_strings.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextfieldUtility.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  SettingsController controller = Get.put(SettingsController());
  StepsController stepsController = Get.put(StepsController());
  SignupModel? myModel;
  String? strCountryName;
  String? strStateName;
  String? strCityName;
  File profileImage = File("");
  String? profilePath;
  FocusNode? linkedin;
  FocusNode? twitter;
  FocusNode? instagram;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkNet(context).then((value) {
      stepsController.countryListApi();
    });

    init();
  }

  init() async {
    var preferences = MySharedPref();
    myModel = await preferences.getSignupModel(SharePreData.keySignupModel);

    controller.firstnameController.value.text = myModel!.data!.firstName ?? "";
    controller.lastnameController.value.text = myModel!.data!.lastName ?? "";
    controller.usernameController.value.text = myModel!.data!.userName ?? "";
    controller.emailController.value.text = myModel!.data!.email ?? "";

    stepsController.dobController.value.text = myModel!.data!.dateOfBirth ?? "";
    stepsController.aboutController.value.text = myModel!.data!.aboutUs ?? "";
    stepsController.linkedinController.value.text = myModel!.data!.linkedinUrl ?? "";
    stepsController.twitterController.value.text = myModel!.data!.twitterUrl ?? "";
    stepsController.instagramController.value.text = myModel!.data!.instagramUrl ?? "";

    strCountryName = myModel!.data!.countryDetails!.id.toString();
    strStateName = myModel!.data!.stateDetails!.id.toString();
    strCityName = myModel!.data!.cityDetails!.id.toString();

    checkNet(context).then((value) {
      stepsController.stateListApi(myModel!.data!.countryDetails!.id.toString());
      stepsController.cityListApi(myModel!.data!.countryDetails!.id.toString(), myModel!.data!.stateDetails!.id.toString());
    });

    setState(() {});
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
            ToolbarWithHeaderCenterTitle('Edit Profile'),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 24.w, right: 24.w, top: 40.h, bottom: 24.h),
                  child: myModel == null
                      ? Container()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  SizedBox(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xffc4c4c4),
                                              spreadRadius: 2,
                                              blurRadius: 15,
                                              offset: Offset(-2, 7),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: profileImage.toString() !=
                                                    "File: ''"
                                                ? Image.file(
                                                    profileImage,
                                                    fit: BoxFit.cover,
                                                    height: 143.h,
                                                    width: 105.w,
                                                  )
                                                : CachedNetworkImage(
                                                    imageUrl:
                                                        myModel!.data!.image!,
                                                    height: 143.h,
                                                    width: 105.w,
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                downloadProgress) =>
                                                            SvgPicture.asset(
                                                      placeholder,
                                                      height: 143.h,
                                                      width: 105.w,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            SvgPicture.asset(
                                                      placeholder,
                                                      height: 143.h,
                                                      width: 105.w,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectPhoto();
                                        });
                                      },
                                      child: SvgPicture.asset(
                                        icon_edit_profile,
                                        width: 32.w,
                                        height: 32.h,
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 46.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: InputTextLayoutDemo(
                                        str_first_name,
                                        controller.firstnameController.value,
                                        false,
                                        TextInputAction.next,
                                        TextInputType.text, true)),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                    child: InputTextLayoutDemo(
                                        str_last_name,
                                        controller.lastnameController.value,
                                        false,
                                        TextInputAction.next,
                                        TextInputType.text, true)),
                              ],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            InputTextLayoutDemo(
                                str_username,
                                controller.usernameController.value,
                                false,
                                TextInputAction.next,
                                TextInputType.text, true),
                            SizedBox(
                              height: 16.h,
                            ),
                            InputTextLayoutDemo(
                                str_email,
                                controller.emailController.value,
                                false,
                                TextInputAction.next,
                                TextInputType.emailAddress, true),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 60.h,
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 10),
                                    decoration: BoxDecoration(
                                      color: light_grey_f2f2f2,
                                      borderRadius: BorderRadius.circular(4),
                                      // border: Border.all(color: Colors.black,width: 4)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, right: 10.w),
                                        child: DropdownButton(
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
                                                stepsController
                                                    .strCountryId.value = value!;
                                                strCountryName = value;
                                                strStateName = null;
                                                strCityName = null;
                                                stepsController
                                                    .stateListApi(value);
                                              });
                                            },
                                            items: stepsController.countrylist
                                                .map((CountryDatum value) {
                                              return DropdownMenuItem<String>(
                                                value: value.id.toString(),
                                                child:
                                                    Text(value.name.toString()),
                                              );
                                            }).toList()),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 60.h,
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 10),
                                    decoration: BoxDecoration(
                                      color: light_grey_f2f2f2,
                                      borderRadius: BorderRadius.circular(4),
                                      // border: Border.all(color: Colors.black,width: 4)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, right: 10.w),
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
                                              stepsController.strStateId.value =
                                                  value!;
                                              strCityName = null;
                                              stepsController.cityListApi(
                                                  stepsController
                                                      .strCountryId.value,
                                                  stepsController
                                                      .strStateId.value);
                                            });
                                          },
                                          items: stepsController.stateList
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 60.h,
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 10),
                                    decoration: BoxDecoration(
                                      color: light_grey_f2f2f2,
                                      borderRadius: BorderRadius.circular(4),
                                      // border: Border.all(color: Colors.black,width: 4)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.w, right: 10.w),
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
                                              stepsController.strCityId.value =
                                                  value!;
                                            });
                                          },
                                          items: stepsController.cityList
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
                                  width: 8.w,
                                ),
                                Expanded(
                                  child: Container(
                                    height: HeightData.fifty_seven,
                                    decoration: EditTextDecoration,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 12.w,
                                        right: 12.w,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: EdgeInsets.all(5.r),
                                              child: setDobTextFieldNext(
                                                stepsController
                                                    .dobController.value,
                                                "Date of Birth",
                                                false,
                                                TextInputType.emailAddress,
                                                false,
                                                "",
                                                TextInputAction.next,
                                                (value) {
                                                  stepsController.dobController
                                                      .value.text = value;
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
                              height: 32.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      width: double.infinity,
                                      height: 1,
                                      decoration: const BoxDecoration(
                                          color: view_line_f4f6f6)),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                // Social media account
                                Text("Social media account",
                                    style: TextStyle(
                                        color: const Color(0xff3f3f3f),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "NeueHelvetica",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    textAlign: TextAlign.left),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      width: double.infinity,
                                      height: 1,
                                      decoration: const BoxDecoration(
                                          color: view_line_f4f6f6)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                      width: 1.w, color: light_grey_f2f2f2)),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 17.5.w,
                                      right: 17.5.w,
                                      top: 13.5.h,
                                      bottom: 13.5.h),
                                  child: TextField(
                                    controller:
                                        stepsController.linkedinController.value,
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    readOnly: controller.linkedin.value,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 15),
                                      prefixIconConstraints: BoxConstraints(
                                          maxHeight: 21.h, maxWidth: 38.w),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(right: 17.w),
                                        child: Image.asset(
                                          icon_linkedin,
                                        ),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          controller.linkedin.value = false;
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: SvgPicture.asset(
                                            icon_edit_blue,
                                            height: 1.h,
                                            width: 1.w,
                                          ),
                                        ),
                                      ),
                                      isDense: true,
                                      hintText: 'Linkedin Account',
                                      hintStyle: TextStyle(
                                          color: grey_aaaaaa,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      border: InputBorder.none,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    cursorColor: black_121212,
                                  )),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                      width: 1.w, color: light_grey_f2f2f2)),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 17.5.w,
                                      right: 17.5.w,
                                      top: 13.5.h,
                                      bottom: 13.5.h),
                                  child: TextField(
                                    controller:
                                        stepsController.twitterController.value,
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    readOnly: controller.twitter.value,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 15),
                                      prefixIconConstraints: BoxConstraints(
                                          maxHeight: 21.h, maxWidth: 38.w),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(right: 17.w),
                                        child: Image.asset(
                                          icon_twitter,
                                        ),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          controller.twitter.value = false;
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: SvgPicture.asset(
                                            icon_edit_blue,
                                            height: 1.h,
                                            width: 1.w,
                                          ),
                                        ),
                                      ),
                                      isDense: true,
                                      hintText: 'Twitter Account',
                                      hintStyle: TextStyle(
                                          color: grey_aaaaaa,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      border: InputBorder.none,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    cursorColor: black_121212,
                                  )),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
                                  border: Border.all(
                                      width: 1.w, color: light_grey_f2f2f2)),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 17.5.w,
                                      right: 17.5.w,
                                      top: 13.5.h,
                                      bottom: 13.5.h),
                                  child: TextField(
                                    controller:
                                        stepsController.instagramController.value,
                                    style: TextStyle(
                                        color: black_121212,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                    readOnly: controller.instagram.value,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 15),
                                      prefixIconConstraints: BoxConstraints(
                                          maxHeight: 21.h, maxWidth: 38.w),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(right: 17.w),
                                        child: Image.asset(
                                          icon_instagram,
                                        ),
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          controller.instagram.value = false;
                                          instagram!.requestFocus();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: SvgPicture.asset(
                                            icon_edit_blue,
                                            height: 1.h,
                                            width: 1.w,
                                          ),
                                        ),
                                      ),
                                      isDense: true,
                                      hintText: 'Instagram Account',
                                      hintStyle: TextStyle(
                                          color: grey_aaaaaa,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: helveticaNeueNeue_medium,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp),
                                      border: InputBorder.none,
                                    ),
                                    textInputAction: TextInputAction.next,
                                    cursorColor: black_121212,
                                  )),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: BlackButton("Save Profile", Colors.white, () {
                if(imagePath.path.isNotEmpty){
                  stepsController.imagePath.value = imagePath.path.toString();
                }
                stepsController.personalInfoAPI(context, 'edit_profile');
              }),
            )
          ],
        ),
      ),
    );
  }

  selectPhoto() {
    showImagePicker(context).then((value) {
      setState(() {
        if (imagePath.toString() != "File: ''") {
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

    stepsController.dobController.value.text = formattedDate;
  }
}
