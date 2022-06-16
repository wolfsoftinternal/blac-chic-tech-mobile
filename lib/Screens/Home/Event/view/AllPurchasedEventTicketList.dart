import 'package:blackchecktech/Layout/InputTextStaticFilter.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/Event/controller/EventDetailController.dart';
import 'package:blackchecktech/Screens/Home/Event/view/MyPurchasedEvent.dart';
import 'package:blackchecktech/Screens/Home/Event/view/PurchasedEventTicketWidget.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/pagination_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Layout/ToolbarBackOnly.dart';
import '../../CreateEvent/controller/EventController.dart';
import '../../Profile/model/EventListModel.dart';
import '../model/OrderListModel.dart';

class AllPurchasedEventTicketList extends StatefulWidget {
  final eventId;

  const AllPurchasedEventTicketList({
    Key? key,
    required this.eventId
  }) : super(key: key);

  @override
  _AllPurchasedEventTicketListState createState() =>
      _AllPurchasedEventTicketListState();
}

class _AllPurchasedEventTicketListState
    extends State<AllPurchasedEventTicketList> {
  EventController eventController = Get.put(EventController());

  bool isLayoutFirst = false;
  final _firstnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dynamic body = {
      'event_id': widget.eventId.toString(),
    };
    checkNet(context)
        .then((value) => eventController.getEventDetailsWithTransactions(body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
               // ToolbarWithHeaderCenterTitle("Purchased Admission Tickets "),
                Stack(
                  children: [
                    BackLayout(),
                    Padding(
                      padding:  EdgeInsets.only(left: 40.w,top: 13.h),
                      child: Center(
                        child: Text("Purchased Admission Tickets ",
                            style:  TextStyle(
                                color: black_121212,
                                fontWeight: FontWeight.w600,
                                fontFamily: helvetica_neu_bold,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.7,
                                fontSize: 16.sp),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  flex: 1,
                  child: eventController.eventDetailsWithTransactions.value.transactions != null
                      && ((eventController.eventDetailsWithTransactions.value.transactions!.length) > 0) ?
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: eventController.eventDetailsWithTransactions.value.transactions?.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, i) {
                        return InkWell(
                          onTap: () {
                            checkNet(context).then((value) {});
                          },
                          child: PurchasedEventTicketWidget(
                            orderDetails: eventController.eventDetailsWithTransactions.value.transactions?[i]??Order(),
                            eventDetails: eventController.eventDetailsWithTransactions.value,
                          ),
                        );
                      })
                  : CircularProgressIndicator(),
                ),
              ],
            )));
  }
}
