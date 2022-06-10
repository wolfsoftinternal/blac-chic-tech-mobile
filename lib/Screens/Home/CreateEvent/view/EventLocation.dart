import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarBackOnly.dart';
import 'package:blackchecktech/Screens/Authentication/signup/controller/StepsController.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/view/ConfirmLocation.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/controller/PostController.dart';
import 'package:blackchecktech/Screens/Home/CreatePost/view/PostLocation.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Styles/my_strings.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class EventLocation extends StatefulWidget {
  const EventLocation({Key? key}) : super(key: key);

  @override
  _EventLocationState createState() => _EventLocationState();
}

class _EventLocationState extends State<EventLocation> {
  EventController controller = Get.put(EventController());
  StepsController stepsController = Get.put(StepsController());
  PostController postController = Get.put(PostController());

  final List<Marker> _markers = [];

  late GoogleMapController _controller;
  double lat = 20.5937;
  double lng = 78.9629;
  String _address = "";

  late LocationData _currentPosition;
  final Location _location = Location();
  bool _isLoading = false;
  final search = TextEditingController();

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    final marker = Marker(
      markerId: const MarkerId('0'),
      position: LatLng(lat, lng),
    );

    _markers.add(marker);

    if(controller.latitude.value != 0.0 && controller.latitude.value != 0.0){
      _controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat, lng), zoom: 18),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkNet(context).then((value) {
      stepsController.countryListApi();
    });
    init();
  }

  init() async {
    await getLoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                          _currentPosition = await _location.getLocation();
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
                              border: Border.all(color: black_121212),
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
                               Text("Use current location",
                                  style: TextStyle(
                                    color: black_121212,
                                    fontFamily: helveticaNeueNeue_medium,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp,
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
                    padding:  EdgeInsets.only(top: 50.h),
                    child: Align(
                        //search input bar
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                            BackLayout(),
                             SizedBox(
                              width: 20.w,
                            ),
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
                                    offset: const Offset(
                                        1, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding:  EdgeInsets.only(left: 12.w),
                                      child: TextField(
                                        controller: postController.searchLocationController.value,
                                        readOnly: true,
                                        decoration: InputDecoration(

                                          // suffixIcon: Padding(
                                          //   padding:  EdgeInsets.all(16.0),
                                          //   child: SvgPicture.asset(light_search_icon,),
                                          // ),
                                          border: UnderlineInputBorder(
                                            borderRadius: BorderRadius.circular(18),
                                            borderSide: const BorderSide(
                                                width: 0,
                                                color: Colors.transparent),
                                          ),
                                          disabledBorder: UnderlineInputBorder(
                                            borderRadius: BorderRadius.circular(18),
                                            borderSide: const BorderSide(
                                                width: 0,
                                                color: Colors.transparent),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderRadius: BorderRadius.circular(18),
                                            borderSide: const BorderSide(
                                                width: 0,
                                                color: Colors.transparent),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderRadius: BorderRadius.circular(18),
                                            borderSide: const BorderSide(
                                                width: 0,
                                                color: Colors.transparent),
                                          ),
                                          hintText: "Search Location",
                                          hintStyle:  TextStyle(
                                              fontFamily: roboto_medium,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600,
                                              color: grey_aaaaaa),
                                        ),
                                        style:  TextStyle(
                                            fontFamily: roboto_medium,
                                            fontSize: 14.sp,
                                            color: black_121212),
                                        cursorColor: orange_ff881a,
                                        onTap: () {
                                          setState(() {
                                            Get.to(PostLocation())!
                                                .then((value) async {
                                              _address =
                                                  postController.address.value;
                                              List<geo.Location> locations =
                                                  await geo.locationFromAddress(
                                                      _address);
                                              getAddress(locations[0].latitude,
                                                  locations[0].longitude);

                                              _controller.moveCamera(
                                                CameraUpdate.newCameraPosition(
                                                  CameraPosition(
                                                      target: LatLng(
                                                          locations[0].latitude,
                                                          locations[0].longitude),
                                                      zoom: 18),
                                                ),
                                              );
                                            });
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(light_search_icon,
                                  width: 18.w,height: 18.h,),
                                  SizedBox(width: 15.w,)
                                ],
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

                              // Rectangle 1329
                              Center(
                                child: Opacity(
                                  opacity : 0.4000000059604645,
                                  child:   Container(
                                      width: 48,
                                      height: 4,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)
                                          ),
                                          color: const Color(0xff96a6a3)
                                      )
                                  ),
                                ),
                              ),

                               SizedBox(height: 18.h,),

                               Text(' Location',
                                  style: TextStyle(
                                      color: grey_aaaaaa,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.sp),
                                  textAlign: TextAlign.left),
                              const SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(icon_location,
                                      width: 24.w, height: 24.h),
                                   SizedBox(
                                    width: 8.w,
                                  ),
                                  SizedBox(
                                    width: 260.w,
                                    child: Text(_address,
                                        style:  TextStyle(
                                            color: black_121212,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: helvetica_neu_bold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        textAlign: TextAlign.left),
                                  ),

                                  // _buildBody(),
                                ],
                              ),
                               SizedBox(
                                height: 16.h,
                              ),
                              BlackButton(
                                "Confirm Location",
                                Colors.white,
                                () {
                                  saveAddress(context);
                                },
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

  Future<void> getAddress(double lat, double lng) async {    
    List<geo.Placemark> placemarks =
        await geo.placemarkFromCoordinates(lat, lng);

    _isLoading = false;
      _address = "${placemarks[0].street} ${placemarks[0].name} ${placemarks[0].subLocality} ${placemarks[0].locality} ${placemarks[0].postalCode} ${placemarks[0].country}";

      controller.street1Controller.value.text = placemarks[0].street.toString();
      controller.street2Controller.value.text = placemarks[0].subLocality.toString();
      controller.cityController.value.text = placemarks[0].subAdministrativeArea.toString();
      controller.countryController.value.text = placemarks[0].country.toString();
      controller.landmarkController.value.text = placemarks[0].name.toString();
      controller.addressController.value.text = _address;
      controller.latitude.value = lat;
      controller.longitude.value = lng;

    for (var item in stepsController.countrylist) {
      if (item.name == placemarks[0].country!) {
        controller.countryId.value = item.id!;
      }
    }
    if(controller.countryId.value != 0){
        checkNet(context).then((value) => stepsController.stateListApi(controller.countryId.value.toString()));
      }
    for (var item in stepsController.stateList) {
      if (item.name == placemarks[0].administrativeArea!) {
        controller.stateId.value = item.id!;
      }
    }
    if(controller.stateId.value != 0){
      checkNet(context).then((value) => stepsController.cityListApi(controller.countryId.value.toString(), controller.stateId.value.toString()));
    }
    for (var item in stepsController.cityList) {
      if (item.name == placemarks[0].subAdministrativeArea!) {
        controller.cityId.value = item.id!;
      }
    }
    setState(() {});
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

    Get.to(const ConfirmLocation());
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

    if(controller.latitude.value == 0.0 && controller.longitude.value == 0.0){
      _currentPosition = await _location.getLocation();
      controller.latitude.value = _currentPosition.latitude!;
      controller.longitude.value = _currentPosition.longitude!;

      lat = controller.latitude.value.toDouble();
      lng = controller.longitude.value.toDouble();

      _controller.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat, lng), zoom: 18),
        ),
      );
    }else{
      lat = controller.latitude.value.toDouble();
      lng = controller.longitude.value.toDouble();
      _onMapCreated;
    }
  
    getAddress(lat, lng);
  }
}
