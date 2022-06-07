import 'package:flutter/material.dart';

final boxDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
          color:  Color(0xff4343b2).withOpacity(0.05),
          offset: Offset(0,2),
          blurRadius: 10,
          spreadRadius: 6)
    ],
    borderRadius: BorderRadius.all(Radius.circular(8)));