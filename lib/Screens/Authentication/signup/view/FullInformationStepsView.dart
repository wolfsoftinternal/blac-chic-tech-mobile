import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalQueFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/EducationInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/ExperienceInfoFormView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/PersonalInfoFormView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../Layout/CustomScrollPhysics.dart';
import '../../../../Layout/ToolbarBackOnly.dart';
import '../../../../Styles/my_colors.dart';
import '../../../../Widget/Indicator.dart';

class FullInformationStepsView extends StatefulWidget {
  const FullInformationStepsView({Key? key}) : super(key: key);

  @override
  _FullInformationStepsState createState() => _FullInformationStepsState();
}

class _FullInformationStepsState extends State<FullInformationStepsView> {
  final PageController controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  void _pageChanged(int index) {
    // if (index == 1) {}
    setState(() => _currentIndex = index);
    handleIndicatorColor();
  }

  handleIndicatorColor() {
    for (int i = 0; i < indicatorColor.length; i++) {
      if (i <= _currentIndex) {
        indicatorColor[i] = Colors.orange;
      } else {
        indicatorColor[i] = Colors.grey;
      }
    }
    setState(() {});
  }

  List<Color> indicatorColor = [
    orange_ff881a,
    light_grey_f2f2f2,
    light_grey_f2f2f2,
    light_grey_f2f2f2,
    light_grey_f2f2f2
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller.initialPage = 1;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.white, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness:
          Brightness.light, //navigation bar icons' color
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackLayout(),
                  Indicator(
                    controller: controller,
                    itemCount: 5,
                    indicatorColors: indicatorColor,
                  ),
                ],
              ),
            ),
            /*test */

            Expanded(
              flex: 1,
              child: Container(
                // height: double.infinity,
                color: Colors.white,
                child: PageView(

                    // reverse: true,
                    pageSnapping: true,
                    physics: CustomScrollPhysics(),
                    controller: controller,
                    onPageChanged: _pageChanged,
                    children: const <Widget>[
                      PersonalInfoFormView(),
                      ExperienceInfoFormView(),
                      EducationInfoFormView(),
                      AdditionalQueFormView(),
                      AdditionalLastQueView(),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
