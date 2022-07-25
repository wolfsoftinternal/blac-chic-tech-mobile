import 'dart:math';

import 'package:blackchecktech/Screens/Home/FeatureMenu/View/PastFeaturesScreen.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Styles/my_colors.dart';
import '../controller/FeaturedController.dart';
import 'SearchFeaturesScreen.dart';

class FeaturedMainScreen extends StatefulWidget {
  const FeaturedMainScreen({Key? key}) : super(key: key);

  @override
  _FeaturedMainScreenState createState() => _FeaturedMainScreenState();
}

class _FeaturedMainScreenState extends State<FeaturedMainScreen> {
  FeaturedController featuredController = Get.put(FeaturedController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    featuredController.allFeaturedListApi();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
    () => featuredController.isDataFetched ==true ?
    featuredController.featuredList.length > 0?Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: featuredController.featuredList[0].image??"",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              progressIndicatorBuilder:
                  (context, url, downloadProgress) =>
                  SvgPicture.asset(
                    placeholder,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
              errorWidget: (context, url, error) =>
                  SvgPicture.asset(
                    placeholder,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
            ),


            // Image.asset(
            //   feature_img_1,
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            //   height: double.infinity,
            //   alignment: Alignment.center,
            // ),
            // OSA UX OF LIVING
             Center(
              child: Text(featuredController.featuredList[0].writer_name??"",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w900,
                      fontFamily: interExtraBold,
                      fontStyle: FontStyle.normal,
                      fontSize: 40.0),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 45.0, left: 30.0, right: 30.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    icon_cancel,
                    width: 30.w,
                    height: 30.h,
                    color: white_ffffff,
                  ),
                ),

                // Featured
                Text("Featured",
                    style: TextStyle(
                        color: white_ffffff,
                        fontWeight: FontWeight.w900,
                        fontFamily: interSemiBold,
                        letterSpacing: 1.2,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.sp),
                    textAlign: TextAlign.left),

                GestureDetector(
                  child: SvgPicture.asset(
                    search,
                    width: 20.w,
                    height: 20.h,
                    color: white_ffffff,
                  ),
                  onTap: (){
                    Get.to(() => SearchFeaturesScreen());

                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50.w, left: 32.w, right: 32.w),
          child: Container(
            // color: Colors.lightBlueAccent,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // Get.to(PastFeaturesScreen(featureList: featuredController.featuredList.value,selectedPosition: 1,));
                    Navigator.of(context).push(_createRoute());
                    // _controller.previousPage(
                    //     duration: _kDuration, curve: _kCurve);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.rotate(
                          angle: 180 * pi / 180,
                          child: SvgPicture.asset(
                            icon_feature_next_arrow,
                            width: 40,
                            height: 15,
                          )),

                      SizedBox(
                        height: 5.h,
                      ),
                      // READ ARTICLE
                      Text("PAST \nFEATURE",
                          style: TextStyle(
                              color: white_ffffff,
                              fontWeight: FontWeight.w700,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 1.2,
                              fontSize: 24.sp),
                          textAlign: TextAlign.left)
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    // launchURL(featuredController.featuredList[0].link!);
                    launchURL('https://www.google.com');
                    // _controller.nextPage(
                    //     duration: _kDuration, curve: _kCurve);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        icon_feature_next_arrow,
                        width: 40,
                        height: 15,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      // READ ARTICLE
                      Text("READ \nARTICLE",
                          style: TextStyle(
                              color: white_ffffff,
                              fontWeight: FontWeight.w700,
                              fontFamily: helvetica_neu_bold,
                              letterSpacing: 1.2,
                              fontStyle: FontStyle.normal,
                              fontSize: 24.sp),
                          textAlign: TextAlign.right)
                    ],
                  ),
                ),
                // FlatButton(
                //   child: Text('Prev'),
                //   onPressed: () {
                //     _controller.previousPage(
                //         duration: _kDuration, curve: _kCurve);
                //   },
                // ),
                // FlatButton(
                //   child: Text('Next'),
                //   onPressed: () {
                //     _controller.nextPage(duration: _kDuration, curve: _kCurve);
                //   },
                // )
              ],
            ),
          ),
        ),
      ],
    ):
    Text('No Data Found'):Container(height: MediaQuery.of(context).size.height,child: Center(child: CircularProgressIndicator(color: black, strokeWidth: 2,),)),
      ),
    );
  }

  Route _createRoute() {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 800),
      pageBuilder: (context, animation, secondaryAnimation) => PastFeaturesScreen(featureList: featuredController.featuredList.value,selectedPosition: 0,),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
  
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
