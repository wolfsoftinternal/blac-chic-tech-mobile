import 'package:blackchecktech/Screens/Home/Event/model/OrderListModel.dart';
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
import 'package:syncfusion_flutter_barcodes/barcodes.dart';


import '../../../../Layout/MySeparator.dart';
import '../../../../Utilities/Constant.dart';


class PurchasedEventTicketWidget extends StatefulWidget {
  final EventList eventDetails;
  final Order orderDetails;

  const PurchasedEventTicketWidget({
    Key? key,
    required this.eventDetails,
    required this.orderDetails,
  }) : super(key: key);

  @override
  _PurchasedEventTicketWidgetState createState() =>
      _PurchasedEventTicketWidgetState();
}

class _PurchasedEventTicketWidgetState extends State<PurchasedEventTicketWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: 24.w, right: 24.w, top: 10.h, bottom: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

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
                                    borderRadius: BorderRadius.circular(4.r),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xfff5f5f5))),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:  EdgeInsets.all(8.r),
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
                                              height: 8.h,
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
                                                        helvetica_neu_bold,
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
                                        height: 53.h,
                                        decoration: const BoxDecoration(
                                            color: view_line_f4f6f6)),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:  EdgeInsets.all(8.r),
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
                                              height: 8.h,
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
                                                    helvetica_neu_bold,
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
                                        height: 53.h,
                                        decoration: const BoxDecoration(
                                            color: view_line_f4f6f6)),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:  EdgeInsets.all(8.r),
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
                                              height: 8.h,
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
                                                    helvetica_neu_bold,
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
                                height: 12.h,
                              ),

                              Padding(
                                padding:  EdgeInsets.only(left: 10.w,right: 10.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            (widget.orderDetails
                                                        .admission_type ??
                                                    "") +
                                                " - \$" +
                                                (widget.orderDetails
                                                        .per_ticket_price ??
                                                    ""),
                                            style: TextStyle(
                                                color: black_121212,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: roboto_bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.left),
                                        Padding(
                                          padding:  EdgeInsets.only(right: 15.w),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
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
                                                width: 4.w,
                                              ),

                                              // GOLD - $50
                                              Text(
                                                  (widget.orderDetails.total_tickets ??
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
                                            widget.orderDetails.total_price ??
                                                "",
                                            style: TextStyle(
                                                color: black_121212,
                                                fontWeight: FontWeight.w900,
                                                fontFamily: roboto_bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 12.sp),
                                            textAlign: TextAlign.right),


                                      ],
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),

                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Debited from",
                                          style: TextStyle(
                                              color: grey_aaaaaa,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: roboto_bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.sp),
                                          textAlign: TextAlign.left),
                                    ),

                                    widget.orderDetails.wallet_amount == null && widget.orderDetails.wallet_amount.toString() != '0' ? Container() :
                                    SizedBox(
                                      height: 6.h,
                                    ),

                                    widget.orderDetails.wallet_amount != null && widget.orderDetails.wallet_amount.toString() != '0'
                                    ? Row(
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
                                                  (widget.orderDetails.wallet_amount ??
                                                      0)
                                                      .toString(),
                                              style: TextStyle(
                                                  color: black_121212,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: roboto_bold,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.sp),
                                              textAlign: TextAlign.right),
                                        ),

                                      ],
                                    ) : Container(),

                                    widget.orderDetails.trans_amount == null && widget.orderDetails.trans_amount.toString() != '0' ? Container() :
                                    SizedBox(
                                      height: 6.h,
                                    ),

                                    widget.orderDetails.trans_amount != null && widget.orderDetails.trans_amount.toString() != '0'
                                    ? Row(
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
                                                  (widget.orderDetails.trans_amount??0)
                                                      .toString(),
                                              style: TextStyle(
                                                  color: black_121212,
                                                  fontWeight: FontWeight.w900,
                                                  fontFamily: roboto_regular,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.sp),
                                              textAlign: TextAlign.right),
                                        ),

                                      ],
                                    ) : Container(),


                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Opacity(
                                        opacity: 0.699999988079071,
                                        child: Text(
                                            "Trxn ID " +
                                                (widget.orderDetails
                                                    .transaction_id??""),
                                            style: TextStyle(
                                                color: Color(0xff121212),
                                                fontWeight: FontWeight.w400,
                                                fontFamily: roboto_regular,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 11.sp),
                                            textAlign: TextAlign.center),
                                      ),
                                    ),

                                  ],
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
                                      fontFamily: helveticaNeue,
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
                                      child:SfBarcodeGenerator(value: widget.orderDetails.barcode??"")
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
    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // Navigator.pop(context);
  }
}
