import 'package:blackchecktech/Layout/BlackButtonDialog.dart';
import 'package:blackchecktech/Layout/Chip.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:get/get.dart';
import 'package:material_tag_editor/tag_editor.dart';

class QuestionsDialog extends StatefulWidget {
  final quesIndex;
  const QuestionsDialog(this.quesIndex);

  @override
  State<QuestionsDialog> createState() => _QuestionsDialogState();
}

class _QuestionsDialogState extends State<QuestionsDialog> {
  StepsController controller = Get.put(StepsController());

  _onDelete(index) {
    setState(() {
      controller.tagValues.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        insetPadding: EdgeInsets.all(20.r),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r)), //this right here
        child: SizedBox(
          height: 360.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // WHAT HAVE YOU DONE ?
              Padding(
                padding: EdgeInsets.only(
                    top: 24.h, bottom: 16.h, left: 24.w, right: 24.w),
                child: Center(
                  child: Text(
                      widget.quesIndex == 'q1'
                          ? SharePreData.strQues1.toUpperCase()
                          : widget.quesIndex == 'q2'
                              ? SharePreData.strQues2.toUpperCase()
                              : widget.quesIndex == 'q3'
                                  ? SharePreData.strQues3.toUpperCase()
                                  : widget.quesIndex == 'q4'
                                      ? SharePreData.strQues4.toUpperCase()
                                      : widget.quesIndex == 'q5'
                                          ? SharePreData.strQues5.toUpperCase()
                                          : widget.quesIndex == 'q6'
                                              ? SharePreData.strQues6
                                                  .toUpperCase()
                                              : widget.quesIndex == 'q7'
                                                  ? SharePreData.strQues7
                                                      .toUpperCase()
                                                  : widget.quesIndex == 'q8'
                                                      ? SharePreData.strQues8
                                                          .toUpperCase()
                                                      : widget.quesIndex == 'q9'
                                                          ? SharePreData
                                                              .strQues9
                                                              .toUpperCase()
                                                          : widget.quesIndex ==
                                                                  'q10'
                                                              ? SharePreData
                                                                  .strQues10
                                                                  .toUpperCase()
                                                              : SharePreData
                                                                  .strQues1
                                                                  .toUpperCase(),
                      style: TextStyle(
                          color: black_121212,
                          fontWeight: FontWeight.w900,
                          fontFamily: helvetica_neu_bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp),
                      textAlign: TextAlign.left),
                ),
              ),

              Container(
                height: 0.7.h,
                color: Colors.black12,
              ),

              widget.quesIndex == 'q4'
                  ? Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 15.h, bottom: 15.h, right: 24.w, left: 24.w),
                        child: TagEditor(
                          length: controller.tagValues.length,
                          hasAddButton: true,
                          resetTextOnSubmitted: true,
                          delimiters: const [',', ' '],
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^[a-z A-Z]+$')),
                          ],
                          textStyle: TextStyle(
                              color: black_121212,
                              fontWeight: FontWeight.w500,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp),
                          inputDecoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Please type here...',
                            hintStyle: TextStyle(
                                color: grey_aaaaaa,
                                fontWeight: FontWeight.w500,
                                fontFamily: helvetica_neu_bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                          ),
                          onTagChanged: (newValue) {
                            setState(() {
                              controller.tagValues.add(newValue);
                            });
                          },
                          onSubmitted: (newValue) {
                            if (newValue.toString() != '') {
                              setState(() {
                                controller.tagValues.add(newValue);
                              });
                            }
                          },
                          tagBuilder: (context, index) => ChipLayout(
                            index: index,
                            label: controller.tagValues[index],
                            onDeleted: _onDelete,
                          ),
                        ),
                      ),
                    )
                  : Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 15.h, bottom: 15.h, right: 24.w, left: 24.w),
                        child: TextFormField(
                          controller: widget.quesIndex == 'q1'
                              ? controller.q1Controller.value
                              : widget.quesIndex == 'q2'
                                  ? controller.q2Controller.value
                                  : widget.quesIndex == 'q3'
                                      ? controller.q3Controller.value
                                      : widget.quesIndex == 'q4'
                                          ? controller.q4Controller.value
                                          : widget.quesIndex == 'q5'
                                              ? controller.q5Controller.value
                                              : widget.quesIndex == 'q6'
                                                  ? controller
                                                      .q6Controller.value
                                                  : widget.quesIndex == 'q7'
                                                      ? controller
                                                          .q7Controller.value
                                                      : widget.quesIndex == 'q8'
                                                          ? controller
                                                              .q8Controller
                                                              .value
                                                          : widget.quesIndex ==
                                                                  'q9'
                                                              ? controller
                                                                  .q9Controller
                                                                  .value
                                                              : widget.quesIndex ==
                                                                      'q10'
                                                                  ? controller
                                                                      .q10Controller
                                                                      .value
                                                                  : controller
                                                                      .q1Controller
                                                                      .value,
                          minLines: 2,
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                          cursorColor: orange_ff881a,
                          style: TextStyle(
                              color: black_121212,
                              fontWeight: FontWeight.w500,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Please type here...',
                            hintStyle: TextStyle(
                                color: grey_aaaaaa,
                                fontWeight: FontWeight.w500,
                                fontFamily: helvetica_neu_bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ),

              Padding(
                padding: EdgeInsets.all(24.r),
                child: BlackButtonDialog("Done", white_ffffff, () {
                  if (widget.quesIndex == 'q1') {
                    if (controller.q1Controller.value.text == '') {
                      controller.ques1.value = SharePreData.strQues1;
                    } else {
                      controller.ques1.value =
                          controller.q1Controller.value.text;
                    }
                  } else if (widget.quesIndex == 'q2') {
                    if (controller.q2Controller.value.text == '') {
                      controller.ques2.value = SharePreData.strQues2;
                    } else {
                      controller.ques2.value =
                          controller.q2Controller.value.text;
                    }
                  } else if (widget.quesIndex == 'q3') {
                    if (controller.q3Controller.value.text == '') {
                      controller.ques3.value = SharePreData.strQues3;
                    } else {
                      controller.ques3.value =
                          controller.q3Controller.value.text;
                    }
                  } else if (widget.quesIndex == 'q4') {
                    if (controller.tagValues != []) {
                      controller.q4Controller.value.text = "";
                      controller.q4Controller.value.text =
                          controller.tagValues.join(', ');
                      controller.ques4.value =
                          controller.q4Controller.value.text;
                    } else {
                      controller.ques4.value = SharePreData.strQues4;
                    }
                  } else if (widget.quesIndex == 'q5') {
                    if (controller.q5Controller.value.text == '') {
                      controller.ques5.value = SharePreData.strQues5;
                    } else {
                      controller.ques5.value =
                          controller.q5Controller.value.text;
                    }
                  }
                  if (widget.quesIndex == 'q6') {
                    if (controller.q6Controller.value.text == '') {
                      controller.ques6.value = SharePreData.strQues6;
                    } else {
                      controller.ques6.value =
                          controller.q6Controller.value.text;
                    }
                  }
                  if (widget.quesIndex == 'q7') {
                    if (controller.q7Controller.value.text == '') {
                      controller.ques7.value = SharePreData.strQues7;
                    } else {
                      controller.ques7.value =
                          controller.q7Controller.value.text;
                    }
                  }
                  if (widget.quesIndex == 'q8') {
                    if (controller.q8Controller.value.text == '') {
                      controller.ques8.value = SharePreData.strQues8;
                    } else {
                      controller.ques8.value =
                          controller.q8Controller.value.text;
                    }
                  }
                  if (widget.quesIndex == 'q9') {
                    if (controller.q9Controller.value.text == '') {
                      controller.ques9.value = SharePreData.strQues9;
                    } else {
                      controller.ques9.value =
                          controller.q9Controller.value.text;
                    }
                  }
                  if (widget.quesIndex == 'q10') {
                    if (controller.q10Controller.value.text == '') {
                      controller.ques10.value = SharePreData.strQues10;
                    } else {
                      controller.ques10.value =
                          controller.q10Controller.value.text;
                    }
                  }

                  Get.back();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
