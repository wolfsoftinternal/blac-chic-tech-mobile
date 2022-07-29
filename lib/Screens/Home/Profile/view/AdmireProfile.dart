// ignore_for_file: prefer_const_constructors

import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/Profile.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/SeeAllAdmires.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/AdmireProfileList.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class AdmireProfile extends StatefulWidget {
  const AdmireProfile({Key? key}) : super(key: key);

  @override
  State<AdmireProfile> createState() => _AdmireProfileState();
}

class _AdmireProfileState extends State<AdmireProfile> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  VideoController videoController = Get.put(VideoController());
  PageController pageController = PageController();
  List<Widget>? list;
  bool hadReachedEnd = false;
  SignupModel? myModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkNet(context).then(
      (value) {
        controller.admireListAPI(context, null);
        videoController.userListAPI(context, true);
      },
    );
    controller.addListener(() {});
    init();
  }

  init() async {
    var preferences = MySharedPref();
    myModel =
        await preferences.getSignupModel(SharePreData.keySignupModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => 
        myModel == null
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Center(
                  child: CircularProgressIndicator(
                    color: black, 
                    strokeWidth: 2
                  )
                ),
              )
            : 
            Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  myModel == null ? Container() :
                  Expanded(
                    child: Stack(
                      children: [
                        PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: pageController,
                            itemCount: controller.admireList.isEmpty ? 1 : controller.admireList.length,
                            // onPageChanged: (v) {
                            //   if (v == controller.admireList.length - 1) {
                            //     hadReachedEnd = true;
                            //   }
                            // },
                            itemBuilder: (BuildContext context, int index) {
                              return AdmireProfileList(
                                  // admireList: controller.admireList[index]
                                  );
                            }),
                        // Padding(
                        //   padding:
                        //       const EdgeInsets.only(left: 15.0, right: 15.0),
                        //   child: Center(
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         GestureDetector(
                        //           onTap: () {
                        //             pageController.previousPage(
                        //                 duration: Duration(milliseconds: 300),
                        //                 curve: Curves.fastOutSlowIn);
                        //           },
                        //           child: Container(
                        //             height: 80,
                        //             width: 50,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               color: white_ffffff,
                        //             ),
                        //             child: Icon(
                        //               Icons.arrow_back,
                        //               color: grey_aaaaaa,
                        //               size: 35,
                        //             ),
                        //           ),
                        //         ),
                        //         GestureDetector(
                        //           onTap: () {
                        //             if (hadReachedEnd == true) {
                        //               pageController.jumpToPage(0);
                        //               hadReachedEnd = false;
                        //             } else {
                        //               pageController.nextPage(
                        //                   duration: Duration(milliseconds: 300),
                        //                   curve: Curves.fastOutSlowIn);
                        //             }
                        //           },
                        //           child: Container(
                        //             height: 80,
                        //             width: 50,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(5.0),
                        //               color: white_ffffff,
                        //             ),
                        //             child: Icon(
                        //               Icons.arrow_forward,
                        //               color: grey_aaaaaa,
                        //               size: 35,
                        //             ),
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  controller.admireList.isEmpty ? Container() :
                  Padding(
                    padding:  EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Row(
                      children: [
                        setHelceticaBold(
                            '${myModel!.data!.firstName.toString().capitalizeFirst} Admires',
                            14.sp,
                            black_121212,
                            FontWeight.w500,
                            FontStyle.normal,
                            -0.28),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to( SeeAllAdmires(type: 'user'));
                          },
                          child: setHelveticaMedium('See More', 12.sp, grey_aaaaaa,
                              FontWeight.w500, FontStyle.normal, -0.24),
                        ),
                         SizedBox(
                          width: 5.w,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: grey_aaaaaa,
                          size: 12,
                        )
                      ],
                    ),
                  ),
                  controller.admireList.isEmpty ? Container() :
                  Padding(
                    padding:
                         EdgeInsets.only( top: 16.h),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: double.infinity,
                      child: ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => SizedBox(
                          width: 16.w,
                        ),
                        padding: EdgeInsets.only(left: 24.w, right: 24.w,),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.admireList.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  if (myModel!.data!.id == controller.admireList[index].admireDetails!.id) {
                                controller.userProfileAPI(context, true).then((val){
                                  Get.to(
                                        Profile(), 
                                        duration: Duration(milliseconds: 500),
                                        transition: Transition.downToUp 
                                      );
                                });
                              } else {
                                controller.admireProfileAPI(
                                    context, controller.admireList[index].admireDetails!.id).then((val){
                                      Get.to(
                                        Profile(), 
                                        duration: Duration(milliseconds: 500),
                                        transition: Transition.downToUp 
                                      );
                                    });
                              }
                                },
                                child: CircularProfileAvatar(
                                  '',
                                  radius: 24,
                                  child: controller.admireList[index]
                                              .admireDetails!.image ==
                                          null
                                      ? SvgPicture.asset(
                                          placeholder,
                                          height: 48.h,
                                          width: 48.w,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl: controller
                                              .admireList[index]
                                              .admireDetails!
                                              .image!,
                                          height: 48.h,
                                          width: 48.w,
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              SvgPicture.asset(
                                            placeholder,
                                                height: 48.h,
                                                width: 48.w,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              SvgPicture.asset(
                                            placeholder,
                                                height: 48.h,
                                                width: 48.w,
                                          ),
                                        ),
                                ),
                              ),
                               SizedBox(
                                height: 4.h,
                              ),
                              setHelveticaMedium(
                                  controller.admireList[index]
                                          .admireDetails!.firstName.toString().capitalizeFirst ??
                                      "",
                                  12.sp,
                                  black_121212,
                                  FontWeight.w500,
                                  FontStyle.normal,
                                  -0.24),
                            ],
                          );
                        }),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    videoController.searchController.value.text = "";
  }
}
