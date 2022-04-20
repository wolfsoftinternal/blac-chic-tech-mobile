import 'package:blackchecktech/UIScreen/AdditionalQue.dart';
import 'package:blackchecktech/UIScreen/Education.dart';
import 'package:blackchecktech/UIScreen/Experience.dart';
import 'package:blackchecktech/UIScreen/PersonalInformation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pageview_widget_indicator/pageview_widget_indicator.dart';

import '../Layout/ToolbarBackOnly.dart';
import '../Widget/Indicator.dart';


class FullInformationSteps extends StatefulWidget {
  const FullInformationSteps({Key? key}) : super(key: key);



  @override
  _FullInformationStepsState createState() => _FullInformationStepsState();
}

class _FullInformationStepsState extends State<FullInformationSteps> {
  final PageController controller = PageController(initialPage: 200);
  int _currentIndex = 0;

  void _pageChanged(int index) {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:  Colors.white, // navigation bar color
      statusBarColor:  Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackLayout(),

                  Indicator(
                    controller: controller,
                    itemCount: 5,
                  ),
                ],
              ),
            ),



            Expanded(
              flex: 1,
              child: Container(
               // height: double.infinity,
                color: Colors.white,
                child:  PageView(
                  reverse: false,
                    controller: controller,
                    onPageChanged: (index) {
                      setState(() => _currentIndex = index);
                    },
                    children: <Widget>[
                      PersonalInformation(),

                      Experience(),

                      Education(),

                      AdditionalQue(),

                      Container(
                        color: Colors.green,
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
