import 'dart:convert';
import 'dart:io';

import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/view/ConfirmLocation.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class EventLocation extends StatefulWidget {
  const EventLocation({Key? key}) : super(key: key);

  @override
  _EventLocationState createState() => _EventLocationState();
}

class _EventLocationState extends State<EventLocation> {
  EventController controller = Get.put(EventController());
  final List<Marker> _markers = [];

  late GoogleMapController _controller;
  double lat = 20.5937;
  double lng = 78.9629;
  String _address = "";

  late LocationData _currentPosition;
  Location _location = Location();
  bool _isLoading = false;
  final search = TextEditingController();

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    final marker = Marker(
      markerId: const MarkerId('0'),
      position: LatLng(lat, lng),
    );

    _markers.add(marker);
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await getLoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                // alignment: Alignment.center,
                children: [
                  GoogleMap(
                    initialCameraPosition:
                        CameraPosition(target: LatLng(lat, lng), zoom: 17),
                    markers: _markers.toSet(),
                    zoomControlsEnabled: false,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    onMapCreated: _onMapCreated,
                    padding: const EdgeInsets.only(
                      top: 40.0,
                    ),
                    onCameraMove: (position) {
                      setState(() {
                        _isLoading = true;
                        _markers.first = _markers.first
                            .copyWith(positionParam: position.target);

                        getAddress(position.target.latitude,
                            position.target.longitude);
                      });
                    },
                  ),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Image.asset(
                  //     icon_map_marker_png,
                  //     frameBuilder:
                  //         (context, child, frame, wasSynchronouslyLoaded) {
                  //       return Transform.translate(
                  //         offset: const Offset(8, -37),
                  //         child: child,
                  //       );
                  //     },
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                        onTap: () async {
                          _controller.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                  target: LatLng(_currentPosition.latitude!,
                                      _currentPosition.longitude!),
                                  zoom: 18),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              bottom: 21, left: 0, right: 0),
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 6, bottom: 6),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.green),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(30.0))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                icon_current_loc,
                                color: grey_3f3f3f,
                                height: 24,
                                width: 24,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Use current location",
                                  style: TextStyle(
                                    color: black_121212,
                                    fontFamily: helvetica_neu_bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.left),
                            ],
                          ),
                        )),
                  ),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(16.0),
                  //     child: Column(
                  //       children: [
                  //         const SizedBox(
                  //           height: 24,
                  //         ),
                  //         BackLayout(),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: 
                    Align(
                        //search input bar
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                            BackLayout(),
                            SizedBox(width: 20,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.70,
                              height: 52.r,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 6,
                                    blurRadius: 10,
                                    offset: Offset(1, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.6,
                                  child: TextField(
                                    controller: search,
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: const BorderSide(width: 0,color: Colors.transparent),
                                      ),
                                      disabledBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: const BorderSide(width: 0,color: Colors.transparent),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: const BorderSide(width: 0,color: Colors.transparent),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(18),
                                        borderSide: const BorderSide(width: 0,color: Colors.transparent),
                                      ),

                                      hintText: "Search Location",
                                      hintStyle: const TextStyle(
                                        fontFamily: helvetica_neu_bold,
                                        fontSize: 16,
                                        color: grey_3f3f3f),
                                    ),
                                    style: const TextStyle(
                                        fontFamily: helvetica_neu_bold,
                                        fontSize: 16,
                                        color: black_121212),
                                    cursorColor: orange_ff881a,
                                    onTap: (){
                                      //on search
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff4343b2).withOpacity(0.05),
                          offset: const Offset(0, 2),
                          blurRadius: 10,
                          spreadRadius: 6, // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 15,
                        // ),
                        // Align(
                        //   alignment: Alignment.topCenter,
                        //   child: Opacity(
                        //     opacity: 0.4000000059604645,
                        //     child: Container(
                        //         width: 48,
                        //         height: 4,
                        //         decoration: BoxDecoration(
                        //             borderRadius:
                        //                 BorderRadius.all(Radius.circular(4)),
                        //             color: const Color(0xff96a6a3))),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 14, left: 24, right: 24, bottom: 17),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Selected Location',
                                  style: TextStyle(
                                      color: grey_3f3f3f,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_light,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.0),
                                  textAlign: TextAlign.left),
                              const SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(location_pin,
                                      width: 24, height: 24),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    width: 260,
                                    child: Text(_address,
                                        style: const TextStyle(
                                            color: black_121212,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: helvetica_neu_bold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14),
                                        textAlign: TextAlign.left),
                                  ),

                                  // _buildBody(),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              BlackButton(
                                "Confirm Location",
                                Colors.white,
                                () {saveAddress(context);},
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getAddress(double lat, double lng) {
    GeoCode geoCode = GeoCode();
    geoCode.reverseGeocoding(latitude: lat, longitude: lng).then((value) =>
        // print("Geocode" + value.streetAddress.toString())

        setState(() {
          _isLoading = false;
          if (value.streetNumber == null) {
            _address = "${value.streetAddress} ${value.postal} ${value.city}";

            print("My address 1 :: " + _address.toString());
          } else if (value.streetAddress == null) {
            _address = "${value.streetNumber} ${value.postal} ${value.city}";

            print("My address 2 :: " + _address.toString());
          } else if (value.streetNumber == null &&
              value.streetAddress == null) {
            _address = "${value.region}${value.postal} ${value.city}";

            print("My address 3 :: " + _address);
          } else {
            _address =
                "${value.streetNumber} ${value.streetAddress} ${value.postal} ${value.city}";

            print("My address 4 :: " + _address);

            controller.street1Controller.value.text = value.streetNumber.toString();
            controller.street2Controller.value.text = value.streetAddress.toString();
            controller.cityController.value.text = value.city.toString();
            controller.countryController.value.text = value.countryName.toString();
            controller.landmarkController.value.text = value.region.toString();
            controller.addressController.value.text = _address;
            controller.latitude.value = lat;
            controller.longitude.value = lng;
          }
        }));
  }

  saveAddress(BuildContext context) async {
    // if (controller.latitude.value == 0.0) {
    //   snackBar(context, "Location is not fetched");
    //   return;
    // }
    // if (controller.longitude.value == 0.0) {
    //   snackBar(context, "Location is not fetched");
    //   return;
    // }

    Get.to(ConfirmLocation());
  }

  getLoc() async {
    _isLoading = true;
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // checking internet
    checkNet(context).then((value) async {
      // returning when no connection
      if (!value) return;
    });

    _currentPosition = await _location.getLocation();

    lat = _currentPosition.latitude!;
    lng = _currentPosition.longitude!;

    _controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 18),
      ),
    );

    getAddress(lat, lng);
  }
}
