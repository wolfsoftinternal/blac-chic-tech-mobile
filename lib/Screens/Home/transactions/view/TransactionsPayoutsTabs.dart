import 'package:blackchecktech/Model/PayoutsModel.dart';
import 'package:blackchecktech/Screens/PaymentFlow/withdraw/view/ChooseBankAccountPage.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Layout/ToolbarWithHeaderCenterTitle.dart';
import '../../../../Model/TransactionsModel.dart';
import '../../../../Styles/my_colors.dart';
import '../../../../Styles/my_strings.dart';
import '../../../../Utils/internet_connection.dart';
import '../../../../Utils/pagination_utils.dart';
import '../../../../Widget/search_bar.dart';
import '../controller/TransactionsController.dart';

class TransactionsPayoutsTabs extends StatefulWidget {
  const TransactionsPayoutsTabs({Key? key}) : super(key: key);

  @override
  _TransactionsPayoutsTabsState createState() =>
      _TransactionsPayoutsTabsState();
}

class _TransactionsPayoutsTabsState extends State<TransactionsPayoutsTabs> {
  TransactionsController transactionController =
      Get.put(TransactionsController());

  bool Bg1 = true;
  bool Bg2 = false;

  bool tv1 = true;
  bool tv2 = false;

  bool _isFirstLayout = true;
  bool _isSecondLayout = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkNet(context).then(
      (value) {
        transactionController.getUserDetails(context);
        transactionController.allTransactionListApi(context, '');
      },
    );
    transactionController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
/*------------ 1st Tab Data ----------*/
    List<TransactionsModel> transactionsList = [
      TransactionsModel('Order ID #1313112131311', "Dec 16 2021 at 11:00 pm",
          "Start up bootcamp 2022", "\$1,100"),
      TransactionsModel('Order ID #1313112131311', "Dec 16 2021 at 11:00 pm",
          "Start up bootcamp 2022", "\$1,100"),
    ];

    /*------------ 2nd Tab Data ----------*/
    List<PayoutsModel> payOutsList = [
      PayoutsModel(
        '**** 1231',
        "Dec 16 2021 at 11:00 pm",
        "\$1000",
      ),
      PayoutsModel(
        '**** 1231',
        "Dec 16 2021 at 11:00 pm",
        "\$1000",
      ),
      PayoutsModel(
        '**** 1231',
        "Dec 16 2021 at 11:00 pm",
        "\$1000",
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Obx(
        () => SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*----- Toolbar ------*/
                Container(
                    margin: EdgeInsets.only(top: 15.h),
                    child: ToolbarWithHeaderCenterTitle("TRXNS. & PAYOUTS")),
                /*----- Wallet Balance Layout ------*/
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
                  margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 42.h),
                  decoration: BoxDecoration(
                    color: black_121925,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wallet Balance",
                              style: TextStyle(
                                  fontFamily: roboto_bold,
                                  fontSize: 14.sp,
                                  color: opcity_white_ffffff),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              SharePreData.strDollar +
                                  (transactionController
                                          .userDetails.value.wallet ??
                                      "0"),
                              style: TextStyle(
                                  fontFamily: roboto_bold,
                                  fontSize: 24.sp,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(WithdrawChooseBankAccount(
                            walletAmount: transactionController
                                    .userDetails.value.wallet ??
                                "0",
                          ));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: orange_ff881a,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            "Withdraw",
                            style: TextStyle(
                                fontFamily: roboto_bold,
                                fontSize: 16.sp,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*----- 2 Tab Layout ------*/
                Container(
                  margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Bg1 = true;
                              Bg2 = false;
                              tv1 = true;
                              tv2 = false;
                              _isFirstLayout = true;
                              _isSecondLayout = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            decoration: BoxDecoration(
                              color: Bg1 ? black_121212 : grey_f5f5f5,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Center(
                              child: Text(
                                "Transactions",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: tv1 ? Colors.white : black_121212,
                                    fontFamily: roboto_bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Bg1 = false;
                              Bg2 = true;
                              tv1 = false;
                              tv2 = true;
                              _isFirstLayout = false;
                              _isSecondLayout = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            decoration: BoxDecoration(
                              color: Bg2 ? black_121212 : grey_f5f5f5,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Center(
                              child: Text(
                                "Payouts",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: tv2 ? Colors.white : black_121212,
                                    fontFamily: roboto_bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [

                      /*--------------- Transactions Tab --------------*/
                      transactionController.transactionList.length > 0
                          ? Visibility(
                        visible: _isFirstLayout,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 15.h, left: 24.w, right: 24.w),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 10.w),
                              decoration: const BoxDecoration(
                                // border: Border.all(color: grey_e9ecec, width: 1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                                  color: grey_f5f5f5),
                              child:

                              SearchBarTag(
                                placeholder: "Search people",
                                autoFocus: false,
                                onSubmit: (value) {
                                  checkNet(context).then((value) {
                                    transactionController.allTransactionListApi(context,
                                        transactionController.searchControllerForTransactions.value.text);
                                  });
                                },
                                controller: transactionController.searchControllerForTransactions.value,
                              ),

                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   mainAxisSize: MainAxisSize.max,
                              //   children: [
                              //     SvgPicture.asset(
                              //       search,
                              //       color: grey_aaaaaa,
                              //     ),
                              //     SizedBox(
                              //       width: 10.w,
                              //     ),
                              //     const Expanded(
                              //       child: TextField(
                              //         style: TextStyle(
                              //             color: black_121212,
                              //             fontFamily: roboto_medium,
                              //             fontSize: 14.0),
                              //         decoration: InputDecoration(
                              //           isDense: true,
                              //           hintText: "Search.......",
                              //           hintStyle: TextStyle(
                              //               color: grey_aaaaaa,
                              //               fontFamily: roboto_medium,
                              //               fontSize: 14.0),
                              //           border: InputBorder.none,
                              //         ),
                              //         keyboardType: TextInputType.text,
                              //         textInputAction: TextInputAction.next,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 16.h, left: 24.w, right: 24.w),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: transactionController
                                      .transactionList.length,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 16.h),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16.h, horizontal: 16.w),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(4.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0x194343b2)
                                                  .withOpacity(0.15),
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 10.0,
                                              spreadRadius: 2.0,
                                            ), //BoxShadow
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  transactionController
                                                      .transactionList[i]
                                                      .transaction_id ??
                                                      "",
                                                  style: TextStyle(
                                                      fontFamily:
                                                      roboto_regular,
                                                      fontSize: 11.sp,
                                                      color: black_121212),
                                                ),
                                                Text(
                                                  transactionController
                                                      .transactionList[i]
                                                      .createdAt
                                                      ?.timeZoneName ??
                                                      "",
                                                  style: TextStyle(
                                                      fontFamily:
                                                      roboto_regular,
                                                      fontSize: 11.sp,
                                                      color: grey_aaaaaa),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Text(
                                                        "Event Name",
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontFamily:
                                                            roboto_regular,
                                                            color:
                                                            grey_aaaaaa),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Text(
                                                        transactionController
                                                            .transactionList[
                                                        i]
                                                            .event_details
                                                            ?.title ??
                                                            "",
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontFamily:
                                                            roboto_bold,
                                                            color:
                                                            black_121212),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  transactionController
                                                      .transactionList[i]
                                                      .total_price ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily: roboto_bold,
                                                      color: parrot_1ad04d),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),



                            ),
                          ],
                        ),
                      )



                          : SizedBox(),

                      if (transactionController.isPaginationLoadingForTransactions.value == true)
                        PaginationUtils().loader(),

                      /*--------------- Payouts Tab --------------*/
                      transactionController.payoutList.length > 0
                          ? Visibility(
                        visible: _isSecondLayout,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 15.h, left: 24.w, right: 24.w),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 10.w),
                              decoration: const BoxDecoration(
                                // border: Border.all(color: grey_e9ecec, width: 1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                                  color: grey_f5f5f5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SvgPicture.asset(
                                    search,
                                    color: grey_aaaaaa,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  const Expanded(
                                    child: TextField(
                                      style: TextStyle(
                                          color: black_121212,
                                          fontFamily: roboto_medium,
                                          fontSize: 14.0),
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: "Search.......",
                                        hintStyle: TextStyle(
                                            color: grey_aaaaaa,
                                            fontFamily: roboto_medium,
                                            fontSize: 14.0),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.next,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 16.h, left: 24.w, right: 24.w),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount:
                                  transactionController.payoutList.length,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 16.h),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20.h, horizontal: 16.w),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(4.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0x194343b2)
                                                  .withOpacity(0.15),
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 10.0,
                                              spreadRadius: 2.0,
                                            ), //BoxShadow
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Account",
                                                    style: TextStyle(
                                                        fontFamily:
                                                        roboto_regular,
                                                        fontSize: 11.sp,
                                                        color: grey_aaaaaa),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  Text(
                                                    "kjgjgjkgkjg",
                                                    style: TextStyle(
                                                        fontFamily:
                                                        roboto_bold,
                                                        fontSize: 14.sp,
                                                        color: black_121212),
                                                  ),
                                                ],
                                              ),
                                              flex: 1,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  Text(
                                                    "On",
                                                    style: TextStyle(
                                                        fontFamily:
                                                        roboto_regular,
                                                        fontSize: 11.sp,
                                                        color: grey_aaaaaa),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  Text(
                                                    transactionController
                                                        .payoutList[i]
                                                        .createdAt
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily:
                                                        roboto_regular,
                                                        fontSize: 11.sp,
                                                        color: black_121212),
                                                  ),
                                                ],
                                              ),
                                              flex: 2,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Requested",
                                                  style: TextStyle(
                                                      fontFamily:
                                                      roboto_regular,
                                                      fontSize: 11.sp,
                                                      color: orange_ff881a),
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Text(
                                                  transactionController
                                                      .payoutList[i]
                                                      .amount ??
                                                      "",
                                                  style: TextStyle(
                                                      fontFamily: roboto_bold,
                                                      fontSize: 16.sp,
                                                      color: black_121212),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      )
                          : SizedBox()
                    ],),
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
