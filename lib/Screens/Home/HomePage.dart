import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/BottomNavigation.dart';
import 'package:blackchecktech/Screens/Home/Event/view/EventList.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/AdmireProfile.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/VideoListBct.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Screens/Home/BCConnect/view/BcConnect.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/preference_utils.dart';
import '../../Utils/share_predata.dart';
import 'chat_module/my_db.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List values = [
    "YOUR PROFILE",
    "NFT MARKETPLACE",
    "COMMUNITY",
    "BC-CONNECT",
    "VIDEOS",
    "FEATURE",
    "EVENTS"
  ];
  SignupModel signupModel = SignupModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    var preferences = MySharedPref();
    SignupModel signupModel =
        (await preferences.getSignupModel(SharePreData.keySignupModel))!;
    MyDB().createCurrentUserDoc(signupModel.data!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
                child: Image.asset(
              img_logo,
              height: 58,
              width: 58,
            )),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: values.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            Get.to(AdmireProfile());
                          }
                          if (index == 4) {
                            Get.to(VideoListBct());
                          }
                          if (index == 6) {
                            Get.to(EventList());
                          }
                        },
                        child: Container(
                          height: 68,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: index % 2 != 0 ? black_121212 : white_ffffff,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  values[index],
                                  style: TextStyle(
                                    color: index % 2 != 0
                                        ? white_ffffff
                                        : black_121212,
                                    fontSize: 22,
                                    fontFamily: helvetica_neu_bold,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 12.0),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: grey_aaaaaa,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigation(
                selectedIndex: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
