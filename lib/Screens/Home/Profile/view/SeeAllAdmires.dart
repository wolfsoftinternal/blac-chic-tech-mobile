import 'package:blackchecktech/Layout/ToolbarWithHeaderAction.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Widget/AdmiresGridView.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SeeAllAdmires extends StatefulWidget {
  SeeAllAdmires({Key? key}) : super(key: key);

  @override
  State<SeeAllAdmires> createState() => _SeeAllAdmiresState();
}

class _SeeAllAdmiresState extends State<SeeAllAdmires> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  int _crossAxisCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          ToolbarWithHeaderCenterTitle("Fade Admires"),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if(constraints.maxWidth < 310){
                        _crossAxisCount = 3;
                        return AdmiresGridView(_crossAxisCount);
                      } if (constraints.maxWidth > 310 && constraints.maxWidth < 520) {
                        _crossAxisCount = 4;
                        return AdmiresGridView(_crossAxisCount);
                      } else if (constraints.maxWidth > 520 &&
                          constraints.maxWidth < 720) {
                        _crossAxisCount = 5;
                        return AdmiresGridView(_crossAxisCount);
                      } else {
                        _crossAxisCount = 6;
                        return AdmiresGridView(_crossAxisCount);
                      }
                    },
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
