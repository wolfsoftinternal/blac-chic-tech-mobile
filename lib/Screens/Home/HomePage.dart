import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/BottomNavigation.dart';
import 'package:blackchecktech/Screens/Home/Event/view/EventList.dart';
import 'package:blackchecktech/Screens/Home/MarketPlace/Marketplace.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/AdmireProfile.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/VideoListBct.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Screens/Home/BCConnect/view/BcConnect.dart';
import 'package:blackchecktech/Screens/Home/transactions/view/TransactionsPayoutsTabs.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Utils/preference_utils.dart';
import '../../Utils/share_predata.dart';
import 'FeatureMenu/View/FeaturedMainScreen.dart';
import 'FeatureMenu/View/PastFeaturesScreen.dart';
import 'chat_module/my_db.dart';
import 'dart:math' as math;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
    "TRXNS. & PAYOUTS",
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // children: AnimationConfiguration.toStaggeredList(
            //   duration: const Duration(milliseconds: 0),
            //   childAnimationBuilder: (widget) => FadeInAnimation(
            //     child: widget,
            //   ),
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      Container(
                        child: Center(
                            child: SvgPicture.asset(
                          logo,
                          height: 58.h,
                          width: 58.w,
                        )),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16.w,
                          right: 16.w,
                        ),
                        child: AnimationLimiter(
                          child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: values.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: ((context, index) {
                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 700),
                                  child: SlideAnimation(
                                    verticalOffset: 44.0,
                                    child: FadeInAnimation(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (index == 0) {
                                            Get.to(AdmireProfile());
                                          } else if (index == 1) {
                                            Get.to(Marketplace());
                                          } else if (index == 2) {
                                            launchURL(
                                                'https://peerboard.com/1875702146');
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
                                          // height: 66,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: index % 2 != 0
                                                  ? [
                                                      Color.fromARGB(
                                                          255, 36, 48, 69),
                                                      Color(0xff04080f)
                                                    ]
                                                  : [white, white],
                                              stops: [0.0, 1.0],
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(4.0)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.0.w,
                                                    top: 15.5.h,
                                                    bottom: 17.5.h),
                                                child: Text(
                                                  values[index],
                                                  style: TextStyle(
                                                    color: index % 2 != 0
                                                        ? white_ffffff
                                                        : black_121212,
                                                    fontSize: 28.sp,
                                                    letterSpacing: -0.2.sp,
                                                    fontFamily:
                                                        helvetica_neu_bold,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 12.0),
                                                child: Transform.rotate(
                                                  angle: 90 * math.pi / 375,
                                                  child: Icon(
                                                    Icons.arrow_forward,
                                                    color: grey_aaaaaa
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              })),
                        ),
                      ),
                      SizedBox(
                        height: 100.h,
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
