import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';

import '../Styles/my_strings.dart';
import '../Utils/SizeConfig.dart';


class OrangeBoderTextFieldLayout extends StatefulWidget {
 // const OrangeBoderTextFieldLayout({Key? key}) : super(key: key);
  final String label;
  bool enable;
  final TextInputAction InputAction;
  final FocusNode focusNode;
  final TextEditingController controller;

  OrangeBoderTextFieldLayout(this.label,this.enable,this.controller,this.InputAction,this.focusNode, {Key? key}) : super(key: key);

  @override
  _OrangeBoderTextFieldLayoutState createState() => _OrangeBoderTextFieldLayoutState();
}

class _OrangeBoderTextFieldLayoutState extends State<OrangeBoderTextFieldLayout> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(

      padding: const EdgeInsets.symmetric(
          horizontal: 16,vertical: 0
      ),
      width: SizeConfig.screenWidth!,
      decoration: BoxDecoration(
        color: widget.enable ? white_ffffff : light_grey_f2f2f2,
          border: Border.all(
              color: widget.enable ? orange_ff881a : light_grey_f2f2f2,
              width: 1.5
          ),
          borderRadius: BorderRadius.circular(4)
      ),
      child: TextFormField(
        focusNode: widget.focusNode,
        onTap: (){
          setState(() {
            widget.enable = true;
          });
        },
        onChanged: (value){
          setState(() {
            widget.enable = true;
          });
        },
        onEditingComplete: (){
          widget.focusNode.unfocus();
          setState(() {
            widget.enable = false;
          });
        },
        onFieldSubmitted: (value){
          widget.focusNode.unfocus();
          setState(() {
            widget.enable = false;
          });
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 0,color: Colors.transparent),
          ),
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 0,color: Colors.transparent),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 0,color: Colors.transparent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 0,color: Colors.transparent),
          ),
          errorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 0,color: Colors.red),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(width: 0,color: Colors.red),
          ),
          labelText: widget.label,
          labelStyle: const TextStyle(
              fontSize: 14,
              fontFamily: helveticaNeueNeue_medium,
              color: grey_aaaaaa
          ),
          isDense: true,
        ),
        style: const TextStyle(
            fontFamily: helveticaNeueNeue_medium,
            fontSize: 14,
            color: black_121212
        ),
        textInputAction: widget.InputAction,
        keyboardType: widget.label == str_email ? TextInputType.emailAddress : TextInputType.text,
        obscureText: widget.label == str_pwd || widget.label == str_newPwd || widget.label == str_confirmPwd ? true : false ,

      ),
    );
  }
}
