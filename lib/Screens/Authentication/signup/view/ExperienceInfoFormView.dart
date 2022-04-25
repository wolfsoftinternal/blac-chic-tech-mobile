import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeader.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/CompanyList.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Styles/my_height.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utilities/TextfieldUtility.dart';
import '../../../../Widget/EditTextDecoration.dart';
import 'EducationInfoFormView.dart';

class ExperienceInfoFormView extends StatefulWidget {
  const ExperienceInfoFormView({Key? key}) : super(key: key);

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<ExperienceInfoFormView> {
  StepsController controller = Get.put(StepsController());  
  var cards = <Container>[];
  List<Map> companyDetails = [{}];

  Container createCard() {
    var pastCompanyTitleController = TextEditingController();
    var pastCompanyNameController = TextEditingController();
    var pastCompanyWebsiteController = TextEditingController();
    companyDetails.add({
      'title': pastCompanyTitleController.value.text,
      'company_name': pastCompanyNameController.value.text,
      'website': pastCompanyWebsiteController.value.text,
    });
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: HeightData.fifty_seven,
                  child: Center(
                    child: setTextField(
                      pastCompanyTitleController,
                      "Title",
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
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: HeightData.fifty_seven,
                  child: Center(
                    child: setTextField(
                      pastCompanyNameController,
                      "Company Name",
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
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: HeightData.fifty_seven,
            child: Center(
              child: setTextField(
                pastCompanyWebsiteController,
                "Company Website",
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
          SizedBox(
            height: 16,
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
              step: 1,
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
                        child: Text(str_Experience,
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

                      // InputTextLayout(
                      //     "Date of birth",
                      //     _birhtdayController,
                      //     false,
                      //     TextInputAction.next,
                      //     TextInputType.emailAddress),

                      // YOUR CURRENT JOB
                      const Text("YOUR CURRENT JOB",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
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
                                  left: 12,
                                  right: 12,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: setTextFieldNext(
                                        controller.currentTitleController.value,
                                        "Title",
                                        false,
                                        TextInputType.name,
                                        false,
                                        "",
                                        TextInputAction.next,
                                        () => {
                                              // on Chnages
                                            },
                                        () {}),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: Container(
                                height: HeightData.fifty_seven,
                                decoration: EditTextDecoration,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    right: 12,
                                    top: 14
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: GestureDetector(
                                        onTap: () {
                                          Get.to(CompanyList());
                                        },
                                        child: Text(
                                          controller.companyName.value,
                                          style: TextStyle(
                                              color: controller.companyName.value == 'Company Name' ? grey_aaaaaa : black_121212,
                                              fontWeight: FontWeight.w500,
                                              fontFamily:
                                                  helveticaNeueNeue_medium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0),
                                        )),
                                    // child: setTextFieldNext(
                                    //   controller.currentCompanyNameController.value,
                                    //   "Company Name",
                                    //   false,
                                    //   TextInputType.name,
                                    //   false,
                                    //   "",
                                    //   TextInputAction.next,
                                    //   () => {
                                    //     // on Chnages
                                    //   },
                                    //   (){
                                    //     Get.to(CompanyList());
                                    //   },
                                    //   true,
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 16,
                      ),

                      Container(
                        height: HeightData.fifty_seven,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: setTextField(
                            controller.currentCompanyWebsiteController.value,
                            "Company Website",
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

                      const SizedBox(
                        height: 32,
                      ),

                      const Text("YOUR PAST JOB",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                      const SizedBox(
                        height: 4,
                      ),
                      // you can add more then one.
                      const Text("you can add more then one.",
                          style: TextStyle(
                              color: Color(0xffaaaaaa),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NeueHelvetica",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
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
                                  border: Border.all(
                                      width: 1, color: black_121212)),
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
                if (controller.checkExperienceValidation(context)) {
                  checkNet(context).then((value) {
                    controller.pastCompanyDetails = companyDetails;
                    controller.experienceInfoAPI(context);
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
