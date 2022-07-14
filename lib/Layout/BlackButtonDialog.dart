import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';

import '../Styles/my_height.dart';


class BlackButtonDialog extends StatelessWidget {

  //String to be displayed
  String inputText;
  //button background color
 // var buttonColor;
  //text color
  var textColor;
  VoidCallback onCustomButtonPressed;

  BlackButtonDialog(this.inputText,this.textColor, this.onCustomButtonPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0x17747796).withOpacity(0.07),
              spreadRadius: 10,
              blurRadius: 5,
              offset: const Offset(0, 10), // changes position of shadow
            ),
          ]
      ),
      child: SizedBox(
        width: double.infinity,
        height: HeightData.fiftyfive,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ Color.fromARGB(255, 36, 48, 69),  Color(0xff04080f)],
              stops: [0.0, 1.0],
            ),
          ),
          child: ElevatedButton(
              child: //

                  Text(inputText,
                    style: const TextStyle(
                    fontFamily: helvetica_neu_bold,
                    fontSize: 16
                  ),
                  ),


              // Button
              onPressed: onCustomButtonPressed,
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onSurface: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
                padding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: black_121212, width: 0),
                ),
              )),
        ),
      ),
    );
  }

}
