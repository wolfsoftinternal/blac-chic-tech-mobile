import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

class InputTextLayoutPassword extends StatefulWidget {
  final String hintData;
  TextEditingController inputData;
  bool numKeypad = false;
  TextInputType inputType;
  TextInputAction textInputAction;
  Function(String?) validator;

  InputTextLayoutPassword(
      this.hintData,
      this.inputData,
      this.numKeypad,
      this.textInputAction,
      this.inputType,
      this.validator,
      {Key? key})
      : super(key: key);

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<InputTextLayoutPassword> {
  // AddressController controller = Get.put(AddressController());
  bool checkColor = false;
  bool checkFillColor = true;
  bool _isObscure = true;
  // Function validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: checkColor == true ? orange_ff881a : light_grey_f2f2f2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4.r)),
        color: checkFillColor == false
            ? checkColor == true
                ? Colors.white
                : light_grey_f2f2f2
            : light_grey_f2f2f2,
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: 16.w, right: 5.w, top: 12.h, bottom: 12.h),
        child: TextFormField(
          style:  TextStyle(
              color: black_121212,
              fontFamily: helveticaNeueNeue_medium,
              fontSize: 14.0.sp),
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
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            isDense: true,
            // you can change this with the top text like you want
            labelText: widget.hintData,
            suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  _isObscure ? Icons.visibility_off : Icons.visibility,
                  color: grey_aaaaaa,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
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
          validator: (v) {
            widget.validator != null ? widget.validator(v) : print(v);
          },
          textInputAction: widget.textInputAction,
          controller: widget.inputData,
          obscureText: _isObscure,
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
    );
  }
}

myFunc(Function myVal) {
  return TextFormField(
    validator: (v) => myVal(v),
  );
}
