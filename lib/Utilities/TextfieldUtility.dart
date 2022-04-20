import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';


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
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        style: const TextStyle(
            color:  black_121212,
            fontWeight: FontWeight.w500,
            fontFamily: helveticaNeueNeue_medium,
            fontStyle:  FontStyle.normal,
            fontSize: 15.0
        ),
        decoration: new InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          border: InputBorder.none,

          labelStyle: new TextStyle(
              fontSize: 15.0,  color: Colors.grey,fontFamily: 'Poppins',fontWeight: FontWeight.w600),

          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.7)),
            borderSide: BorderSide(color:grey_aaaaaa, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.7)),
            borderSide: BorderSide(color: black_121212),
          ),
        ),
        keyboardType: inputType,
        cursorColor: black_121212,
        textInputAction: textInputAction,


      )
  );
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
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        style:  TextStyle(
            color: black_121212,
            fontWeight: FontWeight.w500,
            fontFamily: helveticaNeueNeue_medium,
            fontStyle:  FontStyle.normal,
            fontSize: 14.0
        ),
        decoration: new InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: hintText,
          hintStyle: TextStyle(
              color:  grey_aaaaaa,
              fontWeight: FontWeight.w500,
              fontFamily: helveticaNeueNeue_medium,
              fontStyle:  FontStyle.normal,
              fontSize: 14.0
          ),
          border: InputBorder.none,
        ),
        textInputAction: textInputAction,
        keyboardType: inputType,
        cursorColor: black_121212,
      )
  );
}



setTextFieldNext(
    TextEditingController controller,
    String hintText,
    bool secureEntry,
    TextInputType inputType,
    bool validtion,
    String errorMSg,
    TextInputAction textInputAction,
    Function onchange) {
  return Theme(
      data: new ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.red,
      ),
      child: TextField(
        style:  TextStyle(
            color: black_121212,
            fontWeight: FontWeight.w500,
            fontFamily: helveticaNeueNeue_medium,
            fontStyle:  FontStyle.normal,
            fontSize: 14.0
        ),
        decoration: new InputDecoration(
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          hintText: hintText,
          hintStyle: TextStyle(
              color:  grey_aaaaaa,
              fontWeight: FontWeight.w500,
              fontFamily: helveticaNeueNeue_medium,
              fontStyle:  FontStyle.normal,
              fontSize: 14.0
          ),
          border: InputBorder.none,
        ),

        textInputAction: textInputAction,
        keyboardType: inputType,
        cursorColor: black_121212,
      )
  );
}

