import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Constant.dart';

Text setHelveticaMedium(String text, double size, Color color,
    FontWeight weight, FontStyle fontStyle,
    [spacing, maxline, height]) {
  return Text(
    text,
    softWrap: true,
    overflow: TextOverflow.ellipsis,
    maxLines: maxline,
    style: TextStyle(
        fontSize: size,
        fontFamily: helveticaNeueNeue_medium,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle,
        height: height,
        letterSpacing: spacing),
  );
}

Text setHelveticaRegular(String text, double size, Color color,
    FontWeight weight, FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: helveticaNeue,
        fontWeight: weight,
        color: color,
        letterSpacing: 0.7,
        fontStyle: fontStyle),
  );
}

Text setInterRegular(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: interRegular,
        fontWeight: weight,
        color: color,
        letterSpacing: 0.7,
        fontStyle: fontStyle),
  );
}

Text setBoldSfProDisplayTextAlign(String text, double size, Color color,
    FontWeight weight, FontStyle fontStyle, TextAlign textAlign) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: helvetica_neu_bold,
        fontWeight: weight,
        color: color,
        height: 1,
        fontStyle: fontStyle),
  );
}

Text setHelceticaBold(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle,
    [spacing]) {
  return Text(
    text,
    softWrap: true,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: size,
        fontFamily: helvetica_neu_bold,
        fontWeight: weight,
        color: color,
        letterSpacing: spacing,
        fontStyle: fontStyle),
  );
}

Text setInterExtraBold(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle,
    [spacing]) {
  return Text(
    text,
    softWrap: true,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: size,
        fontFamily: interExtraBold,
        fontWeight: weight,
        color: color,
        letterSpacing: spacing,
        fontStyle: fontStyle),
  );
}

Text setHelveticaLight(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: helveticaNeueNeue_light,
        fontWeight: weight,
        color: color,
        height: 1,
        fontStyle: fontStyle),
  );
}

Text setHelveticaBoldCenter(String text, double size, Color color,
    FontWeight weight, FontStyle fontStyle, TextAlign textAlign) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: helvetica_neu_bold,
        fontWeight: weight,
        color: color,
        height: 1,
        fontStyle: fontStyle),
  );
}

Text setRoboto(String text, double size, Color color, FontWeight weight) {
  return Text(text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color,
          fontWeight: weight,
          fontFamily: roboto_bold,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.5,
          fontSize: size),
      textAlign: TextAlign.left);
}
