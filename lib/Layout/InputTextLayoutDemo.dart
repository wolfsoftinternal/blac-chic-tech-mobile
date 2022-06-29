import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class InputTextLayoutDemo extends StatefulWidget {

  final String hintData;
  TextEditingController inputData;
  bool numKeypad = false;
  TextInputType inputType;
  TextInputAction textInputAction;
  bool readonly=false;
  dynamic suffix;
  // Function validator;

  InputTextLayoutDemo(this.hintData,this.inputData,this.numKeypad,this.textInputAction,this.inputType, this.readonly, [this.suffix]);

  @override
  _TextInputState createState() => _TextInputState(hintData,inputData,numKeypad,textInputAction,inputType);

}

class _TextInputState extends State<InputTextLayoutDemo> {

 // AddressController controller = Get.put(AddressController());
  bool checkColor = false;
  bool checkFillColor = true;
  // Function validator;

  String hint = " ";
   late TextEditingController controller ;
  late TextInputAction textInputAction;
  late TextInputType inputType;
  bool numKeypad = false;

  _TextInputState(String hintData,TextEditingController controller,bool numKeypad,TextInputAction textInputAction,
      TextInputType inputType,){
    hint = hintData;
    this.controller = controller;
    this.numKeypad = numKeypad;
    this.textInputAction = textInputAction;
    this.inputType = inputType;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color:checkFillColor == false?
          checkColor == true?
          orange_ff881a:
          light_grey_f2f2f2:
          light_grey_f2f2f2,
        ),
        borderRadius:  BorderRadius.all(Radius.circular(4.r)),
        color: checkFillColor == false
            ? checkColor == true
            ? Colors.white
            : light_grey_f2f2f2
            : light_grey_f2f2f2,
      ),
      child: Padding(
        padding:  EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 8.h,
            bottom: 7.h
        ),
        child: TextFormField(
          style:   TextStyle(
              color: black_121212,
              fontFamily: helveticaNeueNeue_medium,
              fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          keyboardType: inputType ,
          readOnly: widget.readonly,
          inputFormatters: [
            numKeypad== true ? FilteringTextInputFormatter.digitsOnly : FilteringTextInputFormatter.singleLineFormatter ,
            numKeypad== true ? LengthLimitingTextInputFormatter(10) : LengthLimitingTextInputFormatter(200),
          ],
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            isDense: true,
            // you can change this with the top text like you want
            labelText: hint,
            labelStyle: const TextStyle(color: grey_aaaaaa,fontFamily: helveticaNeueNeue_medium,fontSize: 14),
            hintStyle:  TextStyle(
                color: black_121212, fontFamily: helveticaNeueNeue_medium,fontSize: 14.sp),
            border: InputBorder.none,
            filled: false,
            suffix: widget.suffix, 
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
    );

  }

}

myFunc(Function myVal){
  return TextFormField(
    validator: (v) => myVal(v),
  );

}