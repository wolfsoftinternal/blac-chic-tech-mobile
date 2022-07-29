import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/AdmiresGridView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SeeAllAdmires extends StatefulWidget {
  final type;
  final limit;
  const SeeAllAdmires({Key? key, this.type, this.limit}) : super(key: key);

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
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text('ADMIRES',
                      style: TextStyle(
                          color: black_121212,
                          fontWeight: FontWeight.w500,
                          fontFamily: helvetica_neu_bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp),
                      textAlign: TextAlign.center),
                ),
                widget.type == 'user'
                    ? Obx(() => Container(
                      width: 85.w,
                      child: Padding(
                          padding: EdgeInsets.only(right: 6.w),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (controller.isRearrange.value == false) {
                                  controller.isRearrange.value = true;
                                } else {
                                  controller.isRearrange.value = false;
                                }
                              });
                            },
                            child: Text(
                                controller.isRearrange.value == false
                                    ? 'Delete'
                                    : 'Save',
                                style: TextStyle(
                                    color: orange_ff881a,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: helvetica_neu_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.sp),
                                textAlign: TextAlign.center),
                          )),
                    ))
                    : SizedBox(
                        width: 85.r,
                        height: 85.r,
                      )
              ],
            ),
          ),
          widget.limit == 'completed' ?
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 15.0, right: 15.0),
            child: Align(alignment: Alignment.centerLeft, child: setHelceticaBold('Admire Limit', 14, Colors.red, FontWeight.w500, FontStyle.normal)),
          ) : Container(),
          widget.limit == 'completed' ?
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
            child: Align(alignment: Alignment.centerLeft, child: setHelveticaMedium("You've used all 20 admires. Replace one of your\nadmire with ${controller.details.value.fullName}", 14, black, FontWeight.w500, FontStyle.normal)),
          ) : Container(),
          widget.type == 'user'
          ? Padding(
            padding: EdgeInsets.only(top: widget.limit == 'completed' ? 10.0 : 24.0, left: 15.0, right: 15.0),
            child: Align(alignment: Alignment.center, child: setHelveticaMedium("Drag and drop to re-arrange admires", 14, grey_aaaaaa, FontWeight.w500, FontStyle.normal, 0.2)),
          ) : Container(),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 24,bottom: 24),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth < 310) {
                        _crossAxisCount = 3;
                        return AdmiresGridView(
                            crossAxisCount: _crossAxisCount, type: widget.type, limit: widget.limit);
                      }
                      if (constraints.maxWidth > 310 &&
                          constraints.maxWidth < 520) {
                        _crossAxisCount = 4;
                        return AdmiresGridView(
                            crossAxisCount: _crossAxisCount, type: widget.type, limit: widget.limit);
                      } else if (constraints.maxWidth > 520 && 
                          constraints.maxWidth < 720) {
                        _crossAxisCount = 5;
                        return AdmiresGridView(
                            crossAxisCount: _crossAxisCount, type: widget.type, limit: widget.limit);
                      } else {
                        _crossAxisCount = 6;
                        return AdmiresGridView(
                            crossAxisCount: _crossAxisCount, type: widget.type, limit: widget.limit);
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
