import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderAction.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Authentication/signup/view/ExperienceInfoFormView.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_height.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/SearchBar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompanyList extends StatefulWidget {
  const CompanyList({Key? key}) : super(key: key);

  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  StepsController controller = Get.put(StepsController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkNet(context).then((value) => controller.companyListAPI(context, null));
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
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: ToolbarWithHeaderAction(
                'Select Your Company',
                plus,
                () {
                  showGeneralDialog(
                      context: context,
                      pageBuilder: (BuildContext buildContext,
                          Animation animation, Animation secondaryAnimation) {
                        return Material(
                            type: MaterialType.transparency,
                            child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: white_ffffff,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      //height: 198,
                                      child: Wrap(children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 23, right: 23, top: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  const Spacer(),
                                                  const Center(
                                                    child: Text(
                                                      "Add Company",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              helvetica_neu_bold,
                                                          color: black_121212,
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                      },
                                                      child: const Icon(
                                                          Icons.close)),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 18,
                                              ),
                                              const Text(
                                                "Company Logo",
                                                style: TextStyle(
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    color: black_121212,
                                                    fontSize: 16),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 60,
                                                width: 60,
                                                child: DottedBorder(
                                                  color: grey_aaaaaa,
                                                  strokeWidth: 1,
                                                  child: imagePath.toString() !=
                                                          "File: ''"
                                                      ? InkWell(
                                                          onTap: () {
                                                            selectPhoto();
                                                          },
                                                          child: Image.file(
                                                            imagePath,
                                                            fit: BoxFit.fill,
                                                            height: 60,
                                                            width: 60,
                                                          ),
                                                        )
                                                      : InkWell(
                                                          onTap: () {
                                                            selectPhoto();
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(18.0),
                                                            child: SvgPicture
                                                                .asset(
                                                              plus,
                                                              width: 30,
                                                              height: 30,
                                                              color:
                                                                  grey_aaaaaa,
                                                            ),
                                                          )),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 18,
                                              ),
                                              const Text(
                                                "Company Name",
                                                style: TextStyle(
                                                    fontFamily:
                                                        helveticaNeueNeue_medium,
                                                    color: black_121212,
                                                    fontSize: 16),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: HeightData.fifty_three,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: grey_aaaaaa),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(4)),
                                                  color: Colors.white,
                                                ),
                                                child: Center(
                                                  child: TextField(
                                                    controller: controller
                                                        .currentCompanyNameController
                                                        .value,
                                                    cursorColor: black_121212,
                                                    decoration:
                                                        const InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 5,
                                                              vertical: 0),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              BlackNextButton(
                                                  'Save', black_121212, () {
                                                if (controller
                                                    .checkAddCompanyValidation(
                                                        context)) {
                                                  checkNet(context)
                                                      .then((value) {
                                                        controller.companyName.value = controller.currentCompanyNameController.value.text;
                                                    controller.createCompanyAPI(
                                                        context,
                                                        imagePath.path
                                                            .toString());
                                                  });
                                                }
                                              }),
                                              const SizedBox(
                                                height: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    ))));
                      });
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
              child: SearchBar(
                controller: controller.searchCompanyController.value,
                onSubmit: (v) {
                  var body = {
                    'search': controller.searchCompanyController.value.text,
                  };
                  controller.companyListAPI(context, body);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  itemCount: controller.companyList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
                      child: InkWell(
                        onTap: () {
                          controller.companyName.value =
                              controller.companyList[index]['name'];
                          Get.back();
                        },
                        child: Row(
                          children: [
                            // ClipRRect(
                            //   borderRadius: BorderRadius.circular(5),
                            //   child: CachedNetworkImage(
                            //     imageUrl: controller.companyList[index]['logo'],
                            //     height: 50, width: 50,
                            //     fit: BoxFit.cover,
                            //     progressIndicatorBuilder:
                            //         (context, url, downloadProgress) =>
                            //             SvgPicture.asset(placeholder, height: 50, width: 50,),
                            //     errorWidget: (context, url, error) => SvgPicture.asset(placeholder, height: 50, width: 50,),
                            //   ),
                            // ),
                            Image.network(controller.companyList[index]['logo'], height: 50, width: 50, fit: BoxFit.cover,),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              controller.companyList[index]['name'],
                              style: const TextStyle(
                                  fontFamily: helveticaNeueNeue_medium,
                                  color: black_121212,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  selectPhoto() {
    showImagePicker(context).then((value) {
      setState(() {
        if (imagePath.toString() != "File: ''") {
          controller.boolComapnyLogo.value = true;
        }
      });
    });
  }
}
