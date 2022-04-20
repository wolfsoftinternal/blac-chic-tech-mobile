import 'package:flutter/material.dart';

import '../Layout/BlackNextButton.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_icons.dart';
import '../Styles/my_strings.dart';
import '../Utilities/Constant.dart';


class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: FittedBox(child: Image.asset(img_girl),
                        fit: BoxFit.cover)
                ),
                Image.asset(img_logo,width: 72,height: 72,)
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
                color: white_ffffff,
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // New users: By continuing and signing up for an account, you confirm that you agree to Black Chic Tec
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    style: const TextStyle(
                                        color:  const Color(0xff121212),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Helvetica",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 10.0,
                                      height: 1.5
                                    ),
                                    text: "New users: By continuing and signing up for an account, you confirm that you agree to Black Chic Tech "),
                                TextSpan(
                                    style: const TextStyle(
                                        color:  const Color(0xffff881a),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Helvetica",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 10.0,
                                        height: 1.5
                                    ),
                                    text: "User Agreement,"),
                                TextSpan(
                                    style: const TextStyle(
                                        color:  const Color(0xff121212),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Helvetica",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 10.0,
                                        height: 1.5
                                    ),
                                    text: " and acknowledge that you have read Black Chic Tech "),
                                TextSpan(
                                    style: const TextStyle(
                                        color:  const Color(0xffff881a),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "Helvetica",
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 10.0,
                                        height: 1.5
                                    ),
                                    text: "Privacy Notice."),

                              ]
                          )
                      ),
                      SizedBox(height: 24,),
                      BlackNextButton(str_signup, white_ffffff, (){}),
                      SizedBox(height: 16,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xfff2f2f2),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: // Already have an account
                        Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Center(
                            child: Text(
                                str_already_have_second,
                                style: const TextStyle(
                                    color: black_121212,
                                    fontFamily: helvetica_neu_bold,
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 16.0
                                ),
                                textAlign: TextAlign.left
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
