import 'package:flutter/material.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_height.dart';
import '../Utilities/TextUtilities.dart';

class CommonElevatedButtonSecond extends StatelessWidget {

  //String to be displayed
  String inputText;
  //button background color
  var buttonColor;
  //text color
  var textColor;
  VoidCallback onCustomButtonPressed;

  CommonElevatedButtonSecond(this.inputText,this.textColor,this.buttonColor, this.onCustomButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
          BoxShadow(
          color: Color(0x17747796).withOpacity(0.07),
      spreadRadius: 10,
      blurRadius: 10,
      offset: Offset(0, 20), // changes position of shadow
    ),
    ]
      ),
      child: SizedBox(
        width: double.infinity,
        height: HeightData.sixty,
        child: ElevatedButton(
            child: //
            setBoldSfProDisplayTextAlign(
                inputText,
                16,
                textColor,
                FontWeight.w500,
                FontStyle.normal,
                TextAlign.center), // Button
            onPressed: onCustomButtonPressed,
            style: ElevatedButton.styleFrom(
              primary: buttonColor,
              onPrimary: Colors.white,
              elevation: 0,
              padding:
              EdgeInsets.symmetric(horizontal: 0, vertical: 21),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: skygreen_24d39e, width: 0),
              ),
            )),
      ),
    );
  }

}
