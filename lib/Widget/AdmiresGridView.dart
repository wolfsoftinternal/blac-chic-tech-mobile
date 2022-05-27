import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/Profile.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/ReplaceWith.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

import '../Utils/preference_utils.dart';

class AdmiresGridView extends StatefulWidget {
  final type;
  final crossAxisCount;
  AdmiresGridView({Key? key, this.type, this.crossAxisCount}) : super(key: key);

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
    return ReorderableGridView.count(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      crossAxisSpacing: 10,
      mainAxisSpacing: 12,
      crossAxisCount: widget.crossAxisCount,
      childAspectRatio: widget.crossAxisCount == 3
          ? 0.85
          : widget.crossAxisCount == 4
              ? 0.6
              : widget.crossAxisCount == 5
                  ? 0.75
                  : 0.9,
      children: widget.type == 'user'
          ? controller.admireList.map((e) => buildItem(e)).toList()
          : controller.otherAdmireList.map((e) => buildItem(e)).toList(),
      onReorder: (oldIndex, newIndex) {
        if (widget.type == 'user') {
          setState(() {
            final element = controller.admireList.removeAt(oldIndex);
            controller.admireList.insert(newIndex, element);
          });

          checkNet(context).then((value) {
            controller.rearrangeAdmireAPI(context, newIndex, controller.admireList[newIndex].number);
          });
        }
      },
    );
  }

  Widget buildItem(AdmireList admireList) {
    return Card(
        color: white_ffffff,
        elevation: 0,
        key: ValueKey(admireList),
        child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Obx(
                  () => Column(
                    children: [
                      Stack(
                        children: [
                          widget.type == 'user'
                              ? PopupMenuButton(
                                  position: PopupMenuPosition.under,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: admireList.admireDetails!.image ==
                                            null
                                        ? SvgPicture.asset(
                                            placeholder,
                                            height: 70,
                                            width: 70,
                                          )
                                        : CachedNetworkImage(
                                            imageUrl: admireList
                                                .admireDetails!.image!,
                                            height: 70,
                                            width: 70,
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                SvgPicture.asset(
                                              placeholder,
                                              height: 70,
                                              width: 70,
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    SvgPicture.asset(
                                              placeholder,
                                              height: 70,
                                              width: 70,
                                            ),
                                          ),
                                  ),
                                  onSelected: (i) {
                                    if (i == 1) {
                                      if(userId == admireList.admireDetails!.id){
                                        controller.userProfileAPI(context);
                                      }else{
                                        controller.admireProfileAPI(
                                          context, admireList.admireDetails!.id
                                        );
                                      }
                                    } else if (i == 2) {
                                      Get.to(ReplaceWith(
                                        name: admireList.admireDetails!.firstName,
                                        id: admireList.admireId,
                                        isFrom: 'user',
                                      ));
                                    } else if (i == 3) {
                                      setState(() {
                                        Widget cancelButton = TextButton(
                                          child: Text("Yes"),
                                          onPressed: () {
                                            setState(() {
                                              checkNet(context).then((value) {
                                                controller.admireDeleteAPI(
                                                    context,
                                                    admireList.admireId);
                                              });
                                              Get.back();
                                            });
                                          },
                                        );
                                        Widget continueButton = TextButton(
                                          child: Text("No"),
                                          onPressed: () {
                                            setState(() {
                                              Get.back();
                                            });
                                          },
                                        );

                                        AlertDialog alert = AlertDialog(
                                          content: Text(
                                              "Are you sure you want to delete this admire?"),
                                          actions: [
                                            cancelButton,
                                            continueButton,
                                          ],
                                        );

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alert;
                                          },
                                        );
                                      });
                                    }
                                  },
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                          height: 35,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "View Profile",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 14),
                                              ),
                                              Icon(
                                                Icons.person,
                                                color: orange,
                                              )
                                            ],
                                          ),
                                          value: 1,
                                        ),
                                        PopupMenuItem(
                                          height: 35,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Replace with...",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 14),
                                              ),
                                              Icon(
                                                Icons.repeat,
                                                color: blue_0a84ff,
                                              )
                                            ],
                                          ),
                                          value: 2,
                                        ),
                                        PopupMenuItem(
                                          height: 35,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Remove ${admireList.admireDetails!.firstName != null ? admireList.admireDetails!.firstName : ""}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    fontSize: 14),
                                              ),
                                              Icon(
                                                Icons.close,
                                                color: Colors.red,
                                              )
                                            ],
                                          ),
                                          value: 3,
                                        ),
                                      ])
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: admireList.admireDetails!.image == null
                                      ? SvgPicture.asset(
                                          placeholder,
                                          height: 70,
                                          width: 70,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl:
                                              admireList.admireDetails!.image!,
                                          height: 70,
                                          width: 70,
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              SvgPicture.asset(
                                            placeholder,
                                            height: 70,
                                            width: 70,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              SvgPicture.asset(
                                            placeholder,
                                            height: 70,
                                            width: 70,
                                          ),
                                        ),
                                ),
                          controller.isRearrange.value == true
                              ? Positioned(
                                  right: 3,
                                  top: 2,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Widget cancelButton = TextButton(
                                          child: Text("Yes"),
                                          onPressed: () {
                                            setState(() {
                                              checkNet(context).then((value) {
                                                controller.admireDeleteAPI(
                                                    context,
                                                    admireList.admireId);
                                              });
                                              Get.back();
                                            });
                                          },
                                        );
                                        Widget continueButton = TextButton(
                                          child: Text("No"),
                                          onPressed: () {
                                            setState(() {
                                              Get.back();
                                            });
                                          },
                                        );

                                        AlertDialog alert = AlertDialog(
                                          content: Text(
                                              "Are you sure you want to delete this admire?"),
                                          actions: [
                                            cancelButton,
                                            continueButton,
                                          ],
                                        );

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return alert;
                                          },
                                        );
                                      });
                                    },
                                    child: Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          color: grey_aaaaaa,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          color: white_ffffff,
                                          size: 12,
                                        )),
                                  ),
                                )
                              : Container()
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      setHelceticaBold(
                          admireList.admireDetails!.firstName ?? "",
                          12,
                          black_121212,
                          FontWeight.w500,
                          FontStyle.normal,
                          -0.1),
                      SizedBox(
                        height: 2,
                      ),
                      setHelveticaMedium(
                          admireList.admireDetails!.currentJobs != null
                              ? admireList
                                  .admireDetails!.currentJobs!.companyName!
                              : "",
                          10,
                          grey_aaaaaa,
                          FontWeight.w500,
                          FontStyle.normal,
                          -0.1),
                    ],
                  ),
                ),
              ));
  }
}
