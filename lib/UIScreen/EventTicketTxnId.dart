import 'package:blackchecktech/Screens/Home/Event/model/OrderListModel.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/EventListModel.dart';
import 'package:blackchecktech/Styles/colors.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Layout/MySeparator.dart';

class EventTicketTxnId extends StatefulWidget {
  final EventList eventDetails;
  final int selectedAdmissionPosition;
  final OrderListModel orderDetails;

  const EventTicketTxnId(
      {Key? key,
      required this.eventDetails,
      required this.selectedAdmissionPosition,
      required this.orderDetails})
      : super(key: key);

  @override
  _EventTicketTxnIdState createState() => _EventTicketTxnIdState();
}

class _EventTicketTxnIdState extends State<EventTicketTxnId> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
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
                  SvgPicture.asset(
                    icon_cancel,
                    width: 30.w,
                    height: 30.h,
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
                                          fit: BoxFit.cover,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl: widget.eventDetails.poster!,
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              SvgPicture.asset(
                                            placeholder,
                                            fit: BoxFit.cover,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              SvgPicture.asset(
                                            placeholder,
                                            fit: BoxFit.cover,
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
                                          fontFamily: "NeueHelvetica",
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
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily:
                                                            "NeueHelvetica",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 11.sp),
                                                    textAlign: TextAlign.left),

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
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily:
                                                            "NeueHelvetica",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 11.sp),
                                                    textAlign: TextAlign.left),

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
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily:
                                                            "NeueHelvetica",
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 11.sp),
                                                    textAlign: TextAlign.left),

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
                                                    color: Color(0xff121212),
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: "Roboto",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12.0),
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
                                                      color: Color(0xff121212),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Roboto",
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 10.0),
                                                  textAlign: TextAlign.center),
                                            ),

                                            SizedBox(width: 10,),

                                            // GOLD - $50
                                            Text(
                                                (widget.orderDetails.data
                                                        ?.total_tickets ??0).toString(),
                                                style: TextStyle(
                                                    color: Color(0xff121212),
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: "Roboto",
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12.0),
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
                                              color: Color(0xff121212),
                                              fontWeight: FontWeight.w900,
                                              fontFamily: "Roboto",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.0),
                                          textAlign: TextAlign.right),

                                      SizedBox(
                                        width: 20.w,
                                      )
                                    ],
                                  ),

                                  SizedBox(
                                    height: 34.h,
                                  ),


                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "Debited from",
                                        style: TextStyle(
                                            color: AppColor.grey_acacac,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: "Roboto",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.left),
                                  ),


                                  SizedBox(
                                    height: 12.h,
                                  ),

                                  
                                  Row(children: [
                                    Text(
                                        "Wallet",
                                        style: TextStyle(
                                            color: Color(0xff121212),
                                            fontWeight: FontWeight.w900,
                                            fontFamily: "Roboto",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.right),


                                    Expanded(
                                      child: Text(
                                          "5",
                                          style: TextStyle(
                                              color: Color(0xff121212),
                                              fontWeight: FontWeight.w900,
                                              fontFamily: "Roboto",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.0),
                                          textAlign: TextAlign.right),
                                    ),

                                    SizedBox(
                                      width: 20.w,
                                    )

                                  ],),


                                  SizedBox(
                                    height: 12.h,
                                  ),


                                  Row(children: [
                                    Text(
                                        "****7657689",
                                        style: TextStyle(
                                            color: Color(0xff121212),
                                            fontWeight: FontWeight.w900,
                                            fontFamily: "Roboto",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0),
                                        textAlign: TextAlign.right),


                                    Expanded(
                                      child: Text(
                                          "255",
                                          style: TextStyle(
                                              color: Color(0xff121212),
                                              fontWeight: FontWeight.w900,
                                              fontFamily: "Roboto",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.0),
                                          textAlign: TextAlign.right),
                                    ),

                                    SizedBox(
                                      width: 40.w,
                                    )

                                  ],),

                                  SizedBox(
                                    height: 20.w,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Opacity(
                                      opacity: 0.699999988079071,
                                      child: Text(
                                          "Trxn ID " + widget.orderDetails.data!.transaction_id!,
                                          style: TextStyle(
                                              color: Color(0xff121212),
                                              fontWeight:
                                              FontWeight.w400,
                                              fontFamily: "Roboto",
                                              fontStyle:
                                              FontStyle.normal,
                                              fontSize: 10.0),
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
                                  Image.asset(
                                    barcode,
                                    width: double.infinity,
                                    height: 70.h,
                                    fit: BoxFit.fill,
                                  )
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


    // Kill all previous screen
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()
        ),
        ModalRoute.withName("/Home")
    );

  }
}
