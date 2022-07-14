import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class InputTextLayout extends StatefulWidget {
  final String hintData;
  TextEditingController controller;
  bool numKeypad = false;
  TextInputType inputType;
  TextInputAction textInputAction;
  Function(String) validator;

  InputTextLayout(this.hintData, this.controller, this.numKeypad,
      this.textInputAction, this.inputType, this.validator);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<InputTextLayout> {
  // AddressController controller = Get.put(AddressController());
  bool checkColor = false;
  bool checkFillColor = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: checkColor == true ? orange_ff881a : grey_f5f5f5,
        ),
        borderRadius:  BorderRadius.all( Radius.circular(4.r)),
        color: checkFillColor == false
            ? checkColor == true
                ? Colors.white
                : grey_f5f5f5
            : grey_f5f5f5,
      ),
      child: Padding(
        padding:
             EdgeInsets.only(left: 16.w, right: 16.w,),
        child: Center(
          child: TextFormField(
            style:  TextStyle(
                color: black_121212,
                fontFamily: helveticaNeueNeue_medium,
                fontSize: 14.sp),
            keyboardType: widget.inputType,
            inputFormatters: [
              widget.numKeypad == true
                  ? FilteringTextInputFormatter.digitsOnly
                  : FilteringTextInputFormatter.singleLineFormatter,
              widget.numKeypad == true
                  ? LengthLimitingTextInputFormatter(10)
                  : LengthLimitingTextInputFormatter(200),
            ],
            decoration: InputDecoration(
              contentPadding:  EdgeInsets.zero,
              isDense: true,
              // you can change this with the top text like you want
              labelText: widget.hintData,
              labelStyle:  TextStyle(
                  color: grey_aaaaaa,
                  fontFamily: helveticaNeueNeue_medium,
                  fontSize: 14.sp),
              hintStyle:  TextStyle(
                  color: black_121212,
                  fontFamily: helveticaNeueNeue_medium,
                  fontSize: 14.sp),
              border: InputBorder.none,
              filled: false,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => widget.validator(value!),
            textInputAction: widget.textInputAction,
            controller: widget.controller,
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
                  checkColor = false;
                });
              }
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
    );
  }
}

myFunc(Function myVal) {
  return TextFormField(
    validator: (v) => myVal(v),
  );
}