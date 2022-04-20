import 'package:flutter/material.dart';


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