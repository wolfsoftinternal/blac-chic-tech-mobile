import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/AdmiresGridView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SeeAllAdmires extends StatefulWidget {
  final type;
  const SeeAllAdmires({Key? key, this.type}) : super(key: key);

  @override
  State<SeeAllAdmires> createState() => _SeeAllAdmiresState();
}

class _SeeAllAdmiresState extends State<SeeAllAdmires> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  int _crossAxisCount = 0;
  int userId = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    var preferences = MySharedPref();
    SignupModel? myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    userId = myModel!.data!.id!.toInt();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Column(
        children: [
           SizedBox(
            height: 60.h,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackLayout(),
                Text('ADMIRES',
                    style: TextStyle(
                        color: black_121212,
                        fontWeight: FontWeight.w500,
                        fontFamily: helvetica_neu_bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.sp),
                    textAlign: TextAlign.center),
                Obx(
                  () => Padding(
                      padding:  EdgeInsets.only(right: 6.w),
                      child: widget.type == 'user'
                          ? InkWell(
                              onTap: () {
                                  if (controller.isRearrange.value == false) {
                                    controller.isRearrange.value = true;
                                  } else {
                                    controller.isRearrange.value = false;
                                  }
                              },
                              child: Text(
                                  controller.isRearrange.value == false
                                      ? 'Rearrange'
                                      : 'Save',
                                  style: TextStyle(
                                      color: orange_ff881a,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helvetica_neu_bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.sp),
                                  textAlign: TextAlign.center),
                            )
                          : SizedBox(
                              width: 48.r,
                              height: 48.r,
                            )),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                  padding:  EdgeInsets.all(24.r),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 310) {
                        _crossAxisCount = 3;
                        return AdmiresGridView(
                            crossAxisCount: _crossAxisCount, type: widget.type);
                      }
                      if (constraints.maxWidth > 310 &&
                          constraints.maxWidth < 520) {
                        _crossAxisCount = 4;
                        return AdmiresGridView(
                            crossAxisCount: _crossAxisCount, type: widget.type);
                      } else if (constraints.maxWidth > 520 &&
                          constraints.maxWidth < 720) {
                        _crossAxisCount = 5;
                        return AdmiresGridView(
                            crossAxisCount: _crossAxisCount, type: widget.type);
                      } else {
                        _crossAxisCount = 6;
                        return AdmiresGridView(
                            crossAxisCount: _crossAxisCount, type: widget.type);
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
