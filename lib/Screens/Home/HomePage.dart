import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/BottomNavigation.dart';
import 'package:blackchecktech/Screens/Home/Event/view/EventList.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/AdmireProfile.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/VideoListBct.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Screens/Home/BCConnect/view/BcConnect.dart';
import 'package:blackchecktech/Screens/Home/transactions/view/TransactionsPayoutsTabs.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Utils/preference_utils.dart';
import '../../Utils/share_predata.dart';
import 'FeatureMenu/View/FeaturedMainScreen.dart';
import 'FeatureMenu/View/PastFeaturesScreen.dart';
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
    "EVENTS",
    "TRXNS & PAYOUTS",
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        child: Center(
                            child: SvgPicture.asset(
                          logo,
                          height: 58,
                          width: 58,
                        )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.w,
                          right: 16.w,
                        ),
                        child: ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: values.length,
                            padding: EdgeInsets.zero,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Get.to(AdmireProfile());
                                  } else if (index == 3) {
                                    Get.to(BcConnect());
                                  } else if (index == 6) {
                                    Get.to(EventList());
                                  } else if (index == 5) {
                                    Get.to(FeaturedMainScreen());
                                  } else if (index == 7) {
                                    Get.to(TransactionsPayoutsTabs());
                                  }
                                  if (index == 4) {
                                    Get.to(VideoListBct());
                                  }
                                },
                                child: Container(
                                  height: 68,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: index % 2 != 0
                                        ? black_121212
                                        : white_ffffff,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5.0)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 12.0),
                                        child: Text(
                                          values[index],
                                          style: TextStyle(
                                            color: index % 2 != 0
                                                ? white_ffffff
                                                : black_121212,
                                            fontSize: 28,
                                            letterSpacing: -1.12,
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
                      const SizedBox(
                        height: 110,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          BottomNavigation(
            selectedIndex: 0,
          ),
        ],
      ),
    );
  }
}
