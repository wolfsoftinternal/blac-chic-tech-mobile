import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'Constant.dart';

Text setHelveticaMedium(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: helveticaNeueNeue_medium,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle),
  );
}

Text setHelveticaRegular(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: helveticaNeue,
        fontWeight: weight,
        color: color,
        fontStyle: fontStyle),
  );
}

Text setHelceticaBold(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle) {
  return Text(
    text,
    softWrap: true,
    style: TextStyle(
        fontSize: size,
        fontFamily: helvetica_neu_bold,
        fontWeight: weight,
        color: color,
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




Text setHelveticaBoldCenter(String text, double size, Color color, FontWeight weight,
    FontStyle fontStyle,TextAlign textAlign) {
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