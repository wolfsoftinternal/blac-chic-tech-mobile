
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

setTextFieldWithBorder(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    TextInputAction textInputAction,
    Function onchange) {
  return Theme(
      data: ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        style: const TextStyle(
            color: black_121212,
            fontWeight: FontWeight.w500,
            fontFamily: helveticaNeueNeue_medium,
            fontStyle: FontStyle.normal,
            fontSize: 15.0),
        decoration: const InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          border: InputBorder.none,

          labelStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600),

          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.7)),
            borderSide: BorderSide(color: grey_aaaaaa, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.7)),
            borderSide: BorderSide(color: black_121212),
          ),
        ),
        keyboardType: inputType,
        cursorColor: black_121212,
        textInputAction: textInputAction,
      ));
}

setTextFieldHelveticaMedium(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    TextInputAction textInputAction,
    Function onchange) {
  return Theme(
      data: ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        style: const TextStyle(
            color: black_121212,
            fontWeight: FontWeight.w500,
            fontFamily: helveticaNeueNeue_medium,
            fontStyle: FontStyle.normal,
            fontSize: 14.0),
        decoration: InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: grey_aaaaaa,
              fontWeight: FontWeight.w500,
              fontFamily: helveticaNeueNeue_medium,
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
          border: InputBorder.none,
        ),
        textInputAction: textInputAction,
        keyboardType: inputType,
        cursorColor: black_121212,
      ));
}

setTextFieldHelveticaMediumBorder(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    TextInputAction textInputAction,
    Function onchange,
    [int? max]) {
  return Theme(
      data: ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
            color: black_121212,
            fontWeight: FontWeight.w500,
            fontFamily: helveticaNeueNeue_medium,
            fontStyle: FontStyle.normal,
            fontSize: 14.sp),
        maxLines: max,
        minLines: 1,
        decoration: InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: hintText,
          hintStyle: TextStyle(
              color: grey_aaaaaa,
              fontWeight: FontWeight.w500,
              fontFamily: helveticaNeueNeue_medium,
              fontStyle: FontStyle.normal,
              fontSize: 14.sp),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.7)),
            borderSide: BorderSide(color:grey_e8e8e8, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.7)),
            borderSide: BorderSide(color: grey_e8e8e8),
          ),
        ),
        textInputAction: textInputAction,
        keyboardType: inputType,
        cursorColor: black_121212,
      ));
}

setTextFieldHelveticaMediumOrangeBorder(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    TextInputAction textInputAction,
    Function onchange,
    String? Function(String? val)? validator,
    bool readonly,
    [Function()? onTap]) {
  return Theme(
      data: ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
            color: black_121212,
            fontWeight: FontWeight.w500,
            fontFamily: helvetica_neu_bold,
            fontStyle: FontStyle.normal,
            fontSize: 14.sp),
        validator: validator,
        readOnly: readonly,
        decoration: InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: hintText,
          hintStyle: TextStyle(
              color: grey_aaaaaa,
              fontWeight: FontWeight.w500,
              fontFamily: helvetica_neu_bold,
              fontStyle: FontStyle.normal,
              fontSize: 14.sp),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.7)),
            borderSide: BorderSide(color: grey_e8e8e8, width: 1),
          ),
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.7)),
            borderSide: BorderSide(color:grey_e8e8e8, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.7)),
            borderSide: BorderSide(color: orange_ff881a),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.7)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        textInputAction: textInputAction,
        keyboardType: inputType,
        cursorColor: black_121212,
        onTap: onTap,
      ));
}

setTextFieldNext(
  TextEditingController controller,
  String hintText,
  bool secureEntry,
  TextInputType inputType,
  bool validtion,
  String errorMSg,
  TextInputAction textInputAction,
  Function onchange,
  Function()? ontap, [
  bool read = false,
]) {
  return Theme(
      data: ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextFormField(
        controller: controller,
        readOnly: read,
        onTap: ontap,
        style: TextStyle(
            color: black_121212,
            fontWeight: FontWeight.w500,
            fontFamily: helveticaNeueNeue_medium,
            fontStyle: FontStyle.normal,
            fontSize: 14.sp),
        decoration: InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: hintText,
          hintStyle: TextStyle(
              color: grey_aaaaaa,
              fontWeight: FontWeight.w500,
              fontFamily: helveticaNeueNeue_medium,
              fontStyle: FontStyle.normal,
              fontSize: 14.sp),
          border: InputBorder.none,
        ),
        textInputAction: textInputAction,
        keyboardType: inputType,
        cursorColor: black_121212,
      ));
}

setDobTextFieldNext(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    TextInputAction textInputAction,
    Function onchange,
    dynamic tap,) {
  return Theme(
      data: ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        readOnly: true,
        controller: controller,
        onTap: tap,
        // onChanged: onchange(),
        style: TextStyle(
            color: black_121212,
            fontWeight: FontWeight.w500,
            fontFamily: helveticaNeueNeue_medium,
            fontStyle: FontStyle.normal,
            fontSize: 14.sp),
        decoration: InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: hintText,
          hintStyle: TextStyle(
              color: grey_aaaaaa,
              fontWeight: FontWeight.w500,
              fontFamily: helveticaNeueNeue_medium,
              fontStyle: FontStyle.normal,
              fontSize: 14.sp),
          border: InputBorder.none,

        ),

        textInputAction: textInputAction,
        keyboardType: inputType,
        cursorColor: black_121212,
      ));
}

setSocialTextFieldNext(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    TextInputAction textInputAction,
    Function onchange,
    dynamic icon) {
  return Theme(
      data: ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
            color: black_121212,
            fontWeight: FontWeight.w500,
            fontFamily: helveticaNeueNeue_medium,
            fontStyle: FontStyle.normal,
            fontSize: 14.sp),
        decoration: InputDecoration(
          prefixIconConstraints:
               BoxConstraints(maxHeight: 21.h, maxWidth: 38.w),
          prefixIcon: Padding(
            padding:  EdgeInsets.only(right: 17.w),
            child: Image.asset(
              icon,
            ),
          ),
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: hintText,
          hintStyle: TextStyle(
              color: grey_aaaaaa,
              fontWeight: FontWeight.w500,
              fontFamily: helveticaNeueNeue_medium,
              fontStyle: FontStyle.normal,
              fontSize: 14.sp),
          border: InputBorder.none,
        ),
        textInputAction: textInputAction,
        keyboardType: inputType,
        cursorColor: black_121212,
      ));
}

setTextField(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    TextInputAction textInputAction,
    Function(String)? onchange) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: grey_aaaaaa),
      borderRadius: const BorderRadius.all(Radius.circular(4)),
      color: Colors.white,
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 13, bottom: 12),
      child: TextField(
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: inputType,
        style: const TextStyle(
            color: black_121212,
            fontFamily: helveticaNeueNeue_medium,
            fontSize: 14.0),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          isDense: true,
          // you can change this with the top text like you want
          labelText: hintText,
          labelStyle: const TextStyle(
              color: grey_aaaaaa,
              fontFamily: helveticaNeueNeue_medium,
              fontSize: 14),
          hintStyle: const TextStyle(
              color: black_121212,
              fontFamily: helveticaNeueNeue_medium,
              fontSize: 14),
          border: InputBorder.none,
          filled: false,
        ),
        cursorColor: black_121212,
        onSubmitted: onchange,
        // onChanged: onchange,
      ),
    ),
  );
}
