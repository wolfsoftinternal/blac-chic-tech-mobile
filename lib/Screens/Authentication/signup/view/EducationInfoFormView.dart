import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalLastQueView.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/AdditionalQueFormView.dart';
import 'package:blackchecktech/Screens/Home/BottomNavigation.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
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

  List cards = [""];
  List<Map> details = [{}];

  List<TextEditingController> universityController = [];
  List<TextEditingController> startyearController = [];
  List<TextEditingController> endyearController = [];

  DateTime startDate = DateTime.now();

  bool isDeleteLast = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cards.forEach((element) {
      var university = TextEditingController(text: element);
      var startyear = TextEditingController(text: element);
      var endyear = TextEditingController(text: element);

      universityController.add(university);
      startyearController.add(startyear);
      endyearController.add(endyear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          ToolbarWithHeader(
              step: 2,
              ontap: () async {
                var preferences = MySharedPref();

                String questionsInfo = await preferences.getStringValue(SharePreData.keyQuestionsInfo);
                String lastQuestionsInfo = await preferences.getStringValue(SharePreData.keyLastQuestionsInfo);

                if (questionsInfo == "") {
                  Get.to(const AdditionalQueFormView());
                }else if(lastQuestionsInfo == ""){
                  Get.to(AdditionalLastQueView());
                }else{
                  Get.offAll(BottomNavigation());
                }
              }),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: setTextFieldNext(
                                                universityController[index],
                                                "University/School",
                                                false,
                                                TextInputType.name,
                                                false,
                                                "",
                                                TextInputAction.next,
                                                (value) => {
                                                  // on Chnages
                                                },
                                                () {},
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
                                        child: Container(
                                          height: HeightData.fifty_seven,
                                          decoration: EditTextDecoration,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: setDobTextFieldNext(
                                                      startyearController[
                                                          index],
                                                      "Start year",
                                                      false,
                                                      TextInputType.name,
                                                      false,
                                                      "",
                                                      TextInputAction.next,
                                                      (value) {},
                                                      () async {
                                                        DateTime? pickedDate =
                                                            await showModalBottomSheet<
                                                                DateTime>(
                                                          context: context,
                                                          builder: (context) {
                                                            DateTime?
                                                                tempPickedDate =
                                                                DateTime.now();
                                                            return Container(
                                                              height: 250,
                                                              child: Column(
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(left: 5.0),
                                                                          child:
                                                                              CupertinoButton(
                                                                            child:
                                                                                Text(
                                                                              'Cancel',
                                                                              style: TextStyle(color: orange_ff881a),
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(right: 5.0),
                                                                          child:
                                                                              CupertinoButton(
                                                                            child:
                                                                                Text('Done', style: TextStyle(color: orange_ff881a)),
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.of(context).pop(tempPickedDate);
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    height: 0,
                                                                    thickness:
                                                                        1,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          YearPicker(
                                                                        firstDate:
                                                                            DateTime(DateTime.now().year -
                                                                                100),
                                                                        lastDate:
                                                                            DateTime.now(),
                                                                        selectedDate:
                                                                            DateTime.now(),
                                                                        onChanged:
                                                                            (DateTime
                                                                                dateTime) {
                                                                          tempPickedDate =
                                                                              dateTime;
                                                                          startDate =
                                                                              dateTime;
                                                                          Navigator.of(context)
                                                                              .pop(tempPickedDate);
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                        final DateFormat
                                                            formatter =
                                                            DateFormat('yyyy');
                                                        final String
                                                            formattedDate =
                                                            formatter.format(
                                                                pickedDate!);

                                                        startyearController[
                                                                    index]
                                                                .text =
                                                            formattedDate;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          height: HeightData.fifty_seven,
                                          decoration: EditTextDecoration,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12, right: 12),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: setDobTextFieldNext(
                                                      endyearController[index],
                                                      "End year",
                                                      false,
                                                      TextInputType.name,
                                                      false,
                                                      "",
                                                      TextInputAction.next,
                                                      (value) {},
                                                      () async {
                                                        if (startyearController[
                                                                index]
                                                            .text
                                                            .isEmpty) {
                                                          snackBar(context,
                                                              'Enter start year');
                                                        } else {
                                                          DateTime? pickedDate =
                                                              await showModalBottomSheet<
                                                                  DateTime>(
                                                            context: context,
                                                            builder: (context) {
                                                              DateTime?
                                                                  tempPickedDate =
                                                                  DateTime
                                                                      .now();
                                                              return Container(
                                                                height: 250,
                                                                child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Container(
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: <
                                                                            Widget>[
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 5.0),
                                                                            child:
                                                                                CupertinoButton(
                                                                              child: Text(
                                                                                'Cancel',
                                                                                style: TextStyle(color: orange_ff881a),
                                                                              ),
                                                                              onPressed: () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(right: 5.0),
                                                                            child:
                                                                                CupertinoButton(
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
                                                                      thickness:
                                                                          1,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        child:
                                                                            YearPicker(
                                                                          firstDate:
                                                                              startDate,
                                                                          lastDate:
                                                                              DateTime(DateTime.now().year + 10),
                                                                          selectedDate:
                                                                              DateTime.now(),
                                                                          onChanged:
                                                                              (DateTime value) {
                                                                            tempPickedDate =
                                                                                value;
                                                                            Navigator.of(context).pop(tempPickedDate);
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                          final DateFormat
                                                              formatter =
                                                              DateFormat(
                                                                  'yyyy');
                                                          final String
                                                              formattedDate =
                                                              formatter.format(
                                                                  pickedDate!);

                                                          endyearController[index].text =
                                                              formattedDate;
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        isDeleteLast == true
                        ? GestureDetector(
                          onTap: () {
                            setState(() {
                              cards.removeLast();
                              if(cards.length == 1){
                                isDeleteLast = false;
                              }
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(width: 1, color: black_121212)),
                            child: // Add More
                                const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Center(
                                child: Text("Delete Last",
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
                        ) : Container(),
                        isDeleteLast == true
                        ? SizedBox(
                          height: 16,
                        ) : Container(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isDeleteLast = true;
                              cards.forEach((element) {
                                var university =
                                    TextEditingController(text: element);
                                var startyear =
                                    TextEditingController(text: element);
                                var endyear =
                                    TextEditingController(text: element);

                                universityController.add(university);
                                startyearController.add(startyear);
                                endyearController.add(endyear);
                              });

                              cards.add("");
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(width: 1, color: black_121212)),
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
                        ),
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
                details.clear();

                for (int i = 0; i < cards.length; i++) {
                  details.add({
                    'title': universityController[i].text,
                    'company_name': startyearController[i].text,
                    'website': endyearController[i].text,
                  });
                }

              if (details.toString() != "[{title: , company_name: , website: }]") {
                List itemList = [];

                itemList.clear();
                for (var item in details) {
                  itemList.add(item);
                }
                controller.educationalDetails.value = itemList.join(",");
                print(controller.educationalDetails.value);
                checkNet(context).then((value) {
                  controller.educationalInfoAPI(context);
                });
              } else {
                snackBar(context, 'Add educational details');
              }
            }),
          )
        ],
      ),
    );
  }
}
