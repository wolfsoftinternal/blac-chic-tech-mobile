import 'package:blackchecktech/Screens/Home/Event/model/OrderListModel.dart';
import 'package:blackchecktech/Screens/Home/Event/view/AllPurchasedEventTicketList.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/EventListModel.dart';
import 'package:blackchecktech/Styles/colors.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';

import '../../../../Layout/MySeparator.dart';
import '../../../../Utilities/Constant.dart';

class EventTicketForSuccess extends StatefulWidget {
  final EventList eventDetails;
  final int selectedAdmissionPosition;
  final OrderListModel orderDetails;
  final int debitedFromWallet;
  final int debitedFromPayStack;

  const EventTicketForSuccess({
    Key? key,
    required this.eventDetails,
    required this.selectedAdmissionPosition,
    required this.orderDetails,
    required this.debitedFromWallet,
    required this.debitedFromPayStack,
  }) : super(key: key);

  @override
  _EventTicketForSuccessState createState() => _EventTicketForSuccessState();
}

class _EventTicketForSuccessState extends State<EventTicketForSuccess> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: light_grey_f2f2f2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 40.h, bottom: 24.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                      icon_cancel,
                      width: 30.w,
                      height: 30.h,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),

                  // Your ticket was successfully purchased.
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Text("Your ticket was successfully purchased.",
                        style: TextStyle(
                            color: black_121212,
                            fontWeight: FontWeight.w900,
                            fontFamily: "NeueHelvetica",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.sp),
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  // Your purchase was successfully processed and has been sent to your email.
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                        "Your purchase was successfully processed and has been sent to your email.",
                        style: TextStyle(
                            color: const Color(0xff5d5d5d),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NeueHelvetica",
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp),
                        textAlign: TextAlign.center),
                  ),

                  SizedBox(
                    height: 32.h,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: white_ffffff,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(30, 0),
                                blurRadius: 60,
                                spreadRadius: 5)
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  widget.eventDetails.poster == null
                                      ? SvgPicture.asset(
                                          placeholder,
                                          width: double.infinity,
                                          height: 203.h,
                                          fit: BoxFit.fill,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl: widget.eventDetails.poster!,
                                          width: double.infinity,
                                          height: 203.h,
                                          fit: BoxFit.fill,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              SvgPicture.asset(
                                            placeholder,
                                            fit: BoxFit.fill,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              SvgPicture.asset(
                                            placeholder,
                                            height: 203.h,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                  SizedBox(
                                    height: 24.h,
                                  ),

                                  // Startup Bootcamp 2022
                                  Text(widget.eventDetails.title ?? "",
                                      style: TextStyle(
                                          color: black_121212,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: helvetica_neu_bold,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 18.sp),
                                      textAlign: TextAlign.left),

                                  SizedBox(
                                    height: 16.h,
                                  ),

                                  Container(
                                    decoration: BoxDecoration(
                                        color: white_ffffff,
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xfff5f5f5))),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // NAME
                                                Text("NAME",
                                                    style: TextStyle(
                                                        color: grey_aaaaaa,
                                                        fontFamily:
                                                            helvetica_neu_bold,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 11.sp),
                                                    textAlign: TextAlign.left),

                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                // Fade Ogunro
                                                Text(
                                                    widget.eventDetails.venue ??
                                                        "",
                                                    style: TextStyle(
                                                        color: black_121212,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily:
                                                            "NeueHelvetica",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: 12.sp),
                                                    textAlign: TextAlign.left)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: 1,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                                color: view_line_f4f6f6)),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // NAME
                                                Text("DATE",
                                                    style: TextStyle(
                                                        color: grey_aaaaaa,
                                                        fontFamily:
                                                            helvetica_neu_bold,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 11.sp),
                                                    textAlign: TextAlign.left),

                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                // Fade Ogunro
                                                Text(
                                                    widget.eventDetails
                                                            .startDate ??
                                                        "",
                                                    style: TextStyle(
                                                        color: black_121212,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily:
                                                            "NeueHelvetica",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 12.sp),
                                                    textAlign: TextAlign.left)
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                            width: 1,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                                color: view_line_f4f6f6)),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // NAME
                                                Text("START TIME",
                                                    style: TextStyle(
                                                        color: grey_aaaaaa,
                                                        fontFamily:
                                                            helvetica_neu_bold,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 11.sp),
                                                    textAlign: TextAlign.left),

                                                SizedBox(
                                                  height: 5.h,
                                                ),

                                                // Fade Ogunro
                                                Text(
                                                    widget.eventDetails
                                                            .startTime ??
                                                        "",
                                                    style: TextStyle(
                                                        color: black_121212,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily:
                                                            "NeueHelvetica",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 12.sp),
                                                    textAlign: TextAlign.left)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 18.h,
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // GOLD - $50
                                            Text(
                                                (widget
                                                            .eventDetails
                                                            .admissionData?[widget
                                                                .selectedAdmissionPosition]
                                                            .category ??
                                                        "") +
                                                    " - \$" +
                                                    (widget
                                                            .eventDetails
                                                            .admissionData?[widget
                                                                .selectedAdmissionPosition]
                                                            .price ??
                                                        ""),
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: roboto_bold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12.sp),
                                                textAlign: TextAlign.left),

                                            // Trxn ID 12321312112113
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Opacity(
                                              opacity: 0.699999988079071,
                                              child: Text("Qty",
                                                  style: TextStyle(
                                                      color: black_121212,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily:
                                                          roboto_regular,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 10.sp),
                                                  textAlign: TextAlign.center),
                                            ),

                                            SizedBox(
                                              width: 10,
                                            ),

                                            // GOLD - $50
                                            Text(
                                                (widget.orderDetails.data
                                                            ?.total_tickets ??
                                                        0)
                                                    .toString(),
                                                style: TextStyle(
                                                    color: black_121212,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: roboto_bold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12.sp),
                                                textAlign: TextAlign.left),

                                            // Trxn ID 12321312112113
                                          ],
                                        ),
                                      ),
                                      // $100
                                      Text(
                                          widget.orderDetails.data
                                                  ?.total_price ??
                                              "",
                                          style: TextStyle(
                                              color: black_121212,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: roboto_bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.sp),
                                          textAlign: TextAlign.right),

                                      SizedBox(
                                        width: 20.w,
                                      )
                                    ],
                                  ),

                                  SizedBox(
                                    height: 20.h,
                                  ),

                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Debited from",
                                        style: TextStyle(
                                            color: grey_aaaaaa,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: roboto_bold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp),
                                        textAlign: TextAlign.left),
                                  ),
                                  widget.debitedFromWallet.toString() != '0' ?
                                  SizedBox(
                                    height: 12.h,
                                  ): Container(),
                                  widget.debitedFromWallet.toString() != '0' ?
                                  Row(
                                    children: [
                                      Text("Wallet",
                                          style: TextStyle(
                                              color: black_121212,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: roboto_regular,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.sp),
                                          textAlign: TextAlign.right),
                                      Expanded(
                                        child: Text(
                                            SharePreData.strDollar +
                                                widget.debitedFromWallet
                                                    .toString(),
                                            style: TextStyle(
                                                color: black_121212,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: roboto_bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.right),
                                      ),
                                      widget.debitedFromWallet.toString() != '0' ?
                                      SizedBox(
                                        width: 20.w,
                                      ): Container()
                                    ],
                                  ) : Container(),
                                  widget.debitedFromPayStack.toString() == '0' ? Container() :
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  widget.debitedFromPayStack.toString() == '0' ? Container() :
                                  Row(
                                    children: [
                                      Text("****7657689",
                                          style: TextStyle(
                                              color: black_121212,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: roboto_regular,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.sp),
                                          textAlign: TextAlign.right),
                                      Expanded(
                                        child: Text(
                                            SharePreData.strDollar +
                                                widget.debitedFromPayStack
                                                    .toString(),
                                            style: TextStyle(
                                                color: black_121212,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: roboto_regular,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.right),
                                      ),
                                      widget.debitedFromPayStack.toString() == '0' ? Container() :
                                      SizedBox(
                                        width: 20.w,
                                      )
                                    ],
                                  ),

                                  SizedBox(
                                    height: 14.w,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Opacity(
                                      opacity: 0.699999988079071,
                                      child: Text(
                                          "Trxn ID " +
                                              widget.orderDetails.data!
                                                  .transaction_id!,
                                          style: TextStyle(
                                              color: Color(0xff121212),
                                              fontWeight: FontWeight.w400,
                                              fontFamily: roboto_regular,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 11.sp),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 52.h,
                                  ),

                                  // BARCODE TICKET
                                  Text("BARCODE TICKET",
                                      style: TextStyle(
                                          color: const Color(0xffaaaaaa),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "NeueHelvetica",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 8.sp),
                                      textAlign: TextAlign.left),
                                  SizedBox(
                                    height: 12.h,
                                  ),

                                  Center(
                                      child: Container(
                                          width: double.infinity,
                                          height: 70.h,
                                          child:SfBarcodeGenerator(value: widget.orderDetails.data?.barcode??"")
                                      )
                                  ),

                                  // Image.asset(
                                  //   barcode,
                                  //   width: double.infinity,
                                  //   height: 70.h,
                                  //   fit: BoxFit.fill,
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 125),
                        child: MySeparator(color: Color(0xffeaecec)),
                      ),
                      Positioned(
                          left: -25,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 100),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: Color(0xfff5f5f5),
                                  shape: BoxShape.circle),
                            ),
                          )),
                      Positioned(
                          right: -25,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 100),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                  color: Color(0xfff5f5f5),
                                  shape: BoxShape.circle),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // Navigator.pop(context);
  }
}
