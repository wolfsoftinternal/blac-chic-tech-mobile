
import 'package:blackchecktech/Layout/BlackNextButton.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/model/UserListModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_height.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSpeaker extends StatefulWidget {
  const AddSpeaker({Key? key}) : super(key: key);

  @override
  State<AddSpeaker> createState() => _AddSpeakerState();
}

class _AddSpeakerState extends State<AddSpeaker> {
  EventController controller = Get.put(EventController());
  final speakerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
          type: MaterialType.transparency,
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: white_ffffff,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    //height: 198,
                    child: Wrap(children: [
                      Container(
                        margin: const EdgeInsets.only(left: 23, right: 23, top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                const Center(
                                  child: Text(
                                    "Add Speaker",
                                    style: TextStyle(
                                        fontFamily: helvetica_neu_bold,
                                        color: black_121212,
                                        fontSize: 18),
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: const Icon(Icons.close)),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: speakerKey,
                        child: Column(
                          children: [
                            const Divider(),
                            Container(
                              margin: const EdgeInsets.only(left: 23, right: 23),
                              height: HeightData.fifty_three,
                              // decoration: BoxDecoration(
                              //   border: Border.all(color: grey_aaaaaa),
                              //   borderRadius:
                              //       const BorderRadius.all(Radius.circular(4)),
                              //   color: Colors.white,
                              // ),
                              child: Center(
                                child: TextFormField(
                                  controller: controller.speakerController.value,
                                  cursorColor: black_121212,
                                  validator: (String? value) {
                                    if (value == "") {
                                      return 'Enter speaker name';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Please type here...',
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 0),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 23, right: 23),
                              child: BlackNextButton('Done', black_121212, () {
                                if (speakerKey.currentState!.validate()) {
                                  UserList userList = UserList();
                                  userList.userName = controller.speakerController.value.text;
                                  controller.selectedSpeaker.add(userList);
                                  Get.back();
                                  Get.back();
                                }
                              }),
                            ),
                            const SizedBox(
                              height: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )))),
    );
  }
}
