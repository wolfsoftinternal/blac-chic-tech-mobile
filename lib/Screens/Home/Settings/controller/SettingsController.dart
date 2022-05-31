import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxInt visible = 1.obs;
  Rx<TextEditingController> firstnameController = TextEditingController().obs;
  Rx<TextEditingController> lastnameController = TextEditingController().obs;
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxBool linkedin = true.obs;
  RxBool twitter = true.obs;
  RxBool instagram = true.obs;
  RxBool website = true.obs;
  RxBool about = true.obs;
  RxBool ques1 = true.obs;
  RxBool ques2 = true.obs;
  RxBool ques3 = true.obs;
  RxBool ques4 = true.obs;
  RxBool ques5 = true.obs;
  RxBool additional = true.obs;
}
