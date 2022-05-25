import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Layout/ToolbarWithHeaderCenterTitle.dart';

class MyPurchasedEvent extends StatefulWidget {
  const MyPurchasedEvent({Key? key}) : super(key: key);

  @override
  _MyPurchasedEventState createState() => _MyPurchasedEventState();
}

class _MyPurchasedEventState extends State<MyPurchasedEvent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: ToolbarWithHeaderCenterTitle("MY EVENTS")),

            ],
          ),
        ),
      ),
    );
  }
}
