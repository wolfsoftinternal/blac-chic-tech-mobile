import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_height.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/SpinnerDecorationBorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateEventDetail extends StatefulWidget {
  const CreateEventDetail({Key? key}) : super(key: key);

  @override
  _CreateEventDetailState createState() => _CreateEventDetailState();
}

class _CreateEventDetailState extends State<CreateEventDetail> {
  EventController controller = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            ToolbarWithHeaderCenterTitle('Create Event'),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 24.w, right: 24.w, top: 40.h, bottom: 24.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // UPLOAD VIDEO
                      Text("EVENT DETAILS",
                          style: TextStyle(
                              color: grey_aaaaaa,
                              fontWeight: FontWeight.w900,
                              fontFamily: "Roboto",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp),
                          textAlign: TextAlign.left),

                      SizedBox(
                        height: 25.h,
                      ),

                      Container(
                        decoration: SpinnerDecorationBorder,
                        height: MediaQuery.of(context).size.height / 1.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 4.h,
                                    bottom: 2.h,
                                    right: 24.w,
                                    left: 16.w),
                                child: TextFormField(
                                  controller: controller.detailController.value,
                                  minLines: 2,
                                  maxLines: 30,
                                  keyboardType: TextInputType.multiline,
                                  style: TextStyle(
                                      color: black_121212,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: helveticaNeueNeue_medium,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.zero,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText:
                                        'Type here for the event details...',
                                    hintStyle: TextStyle(
                                        color: grey_aaaaaa,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: helveticaNeueNeue_medium,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14.sp),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: const Color(0x17747796).withOpacity(0.07),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: const Offset(0, 10), // changes position of shadow
                    ),
                  ]),
                  child: SizedBox(
                    width: double.infinity,
                    height: HeightData.fiftyfive,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 36, 48, 69),
                              Color(0xff04080f)
                            ],
                            stops: [0.0, 1.0],
                          ),
                        ),
                        child: ElevatedButton(
                            child: 
                            controller.isLoading.value == false
                                ? Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Publish Event",
                                            style: TextStyle(
                                                fontFamily: helvetica_neu_bold,
                                                fontSize: 16.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Center(
                                  child: Container(
                                    height: 50,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                        color: white,
                                        strokeWidth: 2.0,
                                      ),
                                  ),
                                ), // Button
                            onPressed: () {
                              if (controller.isLoading.value == false) {
                                if (controller.detailController.value.text ==
                                    '') {
                                  snackBar(context, 'Enter event detail');
                                  return;
                                }
                                checkNet(context).then((value) {
                                  controller.createEventAPI(context);
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              onSurface: Colors.transparent,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(
                                    color: black_121212, width: 0),
                              ),
                            ))),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
