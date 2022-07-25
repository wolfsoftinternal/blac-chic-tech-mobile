// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/view/CreatEventUploadImage.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/view/EventLocation.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/view/InvitePeople.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utilities/TextfieldUtility.dart';
import 'package:blackchecktech/Utilities/Validator.dart';
import 'package:blackchecktech/Utils/CommonWidget.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/SpinnerDecorationBorder.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  EventController controller = Get.put(EventController());
  VideoController videoController = Get.put(VideoController());
  AdmireProfileController admireProfileController =
      Get.put(AdmireProfileController());
  final eventKey = GlobalKey<FormState>();
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  List cards = [""];
  List benefits = [];
  List cardsTicketPrice = [""];
  List ticketPrice = [];
  List<String> categoryController = [];
  List<TextEditingController> amountController = [];
  List<List<TextEditingController>> benefitController = [];
  int i = 0;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text("Premium",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "Premium"),
      DropdownMenuItem(
          child: Text("Platinum",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "Platinum"),
      DropdownMenuItem(
          child: Text("Gold",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "Gold"),
      DropdownMenuItem(
          child: Text("Silver",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "Silver"),
      DropdownMenuItem(
          child: Text("Bronze",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: helveticaNeueNeue_medium,
                  color: black_121212)),
          value: "Bronze"),
    ];
    return menuItems;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryController.add("Premium");
    List<TextEditingController> beneController = [];
    benefitController.add(beneController);
    for (var element in cardsTicketPrice) {
      var ticketCategoryController = element;
      var ticketAmountController = TextEditingController(text: element);
      var ticketBeneController = TextEditingController(text: element);

      categoryController.add(ticketCategoryController);
      amountController.add(ticketAmountController);
      beneController.add(ticketBeneController);

      for (var element in cards) {
        var benefitsController = TextEditingController(text: element);
        benefitController[0][0] = benefitsController;
      }
    }

    admireProfileController.isSearched.value = true;

    for (var item in videoController.userList) {
      if (item.isSpeakerSelected == true) {
        item.isSpeakerSelected = false;
      }

      if (item.isHostSelected == true) {
        item.isHostSelected = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      ToolbarWithHeaderCenterTitle('CREATE EVENT'),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: eventKey,
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w, right: 24.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: setRoboto('EVENT TITLE', 12.sp,
                                        grey_aaaaaa, FontWeight.w800),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.h),
                                    child:
                                        setTextFieldHelveticaMediumOrangeBorder(
                                            controller.titleController.value,
                                            "Type here...",
                                            false,
                                            TextInputType.text,
                                            TextInputAction.next,
                                            () => {
                                                  // on Chnages
                                                },
                                            validatetitle,
                                            false),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              setRoboto('START DATE', 12.sp,
                                                  grey_aaaaaa, FontWeight.w800),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 8.h),
                                                child:
                                                    setTextFieldHelveticaMediumOrangeBorder(
                                                        controller
                                                            .startDateController
                                                            .value,
                                                        "Select start date",
                                                        false,
                                                        TextInputType.text,
                                                        TextInputAction.next,
                                                        () => {
                                                              // on Chnages
                                                            },
                                                        validateStartDate,
                                                        true, () {
                                                  selectStartDate();
                                                }),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              setRoboto('END DATE', 12.sp,
                                                  grey_aaaaaa, FontWeight.w800),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 8.h),
                                                child:
                                                    setTextFieldHelveticaMediumOrangeBorder(
                                                        controller
                                                            .endDateController
                                                            .value,
                                                        "Select end date",
                                                        false,
                                                        TextInputType.text,
                                                        TextInputAction.next,
                                                        () => {
                                                              // on Chnages
                                                            },
                                                        validateEndDate,
                                                        true, () {
                                                  selectEndDate();
                                                }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16.h),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              setRoboto('START TIME', 12.sp,
                                                  grey_aaaaaa, FontWeight.w800),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 8.h),
                                                child:
                                                    setTextFieldHelveticaMediumOrangeBorder(
                                                        controller
                                                            .startTimeController
                                                            .value,
                                                        "Select start time",
                                                        false,
                                                        TextInputType.text,
                                                        TextInputAction.next,
                                                        () => {},
                                                        validateStartTime,
                                                        true, () async {
                                                  startTime =
                                                      await showTimePicker(
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                    context: context,
                                                    builder: (BuildContext context, Widget? child) {
                                                        return MediaQuery(
                                                          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                                                          child: child!,
                                                        );
                                                      },
                                                  );
                                                  if (startTime != null) {
                                                    if (startTime!.hour >
                                                        TimeOfDay.now().hour) {
                                                      controller.startTimeController.value.text =
                                                          startTime!.format(
                                                              context); //set the value of text field.
                                                    }
                                                  }
                                                }),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              setRoboto('END TIME', 12.sp, grey_aaaaaa, FontWeight.w800),
                                              Padding(
                                                padding: EdgeInsets.only(top: 8.h),
                                                child: setTextFieldHelveticaMediumOrangeBorder(
                                                  controller.endTimeController.value,
                                                  "Select end time",
                                                  false,
                                                  TextInputType.text,
                                                  TextInputAction.next,
                                                  () => {
                                                    // on Chnages
                                                  },
                                                  validateEndTime,
                                                  true, () async {
                                                  if (controller.startTimeController.value.text != '') {
                                                    endTime = await showTimePicker(
                                                      initialTime: TimeOfDay.now(),
                                                      context: context,
                                                      builder: (BuildContext context, Widget? child) {
                                                        return MediaQuery(
                                                          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                                                          child: child!,
                                                        );
                                                      },
                                                    );
                                                    // if (endTime != null) {
                                                    //   if(endTime!.period != startTime!.period){
                                                    //     controller.endTimeController.value.text = endTime!.format(context);
                                                    //   }else{
                                                    //     if (endTime!.hour > startTime!.hour) {
                                                          controller.endTimeController.value.text = endTime!.format(context);
                                                    //     }
                                                    //   }
                                                    // }
                                                  }else{
                                                    snackBar(context, 'Please select start time');
                                                  }
                                                }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16.h),
                                    child: setRoboto('VENUE', 12.sp,
                                        grey_aaaaaa, FontWeight.w800),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.h),
                                    child:
                                        setTextFieldHelveticaMediumOrangeBorder(
                                      controller.venueController.value,
                                      "Type here...",
                                      false,
                                      TextInputType.text,
                                      TextInputAction.next,
                                      () => {
                                        // on Chnages
                                      },
                                      validateVenue,
                                      false,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16.h),
                                    child: setRoboto('ADDRESS', 12.sp,
                                        grey_aaaaaa, FontWeight.w800),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(top: 8.h),
                                      child: TextFormField(
                                        controller:
                                            controller.addressController.value,
                                        style: TextStyle(
                                            color: black_121212,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: helvetica_neu_bold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp),
                                        readOnly: true,
                                        // validator: validateAddress,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Type here...',
                                          hintStyle: TextStyle(
                                              color: grey_aaaaaa,
                                              fontWeight: FontWeight.w500,
                                              fontFamily:
                                                  helveticaNeueNeue_medium,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            borderSide: BorderSide(
                                                color: grey_e8e8e8, width: 1),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            borderSide: BorderSide(
                                                color: grey_e8e8e8, width: 1),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            borderSide: BorderSide(
                                                color: orange_ff881a),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            borderSide:
                                                BorderSide(color: Colors.red),
                                          ),
                                          suffixIcon: Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: SvgPicture.asset(
                                                  icon_location)),
                                        ),
                                        cursorColor: black_121212,
                                        onTap: () {
                                          Get.to(EventLocation());
                                        },
                                      )),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              setRoboto('CITY', 12.sp,
                                                  grey_aaaaaa, FontWeight.w800),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 8.h),
                                                child:
                                                    setTextFieldHelveticaMediumOrangeBorder(
                                                  controller
                                                      .cityController.value,
                                                  "City",
                                                  false,
                                                  TextInputType.text,
                                                  TextInputAction.next,
                                                  () => {
                                                    // on Chnages
                                                  },
                                                  null,
                                                  true,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              setRoboto('COUNTRY', 12.sp,
                                                  grey_aaaaaa, FontWeight.w800),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 8.h),
                                                child:
                                                    setTextFieldHelveticaMediumOrangeBorder(
                                                        controller
                                                            .countryController
                                                            .value,
                                                        "Country",
                                                        false,
                                                        TextInputType.text,
                                                        TextInputAction.next,
                                                        () => {
                                                              // on Chnages
                                                            },
                                                        null,
                                                        true),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 16.h),
                                    child: setRoboto('ADMISSION OPTIONS', 12.sp,
                                        grey_aaaaaa, FontWeight.w800),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 18.h),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              controller
                                                  .selectedAdmission.value = 0;
                                              categoryController = [];
                                              amountController = [];
                                              benefitController = [];
                                              cardsTicketPrice = [""];

                                              categoryController.add("Premium");
                                              List<TextEditingController>
                                                  beneController = [];
                                              benefitController
                                                  .add(beneController);
                                              for (var element
                                                  in cardsTicketPrice) {
                                                var ticketCategoryController =
                                                    element;
                                                var ticketAmountController =
                                                    TextEditingController(
                                                        text: element);
                                                var ticketBeneController =
                                                    TextEditingController(
                                                        text: element);

                                                categoryController.add(
                                                    ticketCategoryController);
                                                amountController.add(
                                                    ticketAmountController);
                                                beneController
                                                    .add(ticketBeneController);

                                                for (var element in cards) {
                                                  var benefitsController =
                                                      TextEditingController(
                                                          text: element);
                                                  benefitController[0][0] =
                                                      benefitsController;
                                                }
                                              }
                                            });
                                          },
                                          child: Container(
                                              height: 22.h,
                                              width: 22.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4.r)),
                                                  border: Border.all(
                                                      color: controller
                                                                  .selectedAdmission
                                                                  .value ==
                                                              0
                                                          ? orange_ff881a
                                                          : const Color(
                                                              0xffdbdbdb),
                                                      width: 1),
                                                  color: controller
                                                              .selectedAdmission
                                                              .value ==
                                                          0
                                                      ? orange_ff881a
                                                      : const Color(
                                                          0xffffffff)),
                                              child: controller
                                                          .selectedAdmission
                                                          .value ==
                                                      0
                                                  ? Icon(
                                                      Icons.check,
                                                      size: 18.0.r,
                                                      color: Colors.white,
                                                    )
                                                  : Icon(
                                                      Icons.check,
                                                      size: 18.0.r,
                                                      color: Colors.white,
                                                    )),
                                        ),
                                        SizedBox(width: 8.w),
                                        setRoboto(
                                            'Ticket Price',
                                            12.sp,
                                            controller.selectedAdmission
                                                        .value ==
                                                    0
                                                ? black_121212
                                                : grey_aaaaaa,
                                            FontWeight.w900),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              controller
                                                  .selectedAdmission.value = 1;
                                              benefitController = [];
                                              cardsTicketPrice = [""];
                                              List<TextEditingController>
                                                  beneController = [];
                                              benefitController
                                                  .add(beneController);
                                              for (var element
                                                  in cardsTicketPrice) {
                                                var ticketBeneController =
                                                    TextEditingController(
                                                        text: element);
                                                beneController
                                                    .add(ticketBeneController);

                                                for (var element in cards) {
                                                  var benefitsController =
                                                      TextEditingController(
                                                          text: element);
                                                  benefitController[0][0] =
                                                      benefitsController;
                                                }
                                              }
                                            });
                                          },
                                          child: Container(
                                              height: 22.h,
                                              width: 22.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4.r)),
                                                  border: Border.all(
                                                      color: controller
                                                                  .selectedAdmission
                                                                  .value ==
                                                              1
                                                          ? orange_ff881a
                                                          : const Color(
                                                              0xffdbdbdb),
                                                      width: 1),
                                                  color: controller
                                                              .selectedAdmission
                                                              .value ==
                                                          1
                                                      ? orange_ff881a
                                                      : const Color(
                                                          0xffffffff)),
                                              child: controller
                                                          .selectedAdmission
                                                          .value ==
                                                      1
                                                  ? Icon(
                                                      Icons.check,
                                                      size: 18.0.r,
                                                      color: Colors.white,
                                                    )
                                                  : Icon(
                                                      Icons.check,
                                                      size: 18.0.r,
                                                      color: Colors.white,
                                                    )),
                                        ),
                                        SizedBox(width: 8.0),
                                        setRoboto(
                                            'Invite Only',
                                            12.sp,
                                            controller.selectedAdmission
                                                        .value ==
                                                    1
                                                ? black_121212
                                                : grey_aaaaaa,
                                            FontWeight.w900),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              controller
                                                  .selectedAdmission.value = 2;
                                              benefitController = [];
                                              cardsTicketPrice = [""];
                                              List<TextEditingController>
                                                  beneController = [];
                                              benefitController
                                                  .add(beneController);
                                              for (var element
                                                  in cardsTicketPrice) {
                                                var ticketBeneController =
                                                    TextEditingController(
                                                        text: element);
                                                beneController
                                                    .add(ticketBeneController);

                                                for (var element in cards) {
                                                  var benefitsController =
                                                      TextEditingController(
                                                          text: element);
                                                  benefitController[0][0] =
                                                      benefitsController;
                                                }
                                              }
                                            });
                                          },
                                          child: Container(
                                              height: 22.h,
                                              width: 22.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4.r)),
                                                  border: Border.all(
                                                      color: controller
                                                                  .selectedAdmission
                                                                  .value ==
                                                              2
                                                          ? orange_ff881a
                                                          : const Color(
                                                              0xffdbdbdb),
                                                      width: 1),
                                                  color: controller
                                                              .selectedAdmission
                                                              .value ==
                                                          2
                                                      ? orange_ff881a
                                                      : const Color(
                                                          0xffffffff)),
                                              child: controller
                                                          .selectedAdmission
                                                          .value ==
                                                      2
                                                  ? Icon(
                                                      Icons.check,
                                                      size: 18.0.r,
                                                      color: Colors.white,
                                                    )
                                                  : Icon(
                                                      Icons.check,
                                                      size: 18.0.r,
                                                      color: Colors.white,
                                                    )),
                                        ),
                                        SizedBox(width: 8.0),
                                        setRoboto(
                                            'Free',
                                            12.sp,
                                            controller.selectedAdmission
                                                        .value ==
                                                    2
                                                ? black_121212
                                                : grey_aaaaaa,
                                            FontWeight.w900),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          controller.selectedAdmission.value ==
                                                  0
                                              ? cardsTicketPrice.length
                                              : 1,
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            controller.selectedAdmission
                                                        .value ==
                                                    0
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 24.h),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        setRoboto(
                                                            "CATEGORY TYPE",
                                                            12.sp,
                                                            grey_aaaaaa,
                                                            FontWeight.w800),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 8.h),
                                                          child: Container(
                                                            height: 48.h,
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                SpinnerDecorationBorder,
                                                            child:
                                                                DropdownButtonHideUnderline(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .only(
                                                                  left: 10.w,
                                                                  right: 10.w,
                                                                ),
                                                                child: DropdownButton<
                                                                        String>(
                                                                    dropdownColor:
                                                                        Colors
                                                                            .white,
                                                                    value: categoryController[i]
                                                                        .toString(),
                                                                    hint: Text(
                                                                        "Select Category",
                                                                        style: TextStyle(
                                                                            color:
                                                                                grey_aaaaaa,
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontFamily:
                                                                                helveticaNeueNeue_medium,
                                                                            fontStyle: FontStyle
                                                                                .normal,
                                                                            fontSize: 14
                                                                                .sp
                                                                                .sp),
                                                                        textAlign:
                                                                            TextAlign
                                                                                .left),
                                                                    icon: SvgPicture
                                                                        .asset(
                                                                      icon_down_arrow_spinner,
                                                                      width:
                                                                          12.w,
                                                                      height:
                                                                          12.h,
                                                                    ),
                                                                    onChanged:
                                                                        (String? newValue) async {
                                                                      setState(
                                                                          () {
                                                                        categoryController[i] =
                                                                            newValue!;
                                                                      });
                                                                    },
                                                                    items: dropdownItems),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 16.h,
                                                        ),
                                                        // setRoboto(
                                                        //     'AMOUNT',
                                                        //     12.sp,
                                                        //     grey_aaaaaa,
                                                        //     FontWeight.w800),
                                                        // SizedBox(
                                                        //   height: 8.h,
                                                        // ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 49.w,
                                                              height: 49.h,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    orange_ff881a,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          4),
                                                                ),
                                                              ),
                                                              child: Center(
                                                                  child: setHelveticaMedium(
                                                                      '\$',
                                                                      18.0,
                                                                      white_ffffff,
                                                                      FontWeight
                                                                          .w700,
                                                                      FontStyle
                                                                          .normal)),
                                                            ),
                                                            Expanded(
                                                                child:
                                                                    TextFormField(
                                                              controller:
                                                                  amountController[
                                                                      i],
                                                              style: TextStyle(
                                                                  color:
                                                                      black_121212,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      helveticaNeueNeue_medium,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize:
                                                                      14.sp),
                                                              keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                              validator:
                                                                  validateAmount,
                                                              decoration:
                                                                  InputDecoration(
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                hintText:
                                                                    'Type here...',
                                                                hintStyle: TextStyle(
                                                                    color:
                                                                        grey_aaaaaa,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        helveticaNeueNeue_medium,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontSize:
                                                                        14.sp),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              4)),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              grey_e8e8e8,
                                                                          width:
                                                                              1),
                                                                ),
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .white70,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              4)),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              grey_e8e8e8,
                                                                          width:
                                                                              1),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                      topRight:
                                                                          Radius.circular(
                                                                              4),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              4)),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              orange_ff881a),
                                                                ),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : controller.selectedAdmission
                                                            .value ==
                                                        1
                                                    ? Column(
                                                        children: [
                                                          controller
                                                                  .selectedList
                                                                  .isNotEmpty
                                                              ? Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 8
                                                                              .h),
                                                                  child: Row(
                                                                    children: [
                                                                      SizedBox(
                                                                        width: controller.selectedList.length ==
                                                                                1
                                                                            ? 25
                                                                            : controller.selectedList.length == 2
                                                                                ? 35
                                                                                : 55,
                                                                        height:
                                                                            50.h,
                                                                        child:
                                                                            Stack(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          children: <
                                                                              Widget>[
                                                                            if (controller.selectedList.isNotEmpty)
                                                                              SizedBox(
                                                                                width: 28.w,
                                                                                height: 28.h,
                                                                                child: CircularProfileAvatar(
                                                                                  '',
                                                                                  imageFit: BoxFit.fill,
                                                                                  child: controller.selectedList[0].image == null
                                                                                      ? SvgPicture.asset(placeholder)
                                                                                      : Image.network(
                                                                                          controller.selectedList[0].image!,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                  borderColor: Colors.white,
                                                                                  borderWidth: 1,
                                                                                  elevation: 2,
                                                                                  radius: 50,
                                                                                ),
                                                                              ),
                                                                            if (controller.selectedList.length >=
                                                                                2)
                                                                              Positioned(
                                                                                left: 10.w,
                                                                                child: SizedBox(
                                                                                  width: 28.w,
                                                                                  height: 28.h,
                                                                                  child: CircularProfileAvatar(
                                                                                    '',
                                                                                    child: controller.selectedList[1].image == null
                                                                                        ? SvgPicture.asset(placeholder)
                                                                                        : Image.network(
                                                                                            controller.selectedList[1].image!,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                    borderColor: Colors.white,
                                                                                    borderWidth: 1,
                                                                                    elevation: 2,
                                                                                    radius: 50,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (controller.selectedList.length >
                                                                                2)
                                                                              Positioned(
                                                                                left: 20.w,
                                                                                child: SvgPicture.asset(
                                                                                  black_more_dot_icon,
                                                                                  width: 30.w,
                                                                                  height: 30.h,
                                                                                ),
                                                                              )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                2.h,
                                                                            left: 1.w),
                                                                        child: setRoboto(
                                                                            controller.selectedList.length.toString() +
                                                                                " People Invited",
                                                                            14.sp,
                                                                            black_121212,
                                                                            FontWeight.w800),
                                                                      ),
                                                                      Spacer(),
                                                                      InkWell(
                                                                        onTap:
                                                                            () {
                                                                          Get.to(InvitePeople(
                                                                            true,
                                                                            controller.selectedList,
                                                                          ))!
                                                                              .then((value) => setState(() {}));
                                                                        },
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(top: 2),
                                                                          child: setRoboto(
                                                                              "VIEW",
                                                                              12.sp,
                                                                              orange_ff881a,
                                                                              FontWeight.w800),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                )
                                                              : Container(),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 8.h),
                                                            child: InkWell(
                                                              onTap: () {
                                                                if (admireProfileController
                                                                        .isSearched
                                                                        .value ==
                                                                    true) {
                                                                  admireProfileController
                                                                      .isSearched
                                                                      .value = false;

                                                                  checkNet(
                                                                          context)
                                                                      .then(
                                                                          (value) async {
                                                                    videoController
                                                                        .PageNumber
                                                                        .value = 0;
                                                                    videoController
                                                                        .userList
                                                                        .clear();
                                                                    await videoController
                                                                        .userListAPI(
                                                                            context,
                                                                            true);

                                                                    Future.delayed(
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                        () {
                                                                      for (var item
                                                                          in videoController
                                                                              .userList) {
                                                                        for (var selectedItem
                                                                            in controller.selectedList) {
                                                                          if (selectedItem.id ==
                                                                              item.id) {
                                                                            item.isSpeakerSelected =
                                                                                selectedItem.isSpeakerSelected;
                                                                          }
                                                                        }
                                                                      }
                                                                      setState(
                                                                          () {});
                                                                    });
                                                                  });
                                                                }
                                                                Get.to(
                                                                        InvitePeople(
                                                                  false,
                                                                  controller
                                                                      .selectedList,
                                                                ))!
                                                                    .then((value) =>
                                                                        setState(
                                                                            () {}));
                                                              },
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4
                                                                                .r),
                                                                        // color: grey_f5f5f5
                                                                        border: Border.all(
                                                                            width:
                                                                                1,
                                                                            color:
                                                                                Color(0xff3e5edc))),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(16
                                                                              .r),
                                                                  child: Center(
                                                                    child: Text(
                                                                        "+ Invite People",
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff3e5edc),
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontFamily:
                                                                                roboto_bold,
                                                                            fontStyle: FontStyle
                                                                                .normal,
                                                                            fontSize: 14
                                                                                .sp),
                                                                        textAlign:
                                                                            TextAlign.left),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 16.h),
                                              child: setRoboto(
                                                  'BENEFITS',
                                                  12.sp,
                                                  grey_aaaaaa,
                                                  FontWeight.w900),
                                            ),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 8.h),
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemCount:
                                                            benefitController[i]
                                                                .length,
                                                        shrinkWrap: true,
                                                        padding:
                                                            EdgeInsets.zero,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom:
                                                                        14.0),
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  benefitController[
                                                                      i][index],
                                                              style: TextStyle(
                                                                  color:
                                                                      black_121212,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      helveticaNeueNeue_medium,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  fontSize:
                                                                      14.sp),
                                                              validator:
                                                                  validateBenifit,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: true,
                                                                // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                                                                hintText:
                                                                    'Type here...',
                                                                hintStyle: TextStyle(
                                                                    color:
                                                                        grey_aaaaaa,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        helveticaNeueNeue_medium,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    fontSize:
                                                                        14.sp),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              4)),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              grey_e8e8e8,
                                                                          width:
                                                                              1),
                                                                ),
                                                                filled: true,
                                                                fillColor: Colors
                                                                    .white70,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              4)),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              grey_e8e8e8,
                                                                          width:
                                                                              1),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              4)),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              orange_ff881a),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              4)),
                                                                  borderSide:
                                                                      BorderSide(
                                                                          color:
                                                                              Colors.red),
                                                                ),
                                                                suffixIcon: index ==
                                                                        0
                                                                    ? Icon(
                                                                        Icons
                                                                            .close,
                                                                        color:
                                                                            white_ffffff,
                                                                      )
                                                                    : GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            benefitController[i].remove(benefitController[i][index]);
                                                                          });
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .close,
                                                                          color:
                                                                              grey_aaaaaa,
                                                                        )),
                                                              ),
                                                              cursorColor:
                                                                  black_121212,
                                                            ),
                                                          );
                                                        }),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          var benefit =
                                                              TextEditingController(
                                                                  text: '');
                                                          benefitController[i]
                                                              .add(benefit);
                                                          cards.add("");
                                                        });
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.r),
                                                            color: grey_f5f5f5),
                                                        child: // Add More
                                                            Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  14.r),
                                                          child: Center(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Icon(
                                                                  Icons.add,
                                                                  size: 16,
                                                                  color:
                                                                      orange_ff881a,
                                                                ),
                                                                Text(
                                                                    " ADD MORE",
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff121212),
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            helvetica_neu_bold,
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        letterSpacing:
                                                                            0.7,
                                                                        fontSize: 12
                                                                            .sp),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        );
                                      }),
                                  controller.selectedAdmission.value != 0
                                      ? SizedBox(
                                          height: 100.h,
                                        )
                                      : Container(),
                                  controller.selectedAdmission.value == 0
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              categoryController.add("Premium");
                                              ++i;
                                              List<TextEditingController>
                                                  beneController = [];
                                              beneController.add(
                                                  TextEditingController(
                                                      text: ''));
                                              benefitController
                                                  .add(beneController);
                                              for (var element
                                                  in cardsTicketPrice) {
                                                var ticketCategoryController =
                                                    element;
                                                var ticketAmountController =
                                                    TextEditingController(
                                                        text: element);

                                                categoryController.add(
                                                    ticketCategoryController);
                                                amountController.add(
                                                    ticketAmountController);

                                                if (element.toString() == "") {
                                                  categoryController
                                                      .remove(element);
                                                  amountController
                                                      .remove(element);
                                                }

                                                for (var element in cards) {
                                                  var benefitsController =
                                                      TextEditingController(
                                                          text: element);
                                                  benefitController[i]
                                                      .add(benefitsController);

                                                  if (element.toString() ==
                                                      "") {
                                                    benefitController[i].remove(
                                                        benefitsController);
                                                  }
                                                }
                                              }
                                              cardsTicketPrice.add("");
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0, bottom: 100.0),
                                            child: setRoboto(
                                                '+ Add new ticket category',
                                                16.sp,
                                                orange_ff881a,
                                                FontWeight.w700),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: BlackButton("Next", Colors.white, () {
                if (eventKey.currentState!.validate()) {
                  benefits.clear();
                  ticketPrice.clear();

                  if (controller.selectedAdmission.value == 0) {
                    for (int i = 0; i < cardsTicketPrice.length; i++) {
                      for (int j = 0; j < benefitController[i].length; j++) {
                        benefits.add('"${benefitController[i][j].text}"');
                      }
                      ticketPrice.add({
                        '"price"': '"${amountController[i].text}"',
                        '"category"': '"${categoryController[i]}"',
                        '"benifits"': benefits
                      });
                    }

                    List itemList = [];
                    itemList.clear();
                    for (var item in ticketPrice) {
                      itemList.add(item);
                    }
                    controller.admissionDetails.clear();
                    controller.admissionDetails.value = itemList;
                    controller.admissionType.value = 'ticket_price';
                    print(controller.admissionDetails.value);
                  } else {
                    for (int i = 0; i < cardsTicketPrice.length; i++) {
                      for (int j = 0; j < benefitController[i].length; j++) {
                        benefits.add(benefitController[i][j].text);
                      }
                    }

                    List itemList = [];
                    itemList.clear();
                    for (var item in benefits) {
                      itemList.add(item);
                    }
                    controller.benefitDetails.value = itemList;
                    print(controller.benefitDetails.value);
                  }

                  if (controller.selectedAdmission.value == 1) {
                    controller.admissionType.value = 'invite_only';
                    if (controller.selectedList.isEmpty) {
                      snackBar(context, 'Please invite people');
                      return;
                    } else {
                      List list = [];
                      list.clear();
                      for (var item in controller.selectedList) {
                        list.add(item.id);
                      }
                      controller.inviteList.value = list.join(',');

                      Get.to(CreatEventUploadImage());
                    }
                    return;
                  } else if (controller.selectedAdmission.value == 2) {
                    controller.admissionType.value = 'free';
                  }
                  Get.to(CreatEventUploadImage());
                }
              }),
            )
          ],
        ),
      ),
    );
  }

  selectStartDate() async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime? tempPickedDate = DateTime.now();
        return SizedBox(
          height: 250.h,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: CupertinoButton(
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: orange_ff881a),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: CupertinoButton(
                        child: const Text('Done',
                            style: TextStyle(color: orange_ff881a)),
                        onPressed: () {
                          Navigator.of(context).pop(tempPickedDate);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    minimumDate: DateTime.now(),
                    initialDateTime: DateTime.now(),
                    maximumDate: DateTime(2040),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    final DateFormat formatter = DateFormat('MMM dd, yyyy');
    final String formattedDate = formatter.format(pickedDate!);

    controller.startDateController.value.text = formattedDate;
    print(controller.startDateController.value.text);
  }

  selectEndDate() async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime? tempPickedDate = DateTime.now();
        return SizedBox(
          height: 250.h,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: CupertinoButton(
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: orange_ff881a),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: CupertinoButton(
                        child: const Text('Done',
                            style: TextStyle(color: orange_ff881a)),
                        onPressed: () {
                          Navigator.of(context).pop(tempPickedDate);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    minimumDate: DateTime.now(),
                    initialDateTime: DateTime.now(),
                    maximumDate: DateTime(2040),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    final DateFormat formatter = DateFormat('MMM dd, yyyy');
    final String formattedDate = formatter.format(pickedDate!);

    controller.endDateController.value.text = formattedDate;
    print(controller.endDateController.value.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    videoController.searchController.value.text = "";
  }
}
