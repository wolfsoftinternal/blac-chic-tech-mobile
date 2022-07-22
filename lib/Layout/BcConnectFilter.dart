import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CityListModel.dart';
import 'package:blackchecktech/Screens/Authentication/signup/model/CountryListModel.dart';
import 'package:blackchecktech/Screens/Home/BCConnect/controller/BCConnectController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Event/controller/EventDetailController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextfieldUtility.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/EditTextDecoration.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class BcConnectFilter extends StatefulWidget {
  BcConnectFilter({Key? key}) : super(key: key);

  @override
  State<BcConnectFilter> createState() => _BcConnectFilterState();
}

class _BcConnectFilterState extends State<BcConnectFilter> {
  EventDetailController eventDetailController = Get.put(EventDetailController());
  VideoController videoController = Get.put(VideoController());
  BCConnectController controller = Get.put(BCConnectController());
  StepsController stepsController = Get.put(StepsController());
  
  bool checkColor = false;
  bool checkFillColor = true;
  bool _hasBeenPressednBidNow = false;
  bool isLayoutFirst = false;

  String? strCountryName;
  String? strRole;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: checkFillColor == false
                    ? checkColor == true
                        ? orange_ff881a
                        : grey_f5f5f5
                    : grey_f5f5f5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: checkFillColor == false
                  ? checkColor == true
                      ? Colors.white
                      : grey_f5f5f5
                  : grey_f5f5f5,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 8.w,
                ),
                Icon(
                  IconlyLight.search,
                  color: grey_aaaaaa,
                  size: 16.r,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: TextField(
                  style: TextStyle(
                    fontFamily: helveticaNeueNeue_medium,
                    fontSize: 14.sp,
                    color: black_121212
                  ),
                  controller: videoController.searchController.value,
                  autofocus: false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Search people",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                    fillColor: const Color(0xfff5f5f5),
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: helveticaNeueNeue_medium,
                      color: grey_aaaaaa
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  onChanged: (value){
                    if (value.isNotEmpty) {
                      setState(() {
                        checkFillColor = false;
                        checkColor = true;
                      });
                    } else {
                      setState(() {
                        checkFillColor = true;
                      });
                    }

                    if(stepsController.industryController.value.text != '' && stepsController.industryName == '' || stepsController.industryName == null){
                      stepsController.industryName = stepsController.industryController.value.text;
                    }

                    checkNet(context).then((value) {
                      videoController.PageNumber.value = 1;
                      dynamic data = {
                        'search': videoController.searchController.value.text.toString(),
                        'page': videoController.PageNumber.toString(),
                        'country': stepsController.strCountryId.value,
                        'industry': stepsController.industryName.toString(),
                        'type': strRole.toString()
                      };
                      videoController.userListAPI(context, true, null, data);
                    });
                  },
                ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (_hasBeenPressednBidNow = !_hasBeenPressednBidNow) {
                        isLayoutFirst = true;
                      } else {
                        isLayoutFirst = false;
                      }
                    });
                  },
                  child: Container(
                    width: 32.r,
                    height: 32.r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 6,
                          blurRadius: 10,
                          offset: const Offset(1, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: SvgPicture.asset(
                        filter,
                        color: _hasBeenPressednBidNow
                            ? orange_ff881a
                            : black_121212,
                        width: 16.w,
                        height: 16.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                )
              ],
            ),
          ),
          Visibility(
            visible: isLayoutFirst,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Filter by",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: black_121212,
                            fontWeight: FontWeight.w800,
                            fontFamily: helvetica_neu_bold),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            strRole = null;
                            stepsController.industryController.value.text = '';
                            stepsController.industryName = null;
                            strCountryName = null;
                            stepsController.strCountryId.value = '';
                            
                            videoController.PageNumber.value = 0;
                            videoController.initScrolling(context, true);
                            checkNet(context).then((value) {
                              videoController.userListAPI(context, true);
                            });
                            isLayoutFirst = false;
                            _hasBeenPressednBidNow = !_hasBeenPressednBidNow;
                          });
                        },
                        child: Text(
                          "Clear filter",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: black_121212,
                              fontFamily: roboto_regular),
                        ),
                      ),
                    ],
                  ),
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
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: grey_f5f5f5,
                          borderRadius: BorderRadius.circular(4.r),
                          // border: Border.all(color: Colors.black,width: 1)
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            buttonPadding: EdgeInsets.only(left: 15.w),
                            hint: Text("Role",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: helveticaNeueNeue_medium,
                                    fontSize: 14.0.sp)),
                            value: strRole,
                            isExpanded: true,
                            icon: Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: SvgPicture.asset(
                                icon_down_arrow_spinner,
                                color: grey_aaaaaa,
                                height: 15.h,
                                width: 15.w,
                              ),
                            ),
                            iconSize: 20.sp,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontFamily: helveticaNeueNeue_medium),
                            onChanged: (String? newValue) {
                              setState(() {
                                strRole = newValue!;
                              });
                            },
                            customItemsHeight: 4,
                            iconEnabledColor: black_121212,
                            iconDisabledColor: Colors.grey,
                            buttonHeight: 60,
                            buttonWidth: double.infinity,
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: grey_f5f5f5,
                            ),
                            itemHeight: 35,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            items: stepsController.countrylist
                                .map((value) {
                              return DropdownMenuItem<String>(
                                value: value.id.toString(),
                                child: Text(value.name.toString(), style: TextStyle(fontSize: 14.sp),),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: grey_f5f5f5,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: stepsController.industryName != null && stepsController.industryName == 'other'
                        ? Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 17.w, right: 17.w),
                            child: Center(
                              child: setTextFieldNext(
                                stepsController.industryController.value,
                                "Enter Industry",
                                false,
                                TextInputType.name,
                                false,
                                "",
                                TextInputAction.next,
                                (val) => {
                                  if(val == ''){
                                    stepsController.industryName = null,
                                    setState((){})
                                  }
                                },
                                () {},
                                false,
                                true
                              ),
                            ),
                          ),
                        )
                        : DropdownButtonHideUnderline(
                        child: DropdownButton2(
                            value: stepsController.industryName,
                            hint: Text("Select Industry",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: helveticaNeueNeue_medium,
                                fontSize: 14.sp
                              ),
                              textAlign: TextAlign.left
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.sp,
                              fontFamily: helveticaNeueNeue_medium
                            ),
                            icon: SvgPicture.asset(
                              icon_down_arrow_spinner,
                              color: grey_aaaaaa,
                              height: 15.h,
                              width: 15.w,
                            ),
                            isExpanded: true,
                            customItemsHeight: 4,
                            iconEnabledColor: black_121212,
                            iconDisabledColor: Colors.grey,
                            // buttonHeight: 60,
                            buttonWidth: double.infinity,
                            buttonPadding: const EdgeInsets.only(left: 14, right: 8),
                            buttonDecoration: EditTextDecoration,
                            itemHeight: 42,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                            onChanged: (String? newValue) {
                              setState(() {
                                stepsController.industryName =
                                    newValue!;
                              });
                            },
                            items: stepsController.dropDownIndustryItems
                        ),
                        )
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: grey_f5f5f5,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      buttonPadding: EdgeInsets.only(left: 15.w),
                      hint: Text("Country",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 14.sp
                        )
                      ),
                      value: strCountryName,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          icon_down_arrow_spinner,
                          color: grey_aaaaaa,
                          height: 15.h,
                          width: 15.w,
                        ),
                      ),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: helveticaNeueNeue_medium),
                      onChanged: (String? newValue) {
                        setState(() {
                          strCountryName = newValue!;
                          stepsController.strCountryId.value = newValue;
                        });
                      },
                      isExpanded: true,
                      customItemsHeight: 4,
                      iconEnabledColor: black_121212,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 60,
                      buttonWidth: double.infinity,
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: grey_f5f5f5,
                      ),
                      itemHeight: 35,
                      itemPadding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                      items: stepsController.countrylist.map((CountryDatum value) {
                        return DropdownMenuItem<String>(
                          value: value.id.toString(),
                          child: Text(value.name!.capitalizeFirst.toString(), style: TextStyle(fontSize: 14.sp),),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: BlackButton("Apply Filter", Colors.white, () {
                    checkNet(context).then((value) {
                      videoController.PageNumber.value = 1;
                      dynamic data = {
                        'page': videoController.PageNumber.value.toString(),
                        'name': videoController.searchController.value.text,
                        'role': strRole.toString(),
                        'industry': stepsController.industryName.toString(),
                        'country': stepsController.strCountryId.value.toString(),
                      };
                      videoController.userListAPI(context, true, null, data);
                    });
                    isLayoutFirst = false;
                    _hasBeenPressednBidNow = !_hasBeenPressednBidNow;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

myFunc(Function myVal) {
  return TextFormField(
    validator: (v) => myVal(v),
  );
}
