import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';


class InputTextStaic extends StatefulWidget {

  final String hintData;
  TextEditingController inputData;
  bool numKeypad = false;
  TextInputType inputType;
  TextInputAction textInputAction;
  // Function validator;

  InputTextStaic(this.hintData,this.inputData,this.numKeypad,this.textInputAction,this.inputType);

  @override
  _InputTextStaicState createState() => _InputTextStaicState(hintData,inputData,numKeypad,textInputAction,inputType);

}

class _InputTextStaicState extends State<InputTextStaic> {

  // AddressController controller = Get.put(AddressController());
  bool checkColor = false;
  bool checkFillColor = true;
  // Function validator;

  String hint = " ";
  late TextEditingController controller ;
  late TextInputAction textInputAction;
  late TextInputType inputType;
  bool numKeypad = false;

  _InputTextStaicState(String hintData,TextEditingController controller,bool numKeypad,TextInputAction textInputAction,
      TextInputType inputType,){
    this.hint = hintData;
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
              padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: 16
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
                  hintStyle: TextStyle(
                      color: black_121212, fontFamily: helveticaNeueNeue_medium,fontSize: 14),
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
        ],
      ),
    );

  }

}

myFunc(Function myVal){
  return TextFormField(
    validator: (v) => myVal(v),
  );

}