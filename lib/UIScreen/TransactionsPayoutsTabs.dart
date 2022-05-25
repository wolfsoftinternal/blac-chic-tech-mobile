import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../Styles/my_colors.dart';
import '../Styles/my_strings.dart';

class TransactionsPayoutsTabs extends StatefulWidget {
  const TransactionsPayoutsTabs({Key? key}) : super(key: key);

  @override
  _TransactionsPayoutsTabsState createState() => _TransactionsPayoutsTabsState();
}

class _TransactionsPayoutsTabsState extends State<TransactionsPayoutsTabs> {
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
                  child: ToolbarWithHeaderCenterTitle("TRXNS. & PAYOUTS")),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 7.h),
                margin: EdgeInsets.only(left: 24.w,right: 24.w,top: 42.h),
                decoration: BoxDecoration(
                  color: black_121925,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    Expanded(
                      child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Wallet Balance",style: TextStyle(fontFamily: roboto_bold,fontSize: 14.sp,
                        color: opcity_white_ffffff),),
                        SizedBox(height: 3.h,),
                        Text(str_doller,style: TextStyle(fontFamily: roboto_bold,fontSize: 24.sp,
                            color: Colors.white),),
                      ],),
                    ),


                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                      decoration: BoxDecoration(
                        color: orange_ff881a,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text("Withdraw",style: TextStyle(fontFamily: roboto_bold,fontSize: 16.sp,
                          color: Colors.white),),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
