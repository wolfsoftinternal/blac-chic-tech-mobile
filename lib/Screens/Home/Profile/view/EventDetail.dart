import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/view/InvitePeople.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
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

class EventDetail extends StatefulWidget {
  final isFrom;
  const EventDetail({Key? key, this.isFrom}) : super(key: key);

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lat = double.parse(controller.eventDetails.value.latitude!);
    lng = double.parse(controller.eventDetails.value.longitude!);
    if (controller.eventDetails.value.type == 'invite_only') {
      checkNet(context).then(
          (value) async => await videoController.userListAPI(context, ''));
      if (controller.eventDetails.value.invitedUsers != null) {
        for (var item in controller.eventDetails.value.invitedUsers!) {
          eventController.selectedList.add(item);
        }
      }
    }
    init();
    getLoc();
  }

  init() async {
    var preferences = MySharedPref();
    SignupModel? myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    userId = myModel?.data!.id;
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

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

  displayBottomSheet(category, price){
    controller.total.value = int.parse(price);
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (ctx) {
        return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return Obx(
                      () => Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 50,
                                height: 3,
                                decoration: BoxDecoration(
                                    color: grey_3f3f3f.withOpacity(0.4),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(50),
                                    )),
                              )),
                          const SizedBox(
                            height: 23.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                            child: setRoboto("CONFIRMATION", 16, black_121212,
                                FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 23.5,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 23.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                            child: Column(
                              children: [
                                setRoboto("Ticket ${controller.eventDetails.value.title!}", 16, black_121212,
                                    FontWeight.w900),
                                const SizedBox(
                                  height: 24,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: grey_f5f5f5,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 16.0, right: 16.0),
                                    child: Row(
                                      children: [
                                        setRoboto("$category \$${controller.total.value}", 12, black_121212, FontWeight.w900),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: white_ffffff,
                                            borderRadius: BorderRadius.circular(5),
                                          ),                                        
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: (){
                                                    setState((){
                                                      if(controller.count.value != 1){
                                                        controller.count--;
                                                      }
                                                      controller.total.value = controller.count.value * int.parse(price);
                                                    });
                                                  },
                                                  child: const Icon(Icons.remove, color: grey_3f3f3f, size: 12,)
                                                ),
                                                const SizedBox(width: 20,),
                                                setRoboto(controller.count.value.toString(), 12, black_121212, FontWeight.w900),
                                                const SizedBox(width: 20,),
                                                GestureDetector(
                                                  onTap: (){
                                                    setState((){
                                                      controller.count++;
                                                      controller.total.value = controller.count.value * int.parse(price);
                                                    });
                                                  },
                                                  child: const Icon(Icons.add, color: grey_3f3f3f, size: 12,)
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                BlackButton('PAY \$${controller.total.value}', white_ffffff, (){
                                  checkNet(context).then((value){
                                    controller.chargeCardAndMakePayment(context);
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
             SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackLayout(),
                Padding(
                  padding:  EdgeInsets.only(right: 24.w),
                  child: controller.eventDetails.value.userId != userId
                      ? Container()
                      : Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton(
                              // padding: EdgeInsets.only(bottom: 20),
                              // position: PopupMenuPosition.under,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              icon: const Icon(Icons.more_horiz,
                                  color: Colors.black),
                              onSelected: (index) {
                                if (index == 1) {
                                } else if (index == 2) {
                                  checkNet(context).then((value) => {
                                        controller.eventDeleteAPI(context,
                                            controller.eventDetails.value.id)
                                      });
                                }
                              },
                              itemBuilder: (context) => [
                                     PopupMenuItem(
                                      height: 35.h,
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontSize: 14.sp),
                                      ),
                                      value: 1,
                                    ),
                                     PopupMenuItem(
                                      height: 35.h,
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily:
                                                helveticaNeueNeue_medium,
                                            fontSize: 14.sp),
                                      ),
                                      value: 2,
                                    ),
                                  ]),
                        ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),


            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 10.h),
                      child: SizedBox(
                        height: 330.h,
                        width: MediaQuery.of(context).size.width,
                        child: controller.eventDetails.value.poster == null
                            ? SvgPicture.asset(
                              placeholder,
                              fit: BoxFit.cover,
                            )
                            : CachedNetworkImage(
                              imageUrl: controller.eventDetails.value.poster!,
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
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 24.w, right: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 16.h),
                            child: controller.eventDetails.value.type ==
                                'ticket_price'
                                ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                // Admission
                                Text(
                                    "Admission",
                                    style:  TextStyle(
                                        color:  black_121212,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: roboto_bold,
                                        fontStyle:  FontStyle.normal,
                                        fontSize: 14.sp
                                    ),
                                    textAlign: TextAlign.left
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
                                  height: 100.h,
                                  width:
                                  MediaQuery.of(context).size.width * 0.60,
                                  child: ListView.separated(
                                      primary: false,
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) => SizedBox(
                                        width: 10.w,
                                      ),
                                   //   padding: EdgeInsets.only(left: 24.w,right: 24.w),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.eventDetails.value
                                          .admissionData!.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding: widget.isFrom == 'event' ? const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12) : const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10.0),
                                          decoration: BoxDecoration(
                                              color: widget.isFrom == 'event' ? black_121212 : white_ffffff,
                                              borderRadius: BorderRadius.circular(8),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: black_121212.withOpacity(0.07),
                                                  spreadRadius: 2,
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 10),
                                                )]
                                          ),
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
                                                      .category!,
                                                  style:  TextStyle(
                                                      color:  widget.isFrom == 'event' ? white_ffffff : black_121212,
                                                      fontWeight: FontWeight.w400,
                                                      fontFamily: roboto_regular,
                                                      fontStyle:  FontStyle.normal,
                                                      fontSize: 16.sp
                                                  ),
                                                  textAlign: TextAlign.center
                                              ),
                                              // setHelveticaMedium(
                                              //     controller
                                              //         .eventDetails
                                              //         .value
                                              //         .admissionData![index]
                                              //         .category!,
                                              //     16,
                                              //     widget.isFrom == 'event' ? white_ffffff : black_121212,
                                              //     FontWeight.w500,
                                              //     FontStyle.normal),

                                              // $15
                                              Text(
                                                  "\$${double.parse(controller.eventDetails.value.admissionData![index].price!).toInt()}",
                                                  style:  TextStyle(
                                                      color:  widget.isFrom == 'event' ? white_ffffff : orange_ff881a,
                                                      fontWeight: FontWeight.w600,
                                                      fontFamily: roboto_bold,
                                                      fontStyle:  FontStyle.normal,
                                                      fontSize: 16.sp
                                                  ),
                                                  textAlign: TextAlign.left
                                              ),

                                              // setHelveticaMedium(
                                              //     "\$${double.parse(controller.eventDetails.value.admissionData![index].price!).toInt()}",
                                              //     16,
                                              //     widget.isFrom == 'event' ? white_ffffff : orange_ff881a,
                                              //     FontWeight.w500,
                                              //     FontStyle.normal),

                                              widget.isFrom == 'event' ? Padding(
                                                padding:
                                                 EdgeInsets.only(top: 8.h),
                                                child: GestureDetector(
                                                  onTap: (){
                                                    displayBottomSheet(controller.eventDetails.value.admissionData![index].category, controller.eventDetails.value.admissionData![index].price);
                                                  },
                                                  child: Container(
                                                    height: 31.h,
                                                    width: 90.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(4),
                                                      color: orange_ff881a,
                                                    ),
                                                    child: Center(
                                                      child:
                                                      // Buy
                                                      Text(
                                                          "Buy",
                                                          style:  TextStyle(
                                                              color:  Colors.white,
                                                              fontWeight: FontWeight.w600,
                                                              fontFamily: roboto_bold,
                                                              fontStyle:  FontStyle.normal,
                                                              fontSize: 14.sp
                                                          ),
                                                          textAlign: TextAlign.center
                                                      ),

                                                      // setHelveticaMedium(
                                                      //     'Buy',
                                                      //     16,
                                                      //     white_ffffff,
                                                      //     FontWeight.w500,
                                                      //     FontStyle.normal),
                                                    ),
                                                  ),
                                                ),
                                              ) : Container(),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            )
                                : controller.eventDetails.value.type == 'free'
                                ? Container(
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
                                      offset:  Offset(
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
                                      child:// Admission

                                      Text(
                                          "Admission",
                                          style:  TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: helvetica_neu_bold,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 16.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),

                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(right: 8.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(4.r),
                                          color: orange_ff881a,
                                        ),
                                        child: Padding(
                                            padding:  EdgeInsets.only(left: 14.w,right: 14.w,top: 9.h,bottom: 9.h),
                                            child: // Invite Only
                                            Text(
                                                "FREE",
                                                style:  TextStyle(
                                                    color:  Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: roboto_bold,
                                                    fontStyle:  FontStyle.normal,
                                                    fontSize: 16.sp
                                                ),
                                                textAlign: TextAlign.left
                                            )
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            )
                                : Container(
                                height: 61.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.r),
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
                                      offset:  Offset(
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
                                      child:  Text(
                                          "Admission",
                                          style:  TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: helvetica_neu_bold,
                                              fontStyle:  FontStyle.normal,
                                              fontSize: 16.sp
                                          ),
                                          textAlign: TextAlign.left
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                       EdgeInsets.only(right: 8.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(4.r),
                                          color: orange_ff881a,
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.only(left: 14.w,right: 14.w,top: 9.h,bottom: 9.h),
                                          child: // Invite Only
                                          Text(
                                              "Invite Only",
                                              style:  TextStyle(
                                                  color:  Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: roboto_bold,
                                                  fontStyle:  FontStyle.normal,
                                                  fontSize: 16.sp
                                              ),
                                              textAlign: TextAlign.left
                                          )
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          controller.eventDetails.value.type == 'invite_only'
                              ? widget.isFrom != 'event'
                              ? Column(
                            children: [
                              eventController.selectedList.isNotEmpty
                                  ? Padding(
                                padding:  EdgeInsets.only(top: 24.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: eventController
                                          .selectedList.length ==
                                          1
                                          ? 25
                                          : eventController.selectedList
                                          .length ==
                                          2
                                          ? 35
                                          : 55,
                                      height: 25.h,
                                      child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: <Widget>[
                                          if (eventController
                                              .selectedList.isNotEmpty)
                                            SizedBox(
                                              height: 20.h,
                                              width: 20.w,
                                              child:
                                              CircularProfileAvatar(
                                                '',
                                                imageFit: BoxFit.fill,
                                                child: eventController
                                                    .selectedList[
                                                0]
                                                    .image ==
                                                    null
                                                    ? SvgPicture.asset(
                                                    placeholder)
                                                    : Image.network(
                                                  eventController
                                                      .selectedList[
                                                  0]
                                                      .image!,
                                                  fit: BoxFit.cover,
                                                ),
                                                borderColor: Colors.white,
                                                borderWidth: 1,
                                                elevation: 2,
                                                radius: 50,
                                              ),
                                            ),
                                          if (eventController
                                              .selectedList.length >=
                                              2)
                                            Positioned(
                                              left: 10.0,
                                              child: SizedBox(
                                                height: 21,
                                                width: 21,
                                                child:
                                                CircularProfileAvatar(
                                                  '',
                                                  child: eventController
                                                      .selectedList[
                                                  1]
                                                      .image ==
                                                      null
                                                      ? SvgPicture.asset(
                                                      placeholder)
                                                      : Image.network(
                                                    eventController
                                                        .selectedList[
                                                    1]
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
                                            ),
                                          if (eventController
                                              .selectedList.length >
                                              2)
                                            Positioned(
                                              left: 20.0,
                                              child: SvgPicture.asset(
                                                black_more_dot_icon,
                                                width: 23,
                                                height: 23,
                                              ),
                                            )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 2, left: 5.0),
                                      child: setRoboto(
                                          eventController
                                              .selectedList.length
                                              .toString() +
                                              " People Invited",
                                          14.sp,
                                          black_121212,
                                          FontWeight.w900),
                                    ),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Get.to(const InvitePeople(
                                          fromView: true,
                                        ))!
                                            .then((value) =>
                                            setState(() {}));
                                      },
                                      child: Padding(
                                        padding:
                                         EdgeInsets.only(top: 2.h),
                                        child: setRoboto(
                                            "VIEW",
                                            12.sp,
                                            orange_ff881a,
                                            FontWeight.w900),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                                  : Container(),
                              Padding(
                                padding:  EdgeInsets.only(top: 20.h),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(const InvitePeople(
                                      fromView: false,
                                    ))!
                                        .then((value) => setState(() {}));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(4.r),
                                        // color: grey_f5f5f5
                                        border: Border.all(
                                            width: 1, color: Color(0xff2030be))),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.r),
                                      child: Center(
                                        child: Text("+ Invite People",
                                            style: TextStyle(
                                                color: Color(0xff2030be),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: roboto_bold,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp),
                                            textAlign: TextAlign.left),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ) : Container()
                              : Container(),

                          SizedBox(height: 16.h,),

                          Divider(
                            color: view_line_f4f6f6,
                            thickness: 1,
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: setHelveticaMedium(
                                controller.eventDetails.value.title!,
                                25.sp,
                                black_121212,
                                FontWeight.w900,
                                FontStyle.normal),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 16.h),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  calendar_icon,
                                  height: 15.h,
                                  width: 15.w,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: setHelveticaMedium(
                                      '${DateFormat("MMM dd, yyyy").format(controller.eventDetails.value.startDateTime!)} at ${DateFormat("hh:mm a").format(controller.eventDetails.value.startDateTime!)}',
                                      12.sp,
                                      grey_aaaaaa,
                                      FontWeight.w500,
                                      FontStyle.normal,
                                      -0.4),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 8.h),
                            child: Row(
                              children: [
                                SvgPicture.asset(icon_location,
                                  height: 15.h,
                                  width: 15.w,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: setHelveticaMedium(
                                      controller.eventDetails.value.venue!,
                                      12.sp,
                                      grey_aaaaaa,
                                      FontWeight.w500,
                                      FontStyle.normal,
                                      -0.4),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 24.h),
                            child: Container(

                              decoration: BoxDecoration(
                                color: grey_f4f6f6,
                                borderRadius: BorderRadius.circular(4.r)
                              ),
                              height: 30.h,
                              child: Padding(
                                padding:  EdgeInsets.only(left: 8.w,right: 8.w),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: controller
                                          .eventDetails.value.hosts!.length ==
                                          1
                                          ? 25
                                          : controller.eventDetails.value.hosts!
                                          .length ==
                                          2
                                          ? 35
                                          : 55,
                                      height: 30,
                                      child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: <Widget>[
                                          if (controller
                                              .eventDetails.value.hosts!.isNotEmpty)
                                            SizedBox(
                                              height: 17.h,
                                              width: 17.w,
                                              child: CircularProfileAvatar(
                                                '',
                                                imageFit: BoxFit.fill,
                                                child: controller.eventDetails.value
                                                    .hosts![0].image ==
                                                    null
                                                    ? SvgPicture.asset(placeholder)
                                                    : Image.network(
                                                  controller.eventDetails.value
                                                      .hosts![0].image!,
                                                  fit: BoxFit.cover,
                                                ),
                                                borderColor: Colors.white,
                                                borderWidth: 1,
                                                elevation: 2,
                                                radius: 50,
                                              ),
                                            ),
                                          if (controller
                                              .eventDetails.value.hosts!.length >=
                                              2)
                                            Positioned(
                                              left: 10.w,
                                              child: SizedBox(
                                                height: 17.h,
                                                width: 17.w,
                                                child: CircularProfileAvatar(
                                                  '',
                                                  child: controller.eventDetails.value
                                                      .hosts![1].image ==
                                                      null
                                                      ? SvgPicture.asset(placeholder)
                                                      : Image.network(
                                                    controller.eventDetails
                                                        .value.hosts![1].image!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderColor: Colors.white,
                                                  borderWidth: 1,
                                                  elevation: 2,
                                                  radius: 50,
                                                ),
                                              ),
                                            ),
                                          if (controller
                                              .eventDetails.value.hosts!.length >
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
                                        "Hosted by ",
                                        11.sp,
                                        grey_3f3f3f,
                                        FontWeight.w500,
                                        FontStyle.normal),
                                    SizedBox(
                                      height: 20,

                                      child: ListView.builder(
                                          primary: false,
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller
                                              .eventDetails.value.hosts!.length,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                setHelceticaBold(
                                                    "@${controller.eventDetails.value.hosts![index].userName!}",
                                                    11.sp,
                                                    black_121212,
                                                    FontWeight.w500,
                                                    FontStyle.normal),
                                                controller.eventDetails.value.hosts!
                                                    .length ==
                                                    (index + 1)
                                                    ? Container()
                                                    : setHelceticaBold(
                                                    ", ",
                                                    11.sp,
                                                    black_121212,
                                                    FontWeight.w500,
                                                    FontStyle.normal),
                                              ],
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 8.h, bottom: 25.h),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: grey_f4f6f6,
                                  borderRadius: BorderRadius.circular(4.r)
                              ),
                              height: 29.h,
                              child: Padding(
                                padding:  EdgeInsets.only(left: 8.w,right: 8.w),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: controller.eventDetails.value.speakers!
                                          .length ==
                                          1
                                          ? 25
                                          : controller.eventDetails.value.speakers!
                                          .length ==
                                          2
                                          ? 35
                                          : 55,
                                      height: 30.h,
                                      child: Stack(
                                        alignment: Alignment.centerLeft,
                                        children: <Widget>[
                                          if (controller.eventDetails.value.speakers!.isNotEmpty)
                                            SizedBox(
                                              height: 17.h,
                                              width: 17.w,
                                              child: CircularProfileAvatar(
                                                '',
                                                imageFit: BoxFit.fill,
                                                child: controller.eventDetails.value
                                                    .speakers![0].image ==
                                                    null
                                                    ? SvgPicture.asset(placeholder)
                                                    : Image.network(
                                                  controller.eventDetails.value
                                                      .speakers![0].image!,
                                                  fit: BoxFit.cover,
                                                ),
                                                borderColor: Colors.white,
                                                borderWidth: 1,
                                                elevation: 2,
                                                radius: 50,
                                              ),
                                            ),
                                          if (controller.eventDetails.value.speakers!
                                              .length >=
                                              2)
                                            Positioned(
                                              left: 10.w,
                                              child: SizedBox(
                                                height: 17.h,
                                                width: 17.w,
                                                child: CircularProfileAvatar(
                                                  '',
                                                  child: controller.eventDetails.value
                                                      .speakers![1].image ==
                                                      null
                                                      ? SvgPicture.asset(placeholder)
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
                                          if (controller.eventDetails.value.speakers!
                                              .length >
                                              2)
                                            Positioned(
                                              left: 20.w,
                                              child: SvgPicture.asset(
                                                black_more_dot_icon,
                                                height: 17.h,
                                                width: 17.w,
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
                                    SizedBox(
                                      height: 20.h,
                                      child: ListView.builder(
                                          primary: false,
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller
                                              .eventDetails.value.speakers!.length,
                                          itemBuilder: (context, index) {
                                            return Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: [
                                                setHelceticaBold(controller.eventDetails.value.speakers![index].userName != null
                                                    ? "@${controller.eventDetails.value.speakers![index].userName!}" : "@${controller.eventDetails.value.speakers![index].firstName!}",
                                                    11.sp,
                                                    black_121212,
                                                    FontWeight.w500,
                                                    FontStyle.normal),
                                                controller.eventDetails.value
                                                    .speakers!.length ==
                                                    (index + 1)
                                                    ? Container()
                                                    : setHelceticaBold(
                                                    ", ",
                                                    11.sp,
                                                    black_121212,
                                                    FontWeight.w500,
                                                    FontStyle.normal),
                                              ],
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                      padding: const EdgeInsets.only(top: 25.0, left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          setHelceticaBold("Share this event on : ", 14.sp, black_121212,
                              FontWeight.w700, FontStyle.normal),
                          Row(
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right: 24.w),
                                child: Image.asset(
                                  icon_instagram,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                              ),
                              Padding(
                                padding:  EdgeInsets.only(right: 24.w),
                                child: Image.asset(
                                  icon_twitter,
                                  height: 24.h,
                                  width: 24.w,
                                ),
                              ),
                              Image.asset(
                                icon_linkedin,
                                height: 24.h,
                                width: 24.w,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Divider(
                        height: 1.h,
                        thickness: 1,
                        color: view_line_f4f6f6,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
                      child: setHelceticaBold("Event Details", 14.sp, black_121212,
                          FontWeight.w700, FontStyle.normal),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 24, right: 24),
                      child: ReadMoreText(
                        controller.eventDetails.value.details!,
                        trimLines: 2,
                        colorClickableText: orange_ff881a,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '  Read More',
                        trimExpandedText: '  Read Less',
                        delimiter: '',
                        style:  TextStyle(
                            height: 1.5,
                            fontFamily: helveticaNeueNeue_medium,
                            fontSize: 16.sp,
                            color: Color(0xff3f3f3f)),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 24.0, left: 24.w, right: 24.w),
                      child: setHelceticaBold("Location", 14.sp, black_121212,
                          FontWeight.w700, FontStyle.normal),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: 15.h, left: 24.w, right: 24.w),
                      child: Container(
                        height: 200.h,
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.r)),
                        ),
                        child: GoogleMap(
                          initialCameraPosition:
                          CameraPosition(target: LatLng(lat, lng), zoom: 17),
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
                    // controller.eventDetails.value.userId != userId ? Container()
                    controller.eventDetails.value.type != 'ticket_price'
                        ? Container()
                        : Padding(
                      padding: const EdgeInsets.only(
                          top: 25.0, bottom: 25.0, left: 24, right: 24),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration:
                        BoxDecoration(
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
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                            BoxShadow(
                            color: Color(0x26121212),
                        offset:  Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 4.0,
                      ),
                      ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Registered People
                              Text(
                                  "Registered People",
                                  style:  TextStyle(
                                      color:  Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: roboto_bold,
                                      fontStyle:  FontStyle.normal,
                                      fontSize: 16.sp
                                  ),
                                  textAlign: TextAlign.left
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(4),
                                  color: orange_ff881a,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                                  child:
                                  // View
                                  Text(
                                      "View",
                                      style:  TextStyle(
                                          color:  Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: roboto_bold,
                                          fontStyle:  FontStyle.normal,
                                          fontSize: 16.sp
                                      ),
                                      textAlign: TextAlign.left
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
            ),


          ],
        ),
      ),
    );
  }
}
