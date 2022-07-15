import 'package:blackchecktech/Screens/Authentication/signup/model/CityListModel.dart';
import 'package:blackchecktech/Screens/Home/Event/controller/EventDetailController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

import '../Styles/my_icons.dart';
import 'BlackButton.dart';

class InputTextStaicFilter extends StatefulWidget {
  final String hintData;
  TextEditingController inputData;
  bool numKeypad = false;
  TextInputType inputType;
  TextInputAction textInputAction;

  // Function validator;

  InputTextStaicFilter(this.hintData, this.inputData, this.numKeypad,
      this.textInputAction, this.inputType);

  @override
  _InputTextStaicFilterState createState() => _InputTextStaicFilterState(
      hintData, inputData, numKeypad, textInputAction, inputType);
}

class _InputTextStaicFilterState extends State<InputTextStaicFilter> {
  EventDetailController eventDetailController =
      Get.put(EventDetailController());
  String? strCityName;
  String? strType;
  String? strDate = '';

  bool checkColor = false;
  bool checkFillColor = true;
  bool _hasBeenPressednBidNow = false;

  String? dropdownValue;
  // Function validator;

  String hint = " ";
  late TextEditingController controller;
  late TextInputAction textInputAction;
  late TextInputType inputType;
  bool numKeypad = false;
  bool isLayoutFirst = false;

  _InputTextStaicFilterState(
    String hintData,
    TextEditingController controller,
    bool numKeypad,
    TextInputAction textInputAction,
    TextInputType inputType,
  ) {
    hint = hintData;
    this.controller = controller;
    this.numKeypad = numKeypad;
    this.textInputAction = textInputAction;
    this.inputType = inputType;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventDetailController.initScrolling(context);
  }

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
                    padding: EdgeInsets.only(
                        left: 10.w, right: 10.w, top: 16.h, bottom: 16.h),
                    child: TextFormField(
                      controller: eventDetailController.searchController.value,
                      style: const TextStyle(
                          color: black_121212,
                          fontFamily: helveticaNeueNeue_medium,
                          fontSize: 14.0),
                      keyboardType: inputType,
                      inputFormatters: [
                        numKeypad == true
                            ? FilteringTextInputFormatter.digitsOnly
                            : FilteringTextInputFormatter.singleLineFormatter,
                        numKeypad == true
                            ? LengthLimitingTextInputFormatter(10)
                            : LengthLimitingTextInputFormatter(200),
                      ],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        isDense: true,
                        // you can change this with the top text like you want
                        // labelText: hint,
                        // labelStyle: TextStyle(color: grey_aaaaaa,fontFamily: helveticaNeueNeue_medium,fontSize: 14),
                        hintText: hint,
                        hintStyle: const TextStyle(
                            color: grey_aaaaaa,
                            fontFamily: helveticaNeueNeue_medium,
                            fontSize: 14),
                        border: InputBorder.none,
                        filled: false,
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: (value) => validator(value),
                      textInputAction: textInputAction,
                      cursorColor: black_121212,
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context).nextFocus();
                      },
                      onChanged: (inputValue) {
                        if (inputValue.isNotEmpty) {
                          setState(() {
                            checkFillColor = false;
                            checkColor = true;
                          });
                        } else {
                          setState(() {
                            checkFillColor = true;
                          });
                        }

                        checkNet(context).then((value) {
                          eventDetailController.pageNumber.value = 0;
                          eventDetailController.pageNumber =
                              eventDetailController.pageNumber + 1;
                          String type = '';
                          if (strType != null) {
                            if (strType == 'Free') {
                              type = 'free';
                            } else if (strType == 'Ticket') {
                              type = 'ticket_price';
                            } else {
                              type = 'invite_only';
                            }
                          }

                          eventDetailController.pageNumber.value = 0;
                          eventDetailController.pageNumber =
                              eventDetailController.pageNumber + 1;
                          dynamic body = {
                            'page': eventDetailController.pageNumber.toString(),
                            'event_type': 'upcoming',
                            'name': eventDetailController
                                .searchController.value.text,
                            'city': eventDetailController.strCityId.value,
                            'date': strDate.toString(),
                            'type': type.toString()
                          };
                          eventDetailController.allEventListApi(body);
                        });
                      },
                      onFieldSubmitted: (String value) {
                        if (value.isNotEmpty) {
                          setState(() {
                            checkFillColor = false;
                            checkColor = false;
                          });
                        } else {
                          setState(() {
                            checkFillColor = true;
                          });
                        }
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
                          offset:
                              const Offset(1, 4), // changes position of shadow
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
                            strCityName = null;
                            eventDetailController.strCityId.value = '';
                            eventDetailController.dateController.value.text =
                                '';
                            strType = null;
                            strDate = '';
                            eventDetailController.pageNumber.value = 0;
                            if (eventDetailController
                                    .searchController.value.text ==
                                '') {
                              checkNet(context).then((value) {
                                eventDetailController.pageNumber =
                                    eventDetailController.pageNumber + 1;
                                dynamic body = {
                                  'page': eventDetailController.pageNumber
                                      .toString(),
                                  'event_type': 'upcoming',
                                };
                                eventDetailController.initScrolling(context);
                                eventDetailController.allEventListApi(body);
                              });
                            } else {
                              eventDetailController.pageNumber =
                                  eventDetailController.pageNumber + 1;
                              dynamic body = {
                                'page':
                                    eventDetailController.pageNumber.toString(),
                                'name': eventDetailController
                                    .searchController.value.text,
                                'event_type': 'upcoming',
                              };
                              eventDetailController.initScrolling(context);
                              checkNet(context).then((value) {
                                eventDetailController.allEventListApi(body);
                              });
                            }
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
                      child: Stack(
                        children: [
                          Container(
                            height: 36.h,
                            decoration: BoxDecoration(
                              color: grey_f5f5f5,
                              borderRadius: BorderRadius.circular(4.r),
                              // border: Border.all(color: Colors.black,width: 1)
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                buttonPadding: EdgeInsets.only(left: 36.5.w),
                                hint: Text("City",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontSize: 14.0.sp)),
                                value: strCityName,
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
                                // underline: Container(
                                //   height: 2,
                                //   color: Colors.deepPurpleAccent,
                                // ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    strCityName = newValue!;
                                    eventDetailController.strCityId.value =
                                        newValue;
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
                                items: eventDetailController.cityList
                                    .map((CityDatum value) {
                                  return DropdownMenuItem<String>(
                                    value: value.id.toString(),
                                    child: Text(value.name.toString(), style: TextStyle(fontSize: 14.sp),),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 12, left: 16.w),
                              child: SvgPicture.asset(
                                icon_location,
                                height: 12.h,
                                width: 12.w,
                              )),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          height: 36.h,
                          padding: EdgeInsets.only(right: 8.w, left: 16.w),
                          margin: EdgeInsets.only(left: 3.5.w, right: 0.w),
                          decoration: BoxDecoration(
                            color: grey_f5f5f5,
                            borderRadius: BorderRadius.circular(4.r),
                            // border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SvgPicture.asset(
                                icon_calendar,
                                height: 12.h,
                                width: 12.w,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                flex: 1,
                                child: TextField(
                                    controller: eventDetailController
                                        .dateController.value,
                                    focusNode: AlwaysDisabledFocusNode(),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                      hintText: 'Date',
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.copyWith(
                                            fontSize: 14.sp,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            color: Colors.black,
                                          ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontSize: 14.sp),
                                    onTap: () {
                                      selectDate();
                                    }),
                              ),
                              SvgPicture.asset(
                                icon_down_arrow_spinner,
                                color: grey_aaaaaa,
                                height: 15.h,
                                width: 15.w,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Stack(
                  children: [
                    Container(
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: grey_f5f5f5,
                        borderRadius: BorderRadius.circular(4.r),
                        // border: Border.all(color: Colors.black,width: 1)
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          buttonPadding: const EdgeInsets.only(left: 36.0),
                          hint: Text("Type of event",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: helveticaNeueNeue_medium,
                                  fontSize: 14.sp)),

                          value: strType,
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
                          // underline: Container(
                          //   height: 2,
                          //   color: Colors.deepPurpleAccent,
                          // ),
                          onChanged: (String? newValue) {
                            setState(() {
                              strType = newValue!;
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
                          items: <String>['Ticket', 'Invite', 'Free']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: EdgeInsets.zero,
                                child: Text(
                                  value,
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 12.h, left: 16.w),
                        child: SvgPicture.asset(
                          icon_ticket,
                          height: 12.h,
                          width: 12.w,
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: BlackButton("Apply Filter", Colors.white, () {
                    String type = '';
                    if (strType != null) {
                      if (strType == 'Free') {
                        type = 'free';
                      } else if (strType == 'Ticket') {
                        type = 'ticket_price';
                      } else {
                        type = 'invite_only';
                      }
                    }
                    checkNet(context).then((value) {
                      eventDetailController.pageNumber.value = 0;
                      eventDetailController.pageNumber =
                          eventDetailController.pageNumber + 1;
                      dynamic body = {
                        'page': eventDetailController.pageNumber.toString(),
                        'name':
                            eventDetailController.searchController.value.text,
                        'city': eventDetailController.strCityId.value,
                        'date': strDate.toString(),
                        'type': type.toString(),
                        'event_type': 'upcoming',
                      };
                      eventDetailController.allEventListApi(body);
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
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formattedDate = formatter.format(pickedDate!);

    eventDetailController.dateController.value.text = formattedDate;
    strDate =
        eventDetailController.dateController.value.text.replaceAll('/', '-');
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
