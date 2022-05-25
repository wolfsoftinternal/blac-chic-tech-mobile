import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../Styles/my_icons.dart';
import 'BlackButton.dart';


class InputTextStaicFilter extends StatefulWidget {

  final String hintData;
  TextEditingController inputData;
  bool numKeypad = false;
  TextInputType inputType;
  TextInputAction textInputAction;

  // Function validator;

  InputTextStaicFilter(this.hintData,this.inputData,this.numKeypad,this.textInputAction,this.inputType);

  @override
  _InputTextStaicFilterState createState() => _InputTextStaicFilterState(hintData,inputData,numKeypad,textInputAction,inputType);

}

class _InputTextStaicFilterState extends State<InputTextStaicFilter> {

  String? cityValue;
  DateTime dateFrom = DateTime(2022, 01, 01);

  // AddressController controller = Get.put(AddressController());
  bool checkColor = false;
  bool checkFillColor = true;
  bool _hasBeenPressednBidNow = false;

  String? dropdownValue;
  // Function validator;

  String hint = " ";
  late TextEditingController controller ;
  late TextInputAction textInputAction;
  late TextInputType inputType;
  bool numKeypad = false;
  bool isLayoutFirst = false;

  _InputTextStaicFilterState(String hintData,TextEditingController controller,bool numKeypad,TextInputAction textInputAction,
      TextInputType inputType,){
    this.hint = hintData;
    this.controller = controller;
    this.numKeypad = numKeypad;
    this.textInputAction = textInputAction;
    this.inputType = inputType;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: checkFillColor == false?
              checkColor == true?
              orange_ff881a:
              light_grey_f2f2f2:
              light_grey_f2f2f2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: checkFillColor == false
                ? checkColor == true
                ? Colors.white
                : light_grey_f2f2f2
                : light_grey_f2f2f2,
          ),
          child: Row(
            children: [
              SizedBox(width: 8.w,),
              Icon(
                IconlyLight.search,
                color: grey_aaaaaa,
                size: 16.r,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:  EdgeInsets.only(
                      left: 10.w,
                      right: 10.w,
                      top: 16.h,
                      bottom: 16.h
                  ),

                  child: TextFormField(
                    style:  TextStyle(
                        color: black_121212,
                        fontFamily: helveticaNeueNeue_medium,
                        fontSize: 14.0
                    ),
                    keyboardType: inputType ,
                    inputFormatters: [
                      numKeypad== true ? FilteringTextInputFormatter.digitsOnly : FilteringTextInputFormatter.singleLineFormatter ,
                      numKeypad== true ? LengthLimitingTextInputFormatter(10) : LengthLimitingTextInputFormatter(200),
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                      isDense: true,
                      // you can change this with the top text like you want
                      // labelText: hint,
                      // labelStyle: TextStyle(color: grey_aaaaaa,fontFamily: helveticaNeueNeue_medium,fontSize: 14),
                      hintText: hint,
                      hintStyle: TextStyle(
                          color: grey_aaaaaa, fontFamily: helveticaNeueNeue_medium,fontSize: 14),
                      border: InputBorder.none,
                      filled: false,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (value) => validator(value),
                    textInputAction: textInputAction,
                    controller: controller,
                    cursorColor: black_121212,
                    onEditingComplete: (){
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).nextFocus();
                    },
                    onChanged: (inputValue) {
                      if (inputValue.isNotEmpty) {
                        setState(() {
                          checkFillColor = false;
                          checkColor = true;
                        });
                      }
                      else {
                        setState(() {
                          checkFillColor = true;
                        });
                      }
                    },
                    onFieldSubmitted : (String value) {
                      if(value.isNotEmpty){
                        setState(() {
                          checkFillColor = false;
                          checkColor = false;
                        });
                      }
                      else{
                        setState(() {
                          checkFillColor = true;
                        });
                      }
                    },

                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {

                    if(_hasBeenPressednBidNow = !_hasBeenPressednBidNow){
                      isLayoutFirst=true;
                    }else {
                      isLayoutFirst=false;
                    }
                  }
                  );
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
                        Offset(1, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.r),
                    child: SvgPicture.asset(
                      filter,
                      color: _hasBeenPressednBidNow ? orange_ff881a:black_121212,
                      width: 16.w,
                      height: 16.w,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w,)
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
                          fontSize: 15.sp,
                          color: black_121212,
                          fontFamily: helvetica_neu_bold),
                    ),
                    Text(
                      "Clear filter",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: black_121212,
                          fontFamily: roboto_regular),
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
                          padding: EdgeInsets.only(right: 14.w, left: 35.w),
                          margin: EdgeInsets.only(left: 0.w, right: 8.w),
                          decoration: BoxDecoration(
                            color: grey_f5f5f5,
                            borderRadius: BorderRadius.circular(4.r),
                            // border: Border.all(color: Colors.black,width: 1)
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              hint: new Text("City",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontSize: 15.0.sp)),
                              value: cityValue,
                              isExpanded: true,
                              icon: SvgPicture.asset(
                                icon_down_arrow_spinner,
                                color: grey_aaaaaa,
                                height: 15.h,
                                width: 15.w,
                              ),
                              iconSize: 24.sp,
                              elevation: 16,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontFamily: helveticaNeueNeue_medium),
                              // underline: Container(
                              //   height: 2,
                              //   color: Colors.deepPurpleAccent,
                              // ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  cityValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Vadodara',
                                'Mumbai',
                                'Anand'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 15.h, left: 10.w),
                            child: SvgPicture.asset(
                              icon_location,
                              height: 20.h,
                              width: 20.w,
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 14.h, horizontal: 15.w),
                        margin: EdgeInsets.only(left: 8.w, right: 0.w),
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
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                  focusNode: AlwaysDisabledFocusNode(),
                                  decoration: new InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    hintText:
                                    '${dateFrom.day}/${dateFrom.month}/${dateFrom.year}',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.copyWith(
                                      fontSize: 15,
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
                                      fontSize: 15.sp),
                                  onTap: () {
                                    selectDate(context);
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
                height: 12.h,
              ),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 14.w, left: 35.w),
                    decoration: BoxDecoration(
                      color: grey_f5f5f5,
                      borderRadius: BorderRadius.circular(4.r),
                      // border: Border.all(color: Colors.black,width: 1)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: new Text("Type of event",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: helveticaNeueNeue_medium,
                                fontSize: 15.0.sp)),

                        value: dropdownValue,
                        isExpanded: true,
                        icon: SvgPicture.asset(
                          icon_down_arrow_spinner,
                          color: grey_aaaaaa,
                          height: 15.h,
                          width: 15.w,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontFamily: helveticaNeueNeue_medium),
                        // underline: Container(
                        //   height: 2,
                        //   color: Colors.deepPurpleAccent,
                        // ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['CLassic', 'Rock', 'Filmy']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15.h, left: 10.w),
                      child: SvgPicture.asset(
                        icon_ticket,
                        height: 20.h,
                        width: 20.w,
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16.h),
                child: BlackButton("Apply Filter", Colors.white, () {}),
              ),
            ],
          ),
        ),
      ],
    );

  }

  void selectDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2040),
    );
    if (newDate == null) return;
    setState(() => dateFrom = newDate);
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}


myFunc(Function myVal){
  return TextFormField(
    validator: (v) => myVal(v),
  );

}