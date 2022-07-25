import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/transactions/model/TranscationListModel.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/FeedListDecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionStatus extends StatefulWidget {
  TransactionList transaction;
  TransactionStatus(this.transaction);

  @override
  State<TransactionStatus> createState() => _TransactionStatusState();
}

class _TransactionStatusState extends State<TransactionStatus> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  bool boolCopy = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      if(widget.transaction.payment_type == "out"){
        checkNet(context).then((value){
          controller.admireProfileAPI(context, widget.transaction.userId, null, 'transaction');
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          SizedBox(height: 60.h,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackLayout(),
                const Spacer(),
                Column(
                  children: [
                    Text(widget.transaction.payment_type == 'out'
                      ? "TRANSACTION DETAIL"
                      : widget.transaction.transaction_id != null
                      ? "TRANSACTION SUCCESS"
                      : "TRANSACTION FAILED",
                      style:  TextStyle(
                        color: widget.transaction.payment_type == 'out'
                        ? black_121212
                        : widget.transaction.transaction_id != null
                        ? Color(0xff24d39e)
                        : Color(0xfffa586a),
                        fontWeight: FontWeight.w900,
                        fontFamily: helvetica_neu_bold,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.8,
                        fontSize: 16.sp
                      ),
                      textAlign: TextAlign.center
                    ),
                    SizedBox(height: 5.h,),
                    Text(widget.transaction.createdAt == null || widget.transaction.createdAt.toString() == '' ? "" :
                      "on " + DateFormat("dd MMM yyyy - hh:mm a").format(widget.transaction.createdAt!),
                      style:  TextStyle(
                        color: black_121212,
                        fontWeight: FontWeight.w500,
                        fontFamily: helveticaNeue,
                        fontStyle: FontStyle.normal,
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.center
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(height: 46, width: 46,)
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(top: 36, right: 24, left: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(4.r),
                      boxShadow: [
                        BoxShadow(
                          color:  Color(0x019121212),
                          offset: const Offset(
                            0.0,
                            20.0,
                          ),
                          blurRadius: 30.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: widget.transaction.transaction_id == null
                    ? setHelveticaRegular("Payment request failed.\nPlease try after some time.", 12.sp, Color(0xfffa586a), FontWeight.w500, FontStyle.normal)
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Transaction ID",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: helvetica_neu_bold,
                                    color: Color(0xff273433),
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.start),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(widget.transaction.transaction_id ?? "",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: helveticaNeue,
                                    color: Color(0xff273433),
                                    fontStyle: FontStyle.normal,
                                  ),
                                  textAlign: TextAlign.left),
                            ],
                          ),
                          flex: 1,
                        ),
                        GestureDetector(
                          onTap: () async {
                            ClipboardData data = ClipboardData(text: widget.transaction.transaction_id.toString());
                            await Clipboard.setData(data);
                            setState(() {
                              boolCopy = true;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 3, bottom: 3, left: 14, right: 14),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: grey_e9ecec,
                                  width: 1,
                                )),
                            child: Text(boolCopy == false ? 'Copy' : "Copied",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: helveticaNeue,
                                  color: boolCopy == false
                                          ? skygreen_24d39e
                                          : grey_96a6a3,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.start),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(top: 16, right: 24, left: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(4.r),
                      boxShadow: [
                        BoxShadow(
                          color:  Color(0x019121212),
                          offset: const Offset(
                            0.0,
                            20.0,
                          ),
                          blurRadius: 30.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: InkWell(
                      onTap: (){
                        checkNet(context).then((value) {
                          controller.eventDetailAPI(context, widget.transaction.event_details!.id);
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Event Name",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: helvetica_neu_bold,
                                      color: Color(0xff273433),
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.start),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(widget.transaction.event_details?.title ?? "",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: helveticaNeue,
                                      color: Color(0xff273433),
                                      fontStyle: FontStyle.normal,
                                    ),
                                    textAlign: TextAlign.left
                                ),
                              ],
                            ),
                            flex: 1,
                          ),
                          Icon(Icons.arrow_forward_ios_rounded, color: black, size: 12.sp,),
                        ],
                      ),
                    ),
                  ),
                  widget.transaction.payment_type == "in"
                  ? widget.transaction.transAmount == null && widget.transaction.walletAmount == null 
                  ? Container()
                  : Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(top: 16, right: 24, left: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(4.r),
                      boxShadow: [
                        BoxShadow(
                          color:  Color(0x019121212),
                          offset: const Offset(
                            0.0,
                            20.0,
                          ),
                          blurRadius: 30.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Debited From",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: helvetica_neu_bold,
                            color: Color(0xff273433),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.start
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        widget.transaction.transAmount.toString() == "0" || widget.transaction.transAmount == null ? Container() :
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Debit/Credit Card",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: helveticaNeue,
                                  color: Color(0xff273433),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                            Text("\$" + widget.transaction.transAmount.toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: helvetica_neu_bold,
                                  color: Color(0xff273433),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left
                            ),
                          ],
                        ),
                        widget.transaction.transAmount.toString() == "0" || widget.transaction.transAmount == null ? Container() :
                        SizedBox(height: 5.h,),
                        widget.transaction.walletAmount.toString() == "0" || widget.transaction.walletAmount == null ? Container() :
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Wallet",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: helveticaNeue,
                                  color: Color(0xff273433),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                            Text("\$" + widget.transaction.walletAmount.toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helvetica_neu_bold,
                                  color: Color(0xff273433),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                  : Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(top: 16, right: 24, left: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(4.r),
                      boxShadow: [
                        BoxShadow(
                          color:  Color(0x019121212),
                          offset: const Offset(
                            0.0,
                            20.0,
                          ),
                          blurRadius: 30.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Customer",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: helvetica_neu_bold,
                            color: Color(0xff273433),
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.start
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Obx(
                          () => Text(
                            controller.details.value.fullName.toString().capitalize ?? controller.details.value.firstName.toString().capitalize ?? "",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: helveticaNeue,
                              color: Color(0xff273433),
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.left
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(top: 16, right: 24, left: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(4.r),
                      boxShadow: [
                        BoxShadow(
                          color:  Color(0x019121212),
                          offset: const Offset(
                            0.0,
                            20.0,
                          ),
                          blurRadius: 30.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Detail",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: helvetica_neu_bold,
                              color: Color(0xff273433),
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                            textAlign: TextAlign.start),
                        SizedBox(
                          height: 9.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ticket",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: helveticaNeue,
                                  color: Color(0xff273433),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                            Text("${widget.transaction.admission_type.toString().capitalizeFirst} (\$${widget.transaction.per_ticket_price})",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helvetica_neu_bold,
                                  color: Color(0xff273433),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                          ],
                        ),
                        SizedBox(height: 13.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Qty",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: helveticaNeue,
                                  color: Color(0xff273433),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                            Text(widget.transaction.total_tickets.toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helvetica_neu_bold,
                                  color: Color(0xff273433),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                          ],
                        ),
                        SizedBox(height: 13.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.transaction.payment_type == 'in'
                              ? "Total Paid"
                              : "Total Price",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: helveticaNeue,
                                  color: Color(0xff273433),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                            Text("\$" + widget.transaction.total_price.toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helvetica_neu_bold,
                                  color: Color(0xff273433),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                          ],
                        ),
                        widget.transaction.payment_type == 'in'
                        ? SizedBox()
                        : SizedBox(height: 13.h,),
                        widget.transaction.payment_type == 'in'
                        ? SizedBox()
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Platform Commission",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: helveticaNeue,
                                  color: Color(0xff273433),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                            Text("-\$" + widget.transaction.total_price.toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helvetica_neu_bold,
                                  color: Color(0xffff6d4e),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                          ],
                        ),
                        widget.transaction.payment_type == 'in'
                        ? SizedBox()
                        : SizedBox(height: 13.h,),
                        widget.transaction.payment_type == 'in'
                        ? SizedBox()
                        : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Net Earning",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: helveticaNeue,
                                  color: Color(0xff273433),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                            Text("\$" + widget.transaction.total_price.toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: helvetica_neu_bold,
                                  color: Color(0xff1ad04d),
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.left
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}