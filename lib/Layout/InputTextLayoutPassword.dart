import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class InputTextLayoutPassword extends StatefulWidget {

  final String hintData;
  TextEditingController inputData;
  bool numKeypad = false;
  TextInputType inputType;
  TextInputAction textInputAction;
  // Function validator;

  InputTextLayoutPassword(this.hintData,this.inputData,this.numKeypad,this.textInputAction,this.inputType);

  @override
  _TextInputState createState() => _TextInputState(hintData,inputData,numKeypad,textInputAction,inputType);

}

class _TextInputState extends State<InputTextLayoutPassword> {

 // AddressController controller = Get.put(AddressController());
  bool checkColor = false;
  bool checkFillColor = true;
  bool _isObscure = true;
  // Function validator;

  String hint = " ";
   late TextEditingController controller ;
  late TextInputAction textInputAction;
  late TextInputType inputType;
  bool numKeypad = false;

  _TextInputState(String hintData,TextEditingController controller,bool numKeypad,TextInputAction textInputAction,
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
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color:checkColor == true? orange_ff881a: light_grey_f2f2f2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: checkFillColor == false
            ? checkColor == true
            ? Colors.white
            : light_grey_f2f2f2
            : light_grey_f2f2f2,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 5,
          top: 12,
            bottom: 12
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
            labelText: hint,
            suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  _isObscure ?  Icons.visibility_off:Icons.visibility,color: grey_aaaaaa,),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
            labelStyle: TextStyle(color: grey_aaaaaa,fontFamily: helveticaNeueNeue_medium,fontSize: 14),
            hintStyle: TextStyle(
                color: black_121212, fontFamily: helveticaNeueNeue_medium,fontSize: 14),
            border: InputBorder.none,
            filled: false,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // validator: (value) => validator(value),
          textInputAction: textInputAction,
          controller: controller,
          obscureText: _isObscure,
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