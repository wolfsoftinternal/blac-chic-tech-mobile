import 'package:blackchecktech/Layout/BlackButton.dart';
import 'package:blackchecktech/Layout/ToolbarWithHeaderCenterTitle.dart';
import 'package:blackchecktech/Screens/Home/CreateEvent/controller/EventController.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
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
      body: Column(
        children: [
          const SizedBox(
                height: 60,
              ),
          ToolbarWithHeaderCenterTitle('Create Event'),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.only(left: 24.w,right: 24.w,top: 40.h,bottom: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // UPLOAD VIDEO
                    Text(
                        "EVENT DETAILS",
                        style:  TextStyle(
                            color:   grey_aaaaaa,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.sp
                        ),
                        textAlign: TextAlign.left
                    ),

                    SizedBox(height: 25.h,),

                    Container(
                      decoration: SpinnerDecorationBorder,
                      height:MediaQuery.of(context).size.height/1.7 ,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:  EdgeInsets.only(
                                  top: 4.h, bottom: 2.h, right: 24.w, left: 16.w),
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
                                  hintText: 'Type here for the event details...',
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
            child: BlackButton("Publish Event", Colors.white, (){
                if(controller.detailController.value.text == ''){
                  snackBar(context, 'Enter event detail');
                  return;
                }
                checkNet(context).then((value){
                  controller.createEventAPI(context);
                });
            }),
          )
        ],
      ),
    );
  }
}
