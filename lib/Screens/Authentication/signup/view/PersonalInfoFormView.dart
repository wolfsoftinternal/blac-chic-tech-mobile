import 'dart:io';

import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/InputTextLayout.dart';
import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CityListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CountryListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/StateListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/ExperienceInfoFormView.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
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
            const SizedBox(
              height: 60,
            ),
            ToolbarWithHeader(
              step: 0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Personal Information
                      Center(
                        child: Text(str_personal_info,
                            style: const TextStyle(
                                color: black_121212,
                                fontWeight: FontWeight.w900,
                                fontFamily: helvetica_neu_bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 24.0),
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Massa nulla.
                      Center(
                        child: Text(str_personal_info_lorem,
                            style: const TextStyle(
                                color: grey_aaaaaa,
                                fontWeight: FontWeight.w500,
                                fontFamily: helveticaNeueNeue_medium,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0,
                                height: 1.5),
                            textAlign: TextAlign.center),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      // Rectangle 1407
                      Row(
                        children: [
                          Container(
                            width: 72,
                            height: 72,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                color: light_grey_f2f2f2),
                            child: profileImage.toString() != "File: ''"
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectPhoto();
                                      });
                                    },
                                    child: Image.file(
                                      profileImage,
                                      fit: BoxFit.fill,
                                      height: 72,
                                      width: 72,
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectPhoto();
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: SvgPicture.asset(
                                        icon_upload_img,
                                        width: 72,
                                        height: 72,
                                        color: grey_aaaaaa,
                                      ),
                                    )),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          // UPLOAD PHOTO
                          const Text("UPLOAD PHOTO",
                              style: TextStyle(
                                  color: black_121212,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: helvetica_neu_bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.0),
                              textAlign: TextAlign.left)
                        ],
                      ),

                      const SizedBox(
                        height: 23.3,
                      ),

                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: HeightData.fifty_seven,
                              decoration: EditTextDecoration,
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: DropdownButton(
                                      //  validator: (value) => value == null ? "Select a country" : null,
                                      dropdownColor: Colors.white,
                                      value: strCountryName,
                                      hint: const Text("Country",
                                          style: TextStyle(
                                              color: grey_aaaaaa,
                                              fontWeight: FontWeight.w500,
                                              fontFamily:
                                                  helveticaNeueNeue_medium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0),
                                          textAlign: TextAlign.left),
                                      icon: SvgPicture.asset(
                                        icon_down_arrow_spinner,
                                        width: 12,
                                        height: 12,
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
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: HeightData.fifty_seven,
                              decoration: EditTextDecoration,
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: DropdownButton(
                                    dropdownColor: Colors.white,
                                    value: strStateName,
                                    hint: const Text("State",
                                        style: TextStyle(
                                            color: grey_aaaaaa,
                                            fontWeight: FontWeight.w500,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0),
                                        textAlign: TextAlign.left),
                                    icon: SvgPicture.asset(
                                      icon_down_arrow_spinner,
                                      width: 12,
                                      height: 12,
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

                      const SizedBox(
                        height: 16,
                      ),

                      Container(
                        height: HeightData.fifty_seven,
                        width: MediaQuery.of(context).size.width,
                        decoration: EditTextDecoration,
                        child: DropdownButtonHideUnderline(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              value: strCityName,
                              hint: const Text("City",
                                  style: TextStyle(
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left),
                              icon: SvgPicture.asset(
                                icon_down_arrow_spinner,
                                width: 12,
                                height: 12,
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  strCityName = value;
                                  controller.strCityId.value = value!;
                                });
                              },
                              items: controller.cityList.map((CityDatum value) {
                                return DropdownMenuItem<String>(
                                  value: value.id.toString(),
                                  child: Text(value.name.toString()),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      Container(
                        height: HeightData.fifty_seven,
                        decoration: EditTextDecoration,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                            right: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: setDobTextFieldNext(
                                      controller.dobController.value,
                                      "Date of Birth",
                                      false,
                                      TextInputType.emailAddress,
                                      false,
                                      "",
                                      TextInputAction.next, (value) {
                                    controller.dobController.value.text = value;
                                  }, () {
                                    selectDate();
                                  },),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: grey_aaaaaa
                          ),
                          borderRadius:
                              const BorderRadius.all(const Radius.circular(4)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 13, bottom: 12),
                          child: TextField(
                            controller: controller.aboutController.value,
                            maxLines: 5,
                            minLines: 1,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            style: const TextStyle(
                                color: black_121212,
                                fontFamily: helveticaNeueNeue_medium,
                                fontSize: 14.0),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              isDense: true,
                              // you can change this with the top text like you want
                              labelText: 'About you',
                              labelStyle: TextStyle(
                                  color: grey_aaaaaa,
                                  fontFamily: helveticaNeueNeue_medium,
                                  fontSize: 14),
                              hintStyle: TextStyle(
                                  color: black_121212,
                                  fontFamily: helveticaNeueNeue_medium,
                                  fontSize: 14),
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

                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 0.7,
                              color: Colors.black12,
                            ),
                          ),
                          // Social Media Account
                          const Text("Social Media Account",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "NeueHelvetica",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.left),

                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 0.7,
                              color: Colors.black12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(width: 1, color: light_grey_f2f2f2)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 17.5, right: 17.5, top: 13.5, bottom: 13.5),
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
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(width: 1, color: light_grey_f2f2f2)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 17.5, right: 17.5, top: 13.5, bottom: 13.5),
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
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border:
                                Border.all(width: 1, color: light_grey_f2f2f2)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 17.5, right: 17.5, top: 13.5, bottom: 13.5),
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
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: BlackNextButton(str_continue, black_121212, () {
                FocusScope.of(context).unfocus();
                if (controller.checkPersonalValidation(context)) {
                  checkNet(context).then((value) {
                    controller.personalInfoAPI(context, "");
                  });
                }
              }),
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
        return Container(
          height: 250,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
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
                      padding: const EdgeInsets.only(right: 5.0),
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
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: '',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
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
