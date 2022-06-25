import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';



class BlackNextButton extends StatelessWidget {

  //String to be displayed
  String inputText;
  //button background color
 // var buttonColor;
  //text color
  var textColor;
  var size;
  VoidCallback onCustomButtonPressed;

  BlackNextButton(this.inputText,this.textColor, this.onCustomButtonPressed, [this.size]);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000).withOpacity(0.25),
            offset:  Offset(
              10.0,
              8.0,
            ),
            blurRadius: 25.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        //height: HeightData.fiftyfive,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ Color(0xff1c2535),  Color(0xff04080f)],
              stops: [0.0, 1.0],
            ),
          ),
          child: ElevatedButton(
              child: //
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // setHelveticaBoldCenter(
                      //     inputText,
                      //     16,
                      //     textColor,
                      //     FontWeight.normal,
                      //     FontStyle.normal,
                      //     TextAlign.center),

                      Text(inputText,
                        style: TextStyle(
                        fontFamily: helvetica_neu_bold,
                        fontSize: 16.sp
                      ),
                      ),



                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: 16.w),
                    child: SvgPicture.asset(icon_next_arrow,width: 16.r,height: 16.r,),
                  )
                ],
              ), // Button
              onPressed: onCustomButtonPressed,
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                onSurface: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.only(top: 17.5, bottom: 17.5),
                // EdgeInsets.symmetric(horizontal: 0, vertical: size ?? 21),
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
