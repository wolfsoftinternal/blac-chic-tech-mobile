import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/ReplaceWith.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/AllAdmireList.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../Utils/preference_utils.dart';

class AdmiresGridView extends StatefulWidget {
  final type;
  final crossAxisCount;
  final limit;
  const AdmiresGridView({Key? key, this.type, this.crossAxisCount, this.limit})
      : super(key: key);

  @override
  State<AdmiresGridView> createState() => _AdmiresGridViewState();
}

class _AdmiresGridViewState extends State<AdmiresGridView> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
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
    return Obx(
      () => ReorderableGridView.count(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 0,
        crossAxisCount: widget.crossAxisCount,
        childAspectRatio: widget.crossAxisCount == 3
            ? 0.85.w
            : widget.crossAxisCount == 4
                ? 0.65.w
                : widget.crossAxisCount == 5
                    ? 0.75.w
                    : 0.9.w,
        children: widget.type == 'user'
            ? controller.admireList.map((e) => buildItem(e)).toList()
            : controller.otherAdmireList.map((e) => buildItem(e)).toList(),
        onReorder: (oldIndex, newIndex) {
          if (widget.type == 'user') {
            setState(() {
              final element = controller.admireList.removeAt(oldIndex);
              controller.admireList.insert(newIndex, element);

              checkNet(context).then((value) {
              controller.rearrangeAdmireAPI(
                  context, controller.admireList[newIndex].id ,controller.admireList[oldIndex].number);
              });
            });            
          }
        },
      ),
    );
  }

  Widget buildItem(AdmireList admireList) {
    return Card(
      color: white_ffffff,
      elevation: 0,
      key: ValueKey(admireList),
      child: AllAdmireList(admireList, widget.type, widget.limit, userId)
    );
  }
}