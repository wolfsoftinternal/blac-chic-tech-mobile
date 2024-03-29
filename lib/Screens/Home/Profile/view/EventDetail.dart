import 'dart:convert';
import 'dart:io';

import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/view/InvitePeople.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/RegisteredPeople.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:social_share/social_share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../Utils/CommonWidget.dart';
import '../model/InstalledAppModel.dart';
import '../../Event/view/AllPurchasedEventTicketList.dart';

class EventDetail extends StatefulWidget {
  final type;
  final id;
  const EventDetail({Key? key, this.type, this.id}) : super(key: key);

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  EventController eventController = Get.put(EventController());
  VideoController videoController = Get.put(VideoController());

  var userId;
  late GoogleMapController _controller;
  double lat = 20.5937;
  double lng = 78.9629;
  Set<Marker> markers = {};
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  late LocationData _currentPosition;
  Location location = Location();
  bool isUseWallet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lat = double.parse(controller.eventDetails.value.latitude!);
    lng = double.parse(controller.eventDetails.value.longitude!);
    eventController.selectedList.clear();
    if (controller.eventDetails.value.type == 'invite_only') {
      if (controller.eventDetails.value.invitedUsers != null) {
        for (var item in controller.eventDetails.value.invitedUsers!) {
          eventController.selectedList.add(item);
        }
      }
    }
    init();
    getLoc();
    checkNet(context).then((value) async {
      await controller.registeredUserApi(
          context, controller.eventDetails.value.id.toString());
      await controller.userProfileAPI(context, false, false);
      controller.userPageNumber.value = 0;
      videoController.userList.clear();
      await controller.eventInviteUsersList(context, widget.id);
    });
  }

  init() async {
    var preferences = MySharedPref();
    SignupModel? myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    userId = myModel?.data!.id;
    setState(() {});
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
  }

  getLoc() async {
    // bool _serviceEnabled;
    // PermissionStatus _permissionGranted;

    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {
    //     return;
    //   }
    // }

    // _permissionGranted = await location.hasPermission();
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted = await location.requestPermission();
    //   if (_permissionGranted != PermissionStatus.granted) {
    //     return;
    //   }
    // }

    // checking internet
    checkNet(context).then((value) async {
      // returning when no connection
      if (!value) return;
    });

    setState(() {
      markers.clear();
      markers.add(Marker(
        markerId: const MarkerId('0'),
        position: LatLng(lat, lng),
        icon: sourceIcon,
      ));
    });
  }

  displayBottomSheet(category, price, selectedPositionOfAdmission) {
    controller.total.value = int.parse(price);
    controller.count.value = 1;
    setFinalValue();
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0))),
              child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    StatefulBuilder(builder: (context, setState) {
                      return Obx(
                        () => Column(
                          children: [
                            SizedBox(
                              height: 8.h,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 50,
                                  height: 3,
                                  decoration: BoxDecoration(
                                      color: grey_3f3f3f.withOpacity(0.4),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50.r),
                                      )),
                                )),
                            SizedBox(
                              height: 24.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 24.w, right: 24.w),
                              child: setRoboto("CONFIRMATION", 16.sp,
                                  black_121212, FontWeight.w900),
                            ),
                            SizedBox(
                              height: 23.5.h,
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: Color(0xfff4f6f6),
                            ),
                            SizedBox(
                              height: 23.5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 24.0, right: 24.0),
                              child: Column(
                                children: [
                                  setRoboto(
                                      "Ticket ${controller.eventDetails.value.title!}",
                                      14.sp,
                                      black_121212,
                                      FontWeight.w900),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: grey_f5f5f5,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 15.5.h,
                                          bottom: 15.5.h,
                                          left: 16.w,
                                          right: 16.w),
                                      child: Row(
                                        children: [
                                          setRoboto(
                                              "$category \$${controller.total.value}",
                                              12.sp,
                                              black_121212,
                                              FontWeight.w900),
                                          Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: white_ffffff,
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.r),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          if (controller.count
                                                                  .value !=
                                                              1) {
                                                            controller.count--;
                                                          }
                                                          controller
                                                                  .total.value =
                                                              controller.count
                                                                      .value *
                                                                  int.parse(
                                                                      price);

                                                          setFinalValue();
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.remove,
                                                        color: grey_3f3f3f,
                                                        size: 12,
                                                      )),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  setRoboto(
                                                      controller.count.value
                                                          .toString(),
                                                      12.sp,
                                                      black_121212,
                                                      FontWeight.w900),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          controller.count++;
                                                          controller
                                                                  .total.value =
                                                              controller.count
                                                                      .value *
                                                                  int.parse(
                                                                      price);

                                                          setFinalValue();
                                                        });
                                                      },
                                                      child: const Icon(
                                                        Icons.add,
                                                        color: grey_3f3f3f,
                                                        size: 12,
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Visibility(
                                    visible:
                                        controller.walletDetails.value.wallet !=
                                                null &&
                                            double.parse(controller
                                                            .walletDetails
                                                            .value
                                                            .wallet ??
                                                        "0")
                                                    .toInt() >
                                                0,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: setRoboto("Wallet", 14.sp,
                                              black_121212, FontWeight.w800),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                setRoboto(
                                                    "Use Wallet Balance",
                                                    12.sp,
                                                    black_121212,
                                                    FontWeight.w500),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                setRoboto(
                                                    SharePreData.strDollar +
                                                        (controller
                                                                .walletDetails
                                                                .value
                                                                .wallet ??
                                                            "0"),
                                                    14.sp,
                                                    orange_ff881a,
                                                    FontWeight.w600),
                                              ],
                                            ),

                                            Spacer(),

                                            // Expanded(
                                            //   flex: 1,
                                            Theme(
                                              data: ThemeData(
                                                primarySwatch: Colors.orange,
                                                unselectedWidgetColor:
                                                    Colors.grey, // Your color
                                              ),
                                              child: Checkbox(
                                                shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      width: 0.5,
                                                      color: grey_96a6a3,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                value:
                                                    controller.isWallet.value,
                                                onChanged: (value) {
                                                  setState(() {
                                                    controller.isWallet.value =
                                                        value ?? false;
                                                    setFinalValue();
                                                  });
                                                },
                                              ),
                                            ),
                                            // )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: setRoboto(
                                              "PAYMENT METHOD",
                                              12.sp,
                                              grey_aaaaaa,
                                              FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: grey_f5f5f5,
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16.0,
                                          bottom: 16.0,
                                          left: 17.0,
                                          right: 17.0),
                                      child: Row(
                                        children: [
                                          setRoboto("Credit/Debit Card", 12,
                                              black_121212, FontWeight.w900),
                                          const Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  BlackButton(
                                      controller.isWallet.value == true
                                          ? 'Pay Now'
                                          : 'PAY \$${controller.finalTotal.value}',
                                      white_ffffff, () {
                                    checkNet(context).then((value) {
                                      String eventId = controller
                                          .eventDetails.value.id
                                          .toString();
                                      String admission_type = controller
                                              .eventDetails
                                              .value
                                              .admissionData?[
                                                  selectedPositionOfAdmission]
                                              .category ??
                                          "";

                                      String total_tickets =
                                          controller.count.toString();
                                      String status = "0";

                                      dynamic body = {
                                        'event_id': eventId,
                                        'admission_type': admission_type,
                                        'total_tickets': total_tickets,
                                        'status': status,
                                      };

                                      controller.OrderCreateAPI(context, body,
                                          selectedPositionOfAdmission);
                                    });
                                  }),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 350.h,
                          width: MediaQuery.of(context).size.width,
                          child: controller.eventDetails.value.poster == null
                              ? SvgPicture.asset(
                                  placeholder,
                                  fit: BoxFit.cover,
                                )
                              : CachedNetworkImage(
                                  imageUrl:
                                      controller.eventDetails.value.poster!,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 60.h),
                          child: BackLayout(),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.eventDetails.value.is_purchased == 0
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.only(
                                    left: 24.w, right: 24.w, top: 16.h),
                                child: Container(
                                    height: 61.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF1c2535),
                                            Color(0xFF04080f),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          //    stops: [0.0, 1.0],
                                          tileMode: TileMode.clamp),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x26121212),
                                          offset: Offset(
                                            0.0,
                                            5.0,
                                          ),
                                          blurRadius: 7.0,
                                          spreadRadius: 2.0,
                                        ), //BoxShadow
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 24.w),
                                          child: // Admission

                                              Text("Admission",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily:
                                                          helvetica_neu_bold,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 16.sp),
                                                  textAlign: TextAlign.left),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(AllPurchasedEventTicketList(
                                                eventId: controller
                                                    .eventDetails.value.id));
                                          },
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 12.w),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                                color: orange_ff881a,
                                              ),
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 32.w,
                                                      right: 32.w,
                                                      top: 9.h,
                                                      bottom: 9.h),
                                                  child: // Invite Only
                                                      Text("View",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontFamily:
                                                                  roboto_bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 16.sp),
                                                          textAlign:
                                                              TextAlign.left)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                        Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: controller.eventDetails.value.type ==
                                  'ticket_price'
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Admission
                                    Padding(
                                      padding: EdgeInsets.only(left: 24.w),
                                      child: Text("Admission Tickets",
                                          style: TextStyle(
                                              color: black_121212,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: roboto_bold,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          textAlign: TextAlign.left),
                                    ),
                                    // setHelceticaBold(
                                    //     "Admission Fees",
                                    //     14.sp,
                                    //     black_121212,
                                    //     FontWeight.w500,
                                    //     FontStyle.normal),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      height: 128.h,
                                      // width: MediaQuery.of(context).size.width,
                                      child: ListView.separated(
                                          primary: false,
                                          shrinkWrap: true,
                                          padding: EdgeInsets.only(
                                              left: 24.w,
                                              right: 24.w,
                                              bottom: 18.h),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                          //   padding: EdgeInsets.only(left: 24.w,right: 24.w),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.eventDetails
                                              .value.admissionData!.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              width: 120.w,
                                              //  height: 100.h,
                                              //       margin: EdgeInsets.only(bottom: 18,top: 10),
                                              padding: widget.type == 'upcoming'
                                                  ? EdgeInsets.only(
                                                      top: 8.h,
                                                      bottom: 8.h,
                                                      left: 12.w,
                                                      right: 12.w)
                                                  : EdgeInsets.only(
                                                      left: 25.w,
                                                      right: 25.w,
                                                      top: 10.h,
                                                      bottom: 10.h),
                                              decoration: BoxDecoration(
                                                  color:
                                                      widget.type == 'upcoming'
                                                          ? black_121212
                                                          : white_ffffff,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: black_121212
                                                          .withOpacity(0.05),
                                                      spreadRadius: 2,
                                                      blurRadius: 12,
                                                      offset: Offset(0, 10),
                                                    )
                                                  ]),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  // Bronze
                                                  Text(
                                                      controller
                                                          .eventDetails
                                                          .value
                                                          .admissionData![index]
                                                          .category!
                                                          .capitalize!,
                                                      style: TextStyle(
                                                          color: widget.type ==
                                                                  'upcoming'
                                                              ? white_ffffff
                                                              : black_121212,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              roboto_regular,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 16.sp),
                                                      textAlign:
                                                          TextAlign.center),
                                                  // setHelveticaMedium(
                                                  //     controller
                                                  //         .eventDetails
                                                  //         .value
                                                  //         .admissionData![index]
                                                  //         .category!,
                                                  //     16,
                                                  //     hite_ffffff : black_121212,
                                                  //     FontWeight.w500,
                                                  //     FontStyle.normal),

                                                  // $15
                                                  Text(
                                                      "\$${double.parse(controller.eventDetails.value.admissionData![index].price!).toInt()}",
                                                      style: TextStyle(
                                                          color: widget.type ==
                                                                  'upcoming'
                                                              ? white_ffffff
                                                              : orange_ff881a,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily:
                                                              roboto_bold,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontSize: 16.sp),
                                                      textAlign:
                                                          TextAlign.left),

                                                  // setHelveticaMedium(
                                                  //     "\$${double.parse(controller.eventDetails.value.admissionData![index].price!).toInt()}",
                                                  //     16,
                                                  //     hite_ffffff : orange_ff881a,
                                                  //     FontWeight.w500,
                                                  //     FontStyle.normal),

                                                  widget.type == 'upcoming'
                                                      ? Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 8.h),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              displayBottomSheet(
                                                                  controller
                                                                      .eventDetails
                                                                      .value
                                                                      .admissionData![
                                                                          index]
                                                                      .category,
                                                                  controller
                                                                      .eventDetails
                                                                      .value
                                                                      .admissionData![
                                                                          index]
                                                                      .price,
                                                                  index);
                                                            },
                                                            child: Container(
                                                              height: 31.h,
                                                              width: 90.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                                color:
                                                                    orange_ff881a,
                                                              ),
                                                              child: Center(
                                                                child:
                                                                    // Buy
                                                                    Text("Buy",
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .white,
                                                                            fontWeight: FontWeight
                                                                                .w600,
                                                                            fontFamily:
                                                                                roboto_bold,
                                                                            fontStyle: FontStyle
                                                                                .normal,
                                                                            fontSize: 14
                                                                                .sp),
                                                                        textAlign:
                                                                            TextAlign.center),

                                                                // setHelveticaMedium(
                                                                //     'Buy',
                                                                //     16,
                                                                //     white_ffffff,
                                                                //     FontWeight.w500,
                                                                //     FontStyle.normal),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                )
                              : controller.eventDetails.value.type == 'free'
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.w, right: 24.w),
                                      child: Container(
                                          height: 61.h,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            gradient: const LinearGradient(
                                                colors: [
                                                  Color(0xFF1c2535),
                                                  Color(0xFF04080f),
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                //    stops: [0.0, 1.0],
                                                tileMode: TileMode.clamp),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x26121212),
                                                offset: Offset(
                                                  0.0,
                                                  5.0,
                                                ),
                                                blurRadius: 7.0,
                                                spreadRadius: 2.0,
                                              ), //BoxShadow
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.w),
                                                child: // Admission

                                                    Text("Admission",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                helvetica_neu_bold,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            fontSize: 16.sp),
                                                        textAlign:
                                                            TextAlign.left),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 12.w),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r),
                                                    color: orange_ff881a,
                                                  ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 14.w,
                                                          right: 14.w,
                                                          top: 9.h,
                                                          bottom: 9.h),
                                                      child: // Invite Only
                                                          Text("FREE",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontFamily:
                                                                      roboto_bold,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize:
                                                                      16.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left)),
                                                ),
                                              ),
                                            ],
                                          )),
                                    )
                                  : Padding(
                                      padding: EdgeInsets.only(
                                          left: 24.w, right: 24.w),
                                      child: Container(
                                          height: 61.h,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            gradient: const LinearGradient(
                                                colors: [
                                                  Color(0xFF1c2535),
                                                  Color(0xFF04080f),
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                //    stops: [0.0, 1.0],
                                                tileMode: TileMode.clamp),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x26121212),
                                                offset: Offset(
                                                  0.0,
                                                  5.0,
                                                ),
                                                blurRadius: 7.0,
                                                spreadRadius: 2.0,
                                              ), //BoxShadow
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24.w),
                                                child: Text("Admission",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            helvetica_neu_bold,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontSize: 16.sp),
                                                    textAlign: TextAlign.left),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 12.w),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r),
                                                    color: orange_ff881a,
                                                  ),
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 14.w,
                                                          right: 14.w,
                                                          top: 9.h,
                                                          bottom: 9.h),
                                                      child: // Invite Only
                                                          Text("Invite Only",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontFamily:
                                                                      roboto_bold,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize:
                                                                      16.sp),
                                                              textAlign:
                                                                  TextAlign
                                                                      .left)),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                        ),
                        controller.eventDetails.value.type == 'invite_only'
                            ? widget.type != 'upcoming'
                                ? Column(
                                    children: [
                                      eventController.selectedList.isNotEmpty
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  top: 24.h,
                                                  left: 24.w,
                                                  right: 24.w),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: eventController
                                                                .selectedList
                                                                .length ==
                                                            1
                                                        ? 25
                                                        : eventController
                                                                    .selectedList
                                                                    .length ==
                                                                2
                                                            ? 35
                                                            : 55,
                                                    height: 25.h,
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      children: <Widget>[
                                                        if (eventController
                                                            .selectedList
                                                            .isNotEmpty)
                                                          SizedBox(
                                                            height: 17.5.h,
                                                            width: 17.5.w,
                                                            child:
                                                                CircularProfileAvatar(
                                                              '',
                                                              imageFit:
                                                                  BoxFit.fill,
                                                              child: eventController
                                                                          .selectedList[
                                                                              0]
                                                                          .image ==
                                                                      null
                                                                  ? SvgPicture
                                                                      .asset(
                                                                          placeholder)
                                                                  : Image
                                                                      .network(
                                                                      eventController
                                                                          .selectedList[
                                                                              0]
                                                                          .image!,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                              borderColor:
                                                                  Colors.white,
                                                              borderWidth: 1,
                                                              elevation: 2,
                                                              radius: 50,
                                                            ),
                                                          ),
                                                        if (eventController
                                                                .selectedList
                                                                .length >=
                                                            2)
                                                          Positioned(
                                                            left: 10.0,
                                                            child: SizedBox(
                                                              height: 17.5,
                                                              width: 17.5,
                                                              child:
                                                                  CircularProfileAvatar(
                                                                '',
                                                                child: eventController
                                                                            .selectedList[
                                                                                1]
                                                                            .image ==
                                                                        null
                                                                    ? SvgPicture
                                                                        .asset(
                                                                            placeholder)
                                                                    : Image
                                                                        .network(
                                                                        eventController
                                                                            .selectedList[1]
                                                                            .image!,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                borderColor:
                                                                    Colors
                                                                        .white,
                                                                borderWidth: 1,
                                                                elevation: 2,
                                                                radius: 50,
                                                              ),
                                                            ),
                                                          ),
                                                        if (eventController
                                                                .selectedList
                                                                .length >
                                                            2)
                                                          Positioned(
                                                            left: 20.0,
                                                            child: SvgPicture
                                                                .asset(
                                                              black_more_dot_icon,
                                                              width: 19,
                                                              height: 19,
                                                            ),
                                                          )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 2, left: 5.0),
                                                    child: setRoboto(
                                                        eventController
                                                                .selectedList
                                                                .length
                                                                .toString() +
                                                            " People Invited",
                                                        14.sp,
                                                        Color(0xff04080f),
                                                        FontWeight.w700),
                                                  ),
                                                  const Spacer(),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(InvitePeople(
                                                        true,
                                                        eventController
                                                            .selectedList,
                                                      ))!
                                                          .then((value) =>
                                                              setState(() {}));
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 2.h),
                                                      child: setRoboto(
                                                          "VIEW",
                                                          12.sp,
                                                          orange_ff881a,
                                                          FontWeight.w700),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(),
                                      widget.type == null
                                          ? Padding(
                                              padding: EdgeInsets.only(
                                                  left: 24.w,
                                                  right: 24.w,
                                                  top: 20.h),
                                              child: InkWell(
                                                onTap: () {
                                                  if (controller
                                                          .isSearched.value ==
                                                      true) {
                                                    controller.isSearched
                                                        .value = false;
                                                    checkNet(context)
                                                        .then((value) async {
                                                      controller.userPageNumber
                                                          .value = 0;
                                                      videoController.userList
                                                          .clear();
                                                      await controller
                                                          .eventInviteUsersList(
                                                              context,
                                                              widget.id);

                                                      Future.delayed(
                                                          Duration(
                                                              milliseconds:
                                                                  500), () {
                                                        for (var item
                                                            in videoController
                                                                .userList) {
                                                          for (var selectedItem
                                                              in controller
                                                                  .selectedList) {
                                                            if (selectedItem
                                                                    .id ==
                                                                item.id) {
                                                              item.isSpeakerSelected =
                                                                  selectedItem
                                                                      .isSpeakerSelected;
                                                            }
                                                          }
                                                        }
                                                        setState(() {});
                                                      });
                                                    });
                                                  }

                                                  Get.to(InvitePeople(
                                                          false,
                                                          eventController
                                                              .selectedList,
                                                          widget.id))!
                                                      .then((value) =>
                                                          setState(() {}));
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.r),
                                                      // color: grey_f5f5f5
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Color(
                                                              0xff2030be))),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(16.r),
                                                    child: Center(
                                                      child: Text(
                                                          "+ Invite People",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff2030be),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontFamily:
                                                                  roboto_bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 14.sp),
                                                          textAlign:
                                                              TextAlign.left),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container()
                                    ],
                                  )
                                : Container()
                            : Container(),
                        controller.eventDetails.value.type != 'ticket_price'
                            ? SizedBox(
                                height: 16.h,
                              )
                            : Container(),
                        // Divider(
                        //   color: view_line_f4f6f6,
                        //   thickness: 1,
                        //   height: 1,
                        // ),
                        Padding(
                          padding: EdgeInsets.only(left: 24.w, right: 24.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              setHelveticaMedium(
                                  controller
                                      .eventDetails.value.title!.capitalize!,
                                  24.sp,
                                  black_121212,
                                  FontWeight.w900,
                                  FontStyle.normal),
                              Padding(
                                padding: EdgeInsets.only(top: 16.h),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      calendar_icon,
                                      height: 12.h,
                                      width: 12.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 4.w),
                                      child: setHelveticaMedium(
                                          '${DateFormat("MMM dd, yyyy").format(controller.eventDetails.value.startDateTime!)} at ${DateFormat("hh:mm a").format(controller.eventDetails.value.startDateTime!)}',
                                          10.sp,
                                          black_121212,
                                          FontWeight.w500,
                                          FontStyle.normal,
                                          -0.4),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8.h),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      icon_location,
                                      height: 12.h,
                                      width: 12.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 4.w),
                                      child: setHelveticaMedium(
                                          controller.eventDetails.value.venue!
                                              .capitalize!,
                                          10.sp,
                                          black_121212,
                                          FontWeight.w500,
                                          FontStyle.normal,
                                          -0.4),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 24.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: grey_f4f6f6,
                                      borderRadius: BorderRadius.circular(4.r)),
                                  height: 30.h,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.w, right: 8.w),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: controller.eventDetails.value
                                                      .hosts!.length ==
                                                  1
                                              ? 25
                                              : controller.eventDetails.value
                                                          .hosts!.length ==
                                                      2
                                                  ? 35
                                                  : 55,
                                          height: 30,
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: <Widget>[
                                              if (controller.eventDetails.value
                                                  .hosts!.isNotEmpty)
                                                SizedBox(
                                                  height: 17.h,
                                                  width: 17.w,
                                                  child: CircularProfileAvatar(
                                                    '',
                                                    imageFit: BoxFit.fill,
                                                    child: controller
                                                                .eventDetails
                                                                .value
                                                                .hosts![0]
                                                                .image ==
                                                            null
                                                        ? SvgPicture.asset(
                                                            placeholder)
                                                        : Image.network(
                                                            controller
                                                                .eventDetails
                                                                .value
                                                                .hosts![0]
                                                                .image!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                    borderColor: Colors.white,
                                                    borderWidth: 1,
                                                    elevation: 2,
                                                    radius: 50,
                                                  ),
                                                ),
                                              if (controller.eventDetails.value
                                                      .hosts!.length >=
                                                  2)
                                                Positioned(
                                                  left: 10.w,
                                                  child: SizedBox(
                                                    height: 17.h,
                                                    width: 17.w,
                                                    child:
                                                        CircularProfileAvatar(
                                                      '',
                                                      child: controller
                                                                  .eventDetails
                                                                  .value
                                                                  .hosts![1]
                                                                  .image ==
                                                              null
                                                          ? SvgPicture.asset(
                                                              placeholder)
                                                          : Image.network(
                                                              controller
                                                                  .eventDetails
                                                                  .value
                                                                  .hosts![1]
                                                                  .image!,
                                                              fit: BoxFit.cover,
                                                            ),
                                                      borderColor: Colors.white,
                                                      borderWidth: 1,
                                                      elevation: 2,
                                                      radius: 50,
                                                    ),
                                                  ),
                                                ),
                                              if (controller.eventDetails.value
                                                      .hosts!.length >
                                                  2)
                                                Positioned(
                                                  left: 20.0,
                                                  child: SvgPicture.asset(
                                                    black_more_dot_icon,
                                                    width: 17.w,
                                                    height: 17.h,
                                                  ),
                                                )
                                            ],
                                          ),
                                        ),
                                        setHelveticaMedium(
                                            "Hosted By ",
                                            11.sp,
                                            grey_3f3f3f,
                                            FontWeight.w500,
                                            FontStyle.normal),
                                        Flexible(
                                          child: SizedBox(
                                            height: 20,
                                            child: ListView.builder(
                                                primary: false,
                                                shrinkWrap: true,
                                                padding: EdgeInsets.zero,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: controller
                                                    .eventDetails
                                                    .value
                                                    .hosts!
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      setHelceticaBold(
                                                          "@${controller.eventDetails.value.hosts![index].userName!}",
                                                          11.sp,
                                                          black_121212,
                                                          FontWeight.w800,
                                                          FontStyle.normal),
                                                      controller
                                                                  .eventDetails
                                                                  .value
                                                                  .hosts!
                                                                  .length ==
                                                              (index + 1)
                                                          ? Container()
                                                          : setHelceticaBold(
                                                              ", ",
                                                              11.sp,
                                                              black_121212,
                                                              FontWeight.w800,
                                                              FontStyle.normal),
                                                    ],
                                                  );
                                                }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(top: 8.h, bottom: 24.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: grey_f4f6f6,
                                      borderRadius: BorderRadius.circular(4.r)),
                                  height: 29.h,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.w, right: 8.w),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: controller.eventDetails.value
                                                      .speakers!.length ==
                                                  1
                                              ? 25
                                              : controller.eventDetails.value
                                                          .speakers!.length ==
                                                      2
                                                  ? 35
                                                  : 45,
                                          height: 30.h,
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: <Widget>[
                                              if (controller.eventDetails.value
                                                  .speakers!.isNotEmpty)
                                                SizedBox(
                                                  height: 17.h,
                                                  width: 17.w,
                                                  child: CircularProfileAvatar(
                                                    '',
                                                    imageFit: BoxFit.fill,
                                                    child: controller
                                                                    .eventDetails
                                                                    .value
                                                                    .speakers![
                                                                        0]
                                                                    .image ==
                                                                null ||
                                                            controller
                                                                    .eventDetails
                                                                    .value
                                                                    .speakers![
                                                                        0]
                                                                    .image ==
                                                                ""
                                                        ? SvgPicture.asset(
                                                            placeholder)
                                                        : Image.network(
                                                            controller
                                                                .eventDetails
                                                                .value
                                                                .speakers![0]
                                                                .image!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                    borderColor: Colors.white,
                                                    borderWidth: 1,
                                                    elevation: 2,
                                                    radius: 50,
                                                  ),
                                                ),
                                              if (controller.eventDetails.value
                                                      .speakers!.length >=
                                                  2)
                                                Positioned(
                                                  left: 10.w,
                                                  child: SizedBox(
                                                    height: 17.h,
                                                    width: 17.w,
                                                    child:
                                                        CircularProfileAvatar(
                                                      '',
                                                      child: controller
                                                                      .eventDetails
                                                                      .value
                                                                      .speakers![
                                                                          1]
                                                                      .image ==
                                                                  null ||
                                                              controller
                                                                      .eventDetails
                                                                      .value
                                                                      .speakers![
                                                                          1]
                                                                      .image ==
                                                                  ""
                                                          ? SvgPicture.asset(
                                                              placeholder)
                                                          : Image.network(
                                                              controller
                                                                  .eventDetails
                                                                  .value
                                                                  .speakers![1]
                                                                  .image!,
                                                              fit: BoxFit.cover,
                                                            ),
                                                      borderColor: Colors.white,
                                                      borderWidth: 1,
                                                      elevation: 2,
                                                      radius: 50,
                                                    ),
                                                  ),
                                                ),
                                              if (controller.eventDetails.value
                                                      .speakers!.length >
                                                  2)
                                                Positioned(
                                                  left: 20.w,
                                                  bottom: 4,
                                                  child: SvgPicture.asset(
                                                    black_more_dot_icon,
                                                    height: 20.h,
                                                    width: 20.w,
                                                  ),
                                                )
                                            ],
                                          ),
                                        ),
                                        setHelveticaMedium(
                                            "Speakers ",
                                            11.sp,
                                            grey_3f3f3f,
                                            FontWeight.w500,
                                            FontStyle.normal),
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2.0),
                                            child: SizedBox(
                                              height: 20.h,
                                              child: ListView.builder(
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.zero,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: controller
                                                      .eventDetails
                                                      .value
                                                      .speakers!
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        setHelceticaBold(
                                                            controller
                                                                        .eventDetails
                                                                        .value
                                                                        .speakers![
                                                                            index]
                                                                        .fullName !=
                                                                    null
                                                                ? "@${controller.eventDetails.value.speakers![index].fullName!}"
                                                                : '',
                                                            11.sp,
                                                            black_121212,
                                                            FontWeight.w800,
                                                            FontStyle.normal),
                                                        controller
                                                                    .eventDetails
                                                                    .value
                                                                    .speakers!
                                                                    .length ==
                                                                (index + 1)
                                                            ? Container()
                                                            : setHelceticaBold(
                                                                ", ",
                                                                11.sp,
                                                                black_121212,
                                                                FontWeight.w800,
                                                                FontStyle
                                                                    .normal),
                                                      ],
                                                    );
                                                  }),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 1.h,
                      thickness: 1,
                      color: view_line_f4f6f6,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 18.h, left: 24.w, right: 24.w, bottom: 18.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          setHelceticaBold("Share this event on : ", 14.sp,
                              black_121212, FontWeight.w700, FontStyle.normal),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Share.share(
                                    'Hey checkout this amazing event' +
                                        controller.eventDetails.value.link!,
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 24.w),
                                  child: Image.asset(
                                    icon_instagram,
                                    height: 24.h,
                                    width: 24.w,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  SocialShare.shareTwitter(
                                    'Hey checkout this amazing event',
                                    url: controller.eventDetails.value.link!,
                                  ).then((data) {
                                    print(data);
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 24.w),
                                  child: Image.asset(
                                    icon_twitter,
                                    height: 24.h,
                                    width: 24.w,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Share.share(
                                    'Hey checkout this amazing event' +
                                        controller.eventDetails.value.link!,
                                  );
                                },
                                child: Image.asset(
                                  icon_linkedin,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1.h,
                      thickness: 1,
                      color: view_line_f4f6f6,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
                      child: setHelceticaBold("Event Details", 14.sp,
                          black_121212, FontWeight.w800, FontStyle.normal),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15.0, left: 24, right: 24),
                      child: ReadMoreText(
                        controller.eventDetails.value.details!,
                        trimLines: 4,
                        colorClickableText: orange_ff881a,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '\nRead More...',
                        trimExpandedText: '\nRead Less',
                        delimiter: '',
                        style: TextStyle(
                            height: 1.5,
                            fontFamily: helveticaNeueNeue_medium,
                            fontSize: 12.sp,
                            color: Color(0xff3f3f3f)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 24.0, left: 24.w, right: 24.w),
                      child: setHelceticaBold("Location", 14.sp, black_121212,
                          FontWeight.w800, FontStyle.normal),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 15.h, left: 24.w, right: 24.w),
                      child: Container(
                        height: 170.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                                target: LatLng(lat, lng), zoom: 17),
                            markers: markers,
                            zoomControlsEnabled: true,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: false,
                            onMapCreated: _onMapCreated,
                            padding: const EdgeInsets.only(
                              top: 40.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    controller.eventDetails.value.userId != userId
                        ? Container()
                        : ((controller.registerList.value.data
                                        ?.registeredUsers !=
                                    null) &&
                                (controller.registerList.value.data!
                                    .registeredUsers!.isNotEmpty))
                            ? controller.eventDetails.value.type !=
                                    'ticket_price'
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 25.0, left: 24, right: 24),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color(0xFF1c2535),
                                                Color(0xFF04080f),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              stops: [0.0, 1.0],
                                              tileMode: TileMode.clamp),
                                          color: white_ffffff,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x26121212),
                                              offset: Offset(
                                                0.0,
                                                5.0,
                                              ),
                                              blurRadius: 10.0,
                                              spreadRadius: 4.0,
                                            ),
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Registered People
                                            Text("Registered People",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w800,
                                                    fontFamily: roboto_bold,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 16.sp),
                                                textAlign: TextAlign.left),
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(RegisteredPeople(
                                                    id: controller
                                                        .eventDetails.value.id
                                                        .toString()));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: orange_ff881a,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0,
                                                          bottom: 8.0,
                                                          left: 16.0,
                                                          right: 16.0),
                                                  child:
                                                      // View
                                                      Text("View",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontFamily:
                                                                  roboto_bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontSize: 16.sp),
                                                          textAlign:
                                                              TextAlign.left),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                            : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setFinalValue() {
    if (controller.isWallet.value) {
      if (double.parse(controller.walletDetails.value.wallet ?? "0").toInt() <
          controller.total.value) {
        controller.finalTotal.value = controller.total.value -
            double.parse(controller.walletDetails.value.wallet ?? "0").toInt();
      } else {
        controller.finalTotal.value = 0;
      }
    } else {
      controller.finalTotal.value = controller.total.value;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.selectedPeople.clear();
    videoController.userList.clear();
    videoController.searchController.value.text = "";
  }
}
