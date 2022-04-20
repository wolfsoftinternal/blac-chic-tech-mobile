import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Layout/BlackNextButton.dart';
import '../Layout/InputTextLayout.dart';
import '../Layout/InputTextLayoutPassword.dart';
import '../Styles/my_icons.dart';
import '../Styles/my_strings.dart';
import '../Widget/OrangeBoderTextFieldLayout.dart';

class SignupDetail extends StatefulWidget {
  const SignupDetail({Key? key}) : super(key: key);

  @override
  _SignupDetailState createState() => _SignupDetailState();
}

class _SignupDetailState extends State<SignupDetail> {
  var _firstnameController = TextEditingController();
  var _lastnameController = TextEditingController();
  var _usernameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          BackLayout(),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    // Let’s get started
                    Center(
                      child: Text(str_lets,
                          style: TextStyle(
                              color: black_121212,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 24.0),
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // Tell us a little bit about yourself to create your account.
                    Center(
                      child: Text(str_tell_us,
                          style: TextStyle(
                              color: grey_aaaaaa,
                              fontFamily: helveticaNeueNeue_medium,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0,
                              height: 1.2),
                          textAlign: TextAlign.center),
                    ),

                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                            child: InputTextLayout(
                                str_first_name,
                                _firstnameController,
                                false,
                                TextInputAction.next,
                                TextInputType.text)),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: InputTextLayout(
                                str_last_name,
                                _lastnameController,
                                false,
                                TextInputAction.next,
                                TextInputType.text)),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    InputTextLayout(str_username, _usernameController, false,
                        TextInputAction.next, TextInputType.text),
                    SizedBox(
                      height: 16,
                    ),
                    InputTextLayout(str_email, _emailController, false,
                        TextInputAction.next, TextInputType.emailAddress),
                    SizedBox(
                      height: 16,
                    ),
                    InputTextLayoutPassword(str_pwd, _passwordController, false,
                        TextInputAction.next, TextInputType.text),
                    SizedBox(
                      height: 16,
                    ),
                    InputTextLayoutPassword(
                        str_confirmPwd,
                        _confirmpasswordController,
                        false,
                        TextInputAction.done,
                        TextInputType.text),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          icon_info,
                          width: 15,
                          height: 15,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        setHelveticaMedium(
                            "Some of the items is out of stock. Wanna replace it ? \nwe will suggest you the preferred item.",
                            10,
                            grey_aaaaaa,
                            FontWeight.w500,
                            FontStyle.normal)
                      ],
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    BlackNextButton(
                      str_signup,
                      white_ffffff,
                      () => DialogUtils.showCustomDialog(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)), //this right here
            child: Container(
              height: 290,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      img_varification,
                      width: 120,
                      height: 97,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    // We Sent You An Email
                    Text(str_we_have,
                        style: TextStyle(
                            color: black_121212,
                            fontFamily: helvetica_neu_bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 12,
                    ),
                    // Tap on the email link to activate your account.
                    Text(str_tap_on,
                        style: TextStyle(
                            color: grey_aaaaaa,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0,
                            height: 1.5),
                        textAlign: TextAlign.center)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
