import 'package:blackchecktech/Screens/Home/BCConnect/view/BcConnect.dart';
import 'package:blackchecktech/Screens/Home/Event/view/EventList.dart';
import 'package:blackchecktech/Screens/Home/FeatureMenu/View/FeaturedMainScreen.dart';
import 'package:blackchecktech/Screens/Home/MarketPlace/Marketplace.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/AdmireProfile.dart';
import 'package:blackchecktech/Screens/Home/transactions/view/TransactionsPayoutsTabs.dart';
import 'package:blackchecktech/Screens/Home/videosMenu/View/VideoListBct.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class CardList extends StatefulWidget {
  CardList({Key? key}) : super(key: key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
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
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
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
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: values.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Get.to(AdmireProfile());
                      } else if (index == 1) {
                        Get.to(Marketplace());
                      } else if (index == 2) {
                        launchURL('https://peerboard.com/1875702146');
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
                    child: AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 450),
                      child: SlideAnimation(
                        verticalOffset: 44.0,
                        child: FadeInAnimation(
                          child: Container(
                            height: 66,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: index % 2 != 0 ? black_121212 : white_ffffff,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.0.w, top: 16.0.h, bottom: 16.0.h),
                                  child: Text(
                                    values[index],
                                    style: TextStyle(
                                      color:
                                          index % 2 != 0 ? white_ffffff : black_121212,
                                      fontSize: 28.sp,
                                      letterSpacing: -1.12,
                                      fontFamily: helvetica_neu_bold,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 12.0),
                                  child: Transform.rotate(
                                    angle: 90 * math.pi / 375,
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: grey_aaaaaa,
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
                },
              ),
            ),
          ],
        ),
      );
  }
}
