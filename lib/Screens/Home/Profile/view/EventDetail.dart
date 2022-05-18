import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:readmore/readmore.dart';

class EventDetail extends StatefulWidget {
  EventDetail({Key? key}) : super(key: key);

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackLayout(),
                  Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: controller.eventDetails.value.userId != userId ? Container()
                    : Align(
                      alignment: Alignment.topRight,
                      child: PopupMenuButton(
                          // padding: EdgeInsets.only(bottom: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          icon: const Icon(Icons.more_horiz, color: Colors.black),
                          onSelected: (index) {
                            if (index == 1) {
                            } else if (index == 2) {}
                          },
                          itemBuilder: (context) => [
                                const PopupMenuItem(
                                  height: 35,
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontSize: 14),
                                  ),
                                  value: 1,
                                ),
                                const PopupMenuItem(
                                  height: 35,
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontSize: 14),
                                  ),
                                  value: 2,
                                ),
                              ]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
                child: SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: controller.eventDetails.value.poster == null
                      ? ClipRRect(
                          borderRadius:
                              BorderRadius.all(const Radius.circular(5)),
                          child: SvgPicture.asset(
                            placeholder,
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius:
                              BorderRadius.all(const Radius.circular(5)),
                          child: CachedNetworkImage(
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          setHelveticaMedium("Admission\nFees", 15, black_121212, FontWeight.w500, FontStyle.normal),
                          SizedBox(width: 20,),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.60,
                            child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.eventDetails.value.admissionData!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      setHelveticaMedium("\$${double.parse(controller.eventDetails.value.admissionData![index].price!).toInt()}", 22, Colors.red, FontWeight.w500, FontStyle.normal),
                                      setHelveticaRegular(controller.eventDetails.value.admissionData![index].category!, 18, grey_3f3f3f, FontWeight.w500, FontStyle.normal),
                                    ],
                                  ),
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: setHelveticaMedium(controller.eventDetails.value.title!, 25, black_121212, FontWeight.w500, FontStyle.normal),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(calendar_icon, height: 15, width: 15,),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: setHelveticaMedium('${DateFormat("MMM dd, yyyy").format(controller.eventDetails.value.startDateTime!)} at ${DateFormat("hh:mm a").format(controller.eventDetails.value.startDateTime!)}',
                              12, grey_aaaaaa, FontWeight.w500, FontStyle.normal, -0.4
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(icon_location, height: 15, width: 15),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: setHelveticaMedium(controller.eventDetails.value.venue!, 12, grey_aaaaaa, FontWeight.w500, FontStyle.normal, -0.4),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Container(
                        color: grey_f4f6f6,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: controller.eventDetails.value.hosts!.length == 1 ? 25 : 
                                       controller.eventDetails.value.hosts!.length == 2 ? 35 : 55,
                                height: 50,
                                child: Stack(
                                alignment: Alignment.centerLeft,
                                children: <Widget>[
                                  if (controller.eventDetails.value.hosts!.length >= 1)
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProfileAvatar(
                                        '',
                                        imageFit: BoxFit.fill,
                                        child: controller.eventDetails.value.hosts![0].image == null
                                            ? SvgPicture.asset(placeholder)
                                            : Image.network(
                                                controller.eventDetails.value.hosts![0].image!,
                                                fit: BoxFit.cover,
                                              ),
                                        borderColor: Colors.white,
                                        borderWidth: 1,
                                        elevation: 2,
                                        radius: 50,
                                      ),
                                    ),
                                  if (controller.eventDetails.value.hosts!.length >= 2)
                                    Positioned(
                                      left: 10.0,
                                      child: SizedBox(
                                        height: 21,
                                        width: 21,
                                        child: CircularProfileAvatar(
                                          '',
                                          child: controller.eventDetails.value.hosts![1].image == null
                                              ? SvgPicture.asset(placeholder)
                                              : Image.network(
                                                  controller.eventDetails.value.hosts![1].image!,
                                                  fit: BoxFit.cover,
                                                ),
                                          borderColor: Colors.white,
                                          borderWidth: 1,
                                          elevation: 2,
                                          radius: 50,
                                        ),
                                      ),
                                    ),
                                  if (controller.eventDetails.value.hosts!.length > 2)
                                    Positioned(
                                      left: 20.0,
                                      child: SvgPicture.asset(
                                        black_more_dot_icon,
                                        width: 17,
                                        height: 17,
                                      ),
                                    )
                                ],
                            ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:2, left: 4.0),
                                child: setHelveticaMedium("Hosted by ", 14, grey_3f3f3f, FontWeight.w500, FontStyle.normal),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Container(
                                height: 20,
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.eventDetails.value.hosts!.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        setHelceticaBold("@${controller.eventDetails.value.hosts![index].userName!}", 14, black_121212, FontWeight.w500, FontStyle.normal),
                                        controller.eventDetails.value.hosts!.length == (index + 1) ? Container() :
                                        setHelceticaBold(", ", 14, black_121212, FontWeight.w500, FontStyle.normal),
                                      ],
                                    );
                                  }
                                ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 25.0),
                      child: Container(
                        color: grey_f4f6f6,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: controller.eventDetails.value.speakers!.length == 1 ? 25 : 
                                       controller.eventDetails.value.speakers!.length == 2 ? 35 : 55,
                                height: 50,
                                child: Stack(
                                alignment: Alignment.centerLeft,
                                children: <Widget>[
                                  if (controller.eventDetails.value.speakers!.length >= 1)
                                    SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProfileAvatar(
                                        '',
                                        imageFit: BoxFit.fill,
                                        child: controller.eventDetails.value.speakers![0].image == null
                                            ? SvgPicture.asset(placeholder)
                                            : Image.network(
                                                controller.eventDetails.value.speakers![0].image!,
                                                fit: BoxFit.cover,
                                              ),
                                        borderColor: Colors.white,
                                        borderWidth: 1,
                                        elevation: 2,
                                        radius: 50,
                                      ),
                                    ),
                                  if (controller.eventDetails.value.speakers!.length >= 2)
                                    Positioned(
                                      left: 10.0,
                                      child: SizedBox(
                                        height: 21,
                                        width: 21,
                                        child: CircularProfileAvatar(
                                          '',
                                          child: controller.eventDetails.value.speakers![1].image == null
                                              ? SvgPicture.asset(placeholder)
                                              : Image.network(
                                                  controller.eventDetails.value.speakers![1].image!,
                                                  fit: BoxFit.cover,
                                                ),
                                          borderColor: Colors.white,
                                          borderWidth: 1,
                                          elevation: 2,
                                          radius: 50,
                                        ),
                                      ),
                                    ),
                                  if (controller.eventDetails.value.speakers!.length > 2)
                                    Positioned(
                                      left: 20.0,
                                      child: SvgPicture.asset(
                                        black_more_dot_icon,
                                        width: 17,
                                        height: 17,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2, left: 4.0),
                                child: setHelveticaMedium("Speakers ", 14, grey_3f3f3f, FontWeight.w500, FontStyle.normal),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Container(
                                  height: 20,
                                  width: MediaQuery.of(context).size.width * 0.50,
                                  child: ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.eventDetails.value.speakers!.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          setHelceticaBold("@${controller.eventDetails.value.speakers![index].userName!}", 14, black_121212, FontWeight.w500, FontStyle.normal),
                                          controller.eventDetails.value.speakers!.length == (index + 1) ? Container() :
                                          setHelceticaBold(", ", 14, black_121212, FontWeight.w500, FontStyle.normal),
                                        ],
                                      );
                                    }
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
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Divider(
                  color: grey_aaaaaa,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 24, right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    setHelceticaBold("Share this event on : ", 18, black_121212, FontWeight.w500, FontStyle.normal),
                    Row(
                      children: [
                        Padding(
                           padding: const EdgeInsets.only(right: 24.0),
                           child: Image.asset(
                             icon_instagram,
                             height: 24,
                             width: 24,
                           ),
                         ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24.0),
                          child: Image.asset(
                            icon_twitter,
                            height: 24,
                            width: 24,
                          ),
                        ),
                        Image.asset(
                          icon_linkedin,
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:25, left: 15, right: 15),
                child: Divider(
                  color: grey_aaaaaa,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 24, right: 24),
                child: setHelceticaBold("Event Details", 18, black_121212, FontWeight.w500, FontStyle.normal),
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
                  style: TextStyle(
                      height: 1.5,
                      fontFamily: helveticaNeueNeue_medium,
                      fontSize: 16,
                      color: black_121212),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 24, right: 24),
                child: setHelceticaBold("Location", 18, black_121212, FontWeight.w500, FontStyle.normal),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 24, right: 24),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(lat, lng),
                        zoom: 17),
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
              controller.eventDetails.value.userId != userId ? Container()
              : Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 24, right: 24),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: white_ffffff,
                    boxShadow: [
                      BoxShadow(
                        color: black_121212.withOpacity(0.07),
                        spreadRadius: 15,
                        blurRadius: 10,
                        offset: Offset(0, 8),
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        setHelceticaBold("Registered People", 18, blue_0a84ff, FontWeight.w500, FontStyle.normal),
                        Icon(Icons.arrow_forward_ios_rounded, color: blue_0a84ff,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
