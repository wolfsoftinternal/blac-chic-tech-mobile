import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

getHeight(context) {
  return MediaQuery.of(context).size.height;
}

getWidth(context) {
  return MediaQuery.of(context).size.width;
}

getLongestSide(context) {
  return MediaQuery.of(context).size.longestSide;
}

getShortestSide(context) {
  return MediaQuery.of(context).size.shortestSide;
}

Widget horizontalSpace(BuildContext context, double horizontalSpace) {
  return SizedBox(
    width: getShortestSide(context) * horizontalSpace,
  );
}

Widget verticalSpace(BuildContext context, double verticalSpace) {
  return SizedBox(
    height: getLongestSide(context) * verticalSpace,
  );
}

Widget noDatFound(BuildContext context) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 0.6,
    child: Center(
      child: Container(
          width: 200,
          height: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            // ) , child: Image.asset(loadingbar, height: 35, width: 35)),
          ),
          child: Text("No Data Found",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: const Color(0xff96a6a3),
                  fontFamily: "SFProDisplay Semibold",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.sp))),
    ),
  );
}
