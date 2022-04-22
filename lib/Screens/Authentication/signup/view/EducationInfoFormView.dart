import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Styles/my_height.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utilities/TextfieldUtility.dart';
import '../../../../Widget/EditTextDecoration.dart';

class EducationInfoFormView extends StatefulWidget {
  const EducationInfoFormView({Key? key}) : super(key: key);

  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<EducationInfoFormView> {
  StepsController controller = Get.put(StepsController());
  /*Spinner Code is here*/

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text("USA",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "USA"),
      const DropdownMenuItem(
          child: Text("Canada",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "Canada"),
      const DropdownMenuItem(
          child: Text("Brazil",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "Brazil"),
      const DropdownMenuItem(
          child: Text("England",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "England"),
    ];
    return menuItems;
  }

  String? selectedValue = null;

  List<Map> educationalDetails = [{}];
  var cards = <Container>[];

  Container createCard() {
    var universityController = TextEditingController();
    var startyearController = TextEditingController();
    var endyearController = TextEditingController();

    educationalDetails.add({
      'university': universityController,
      'start': startyearController,
      'end': endyearController,
    });

    selectStartDate() async {
      DateTime? pickedDate = await showModalBottomSheet<DateTime>(
        context: context,
        builder: (context) {
          DateTime? tempPickedDate = DateTime.now();
          return Container(
            height: 250,
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: CupertinoButton(
                          child: Text('Cancel', style: TextStyle(color: orange_ff881a),),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: CupertinoButton(
                          child: Text('Done', style: TextStyle(color: orange_ff881a)),
                          onPressed: () {
                            Navigator.of(context).pop(tempPickedDate);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                ),
                Expanded(
                  child: Container(
                    child: YearPicker(
                      firstDate: DateTime(DateTime.now().year - 100),
                      lastDate: DateTime.now(),
                      selectedDate: DateTime.now(),
                      onChanged: (DateTime value) { tempPickedDate = value; },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
      final DateFormat formatter = DateFormat('MMM, yyyy');
      final String formattedDate = formatter.format(pickedDate!);

      startyearController.text = formattedDate;
    }

    selectEndDate() async {
      DateTime? pickedDate = await showModalBottomSheet<DateTime>(
        context: context,
        builder: (context) {
          DateTime? tempPickedDate = DateTime.now();
          return Container(
            height: 250,
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: CupertinoButton(
                          child: Text('Cancel', style: TextStyle(color: orange_ff881a),),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: CupertinoButton(
                          child: Text('Done', style: TextStyle(color: orange_ff881a)),
                          onPressed: () {
                            Navigator.of(context).pop(tempPickedDate);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                ),
                Expanded(
                  child: Container(
                    child: YearPicker(
                      firstDate: DateTime(DateTime.now().year - 100),
                      lastDate: DateTime(DateTime.now().year - 20),
                      selectedDate: DateTime.now(),
                      onChanged: (DateTime value) { tempPickedDate = value; },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
      final DateFormat formatter = DateFormat('MMM, yyyy');
      final String formattedDate = formatter.format(pickedDate!);

      endyearController.text = formattedDate;
    }

    return Container(
      child: Column(
        children: [
          Container(
            height: HeightData.fifty_seven,
            decoration: EditTextDecoration,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: setTextFieldNext(
                        universityController,
                        "University/School",
                        false,
                        TextInputType.name,
                        false,
                        "",
                        TextInputAction.next,
                            () => {
                          // on Chnages
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: setDobTextFieldNext(
                    startyearController,
                    "Start year",
                    false,
                    TextInputType.name,
                    false,
                    "",
                    TextInputAction.next,
                    (value){
                      startyearController.text = value;
                    },
                    (){
                      selectStartDate();
                    }
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: setDobTextFieldNext(
                      endyearController,
                      "End year",
                      false,
                      TextInputType.name,
                      false,
                      "",
                      TextInputAction.next,
                          (value){
                        endyearController.text = value;
                      },
                      (){
                        selectEndDate();
                      }
                  ),
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: Container(
              //     height: HeightData.fifty_seven,
              //     decoration: EditTextDecoration,
              //     child: DropdownButtonHideUnderline(
              //       child: Padding(
              //         padding:
              //         const EdgeInsets.only(left: 10, right: 10),
              //         child: DropdownButton(
              //
              //           //  validator: (value) => value == null ? "Select a country" : null,
              //             dropdownColor: Colors.white,
              //             value: selectedValue,
              //             hint: const Text("End year",
              //                 style: TextStyle(
              //                     color: grey_aaaaaa,
              //                     fontWeight: FontWeight.w500,
              //                     fontFamily:
              //                     helveticaNeueNeue_medium,
              //                     fontStyle: FontStyle.normal,
              //                     fontSize: 14.0),
              //                 textAlign: TextAlign.left),
              //             icon: SvgPicture.asset(
              //               icon_down_arrow_spinner,
              //               width: 12,
              //               height: 12,
              //             ),
              //             onChanged: (String? newValue) {
              //               setState(() {
              //                 selectedValue = newValue!;
              //               });
              //             },
              //             items: dropdownItems),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cards.add(createCard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
    () => Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        const ToolbarWithHeader(
          step: 2,
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Personal Information
                  Center(
                    child: Text(str_Education,
                        style: const TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w900,
                            fontFamily: helvetica_neu_bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Lorem ipsum dolor sit amet, consectetur adipiscing elit. Massa nulla.
                  Center(
                    child: Text(str_personal_info_lorem,
                        style: const TextStyle(
                            color: grey_aaaaaa,
                            fontWeight: FontWeight.w500,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0,
                            height: 1.5),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(
                    height: 32,
                  ),

                  Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cards.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return cards[index];
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            cards.add(createCard());
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(width: 1, color: black_121212)),
                          child: // Add More
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Center(
                              child: Text("+ Add More",
                                  style: TextStyle(
                                      color: Color(0xff121212),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "NeueHelvetica",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.0),
                                  textAlign: TextAlign.left),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlackNextButton(str_continue, black_121212, () {
            if (controller.checkPersonalValidation(context)) {
              checkNet(context).then((value) {
                controller.educationalInfoAPI(context);
              });
            }
          }),
        )
      ],
    ),
      ),
    );
  }
}
