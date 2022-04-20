import 'package:blackchecktech/Screens/Authentication/signup/view/FullInformationStepsView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/RegisterInfoView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/SignupFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/SignupInfoView.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
// import 'package:blackchecktech/UIScreen/OwnProfile.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';

import '../Screens/Authentication/login/view/LoginView.dart';
import 'Test.dart';
import '../Welcome.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: white_ffffff,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Welcome(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Welcome Screen",
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: helveticaNeueNeue_medium,
                    fontSize: 16),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterInfoView(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Register Screen",
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: helveticaNeueNeue_medium,
                    fontSize: 16),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupInfoView(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Signup Screen",
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: helveticaNeueNeue_medium,
                    fontSize: 16),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupFormView(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "SignupDetail Screen",
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: helveticaNeueNeue_medium,
                    fontSize: 16),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullInformationStepsView(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "FullInformationSteps Screen",
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: helveticaNeueNeue_medium,
                    fontSize: 16),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Login Screen",
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: helveticaNeueNeue_medium,
                    fontSize: 16),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Test(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Test Screen",
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: helveticaNeueNeue_medium,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
