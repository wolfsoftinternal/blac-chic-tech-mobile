import 'package:blackchecktech/Screens/Home/CreateVideo/controller/VideoController.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/SeeAllAdmires.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/internet_connection.dart';
import 'package:blackchecktech/Widget/AdmireProfileList.dart';
import 'package:blackchecktech/Widget/UserProfileDetail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class UserProfile extends StatefulWidget {

  final String selectedUserId;
  const UserProfile({Key? key, required this.selectedUserId,
  }) : super(key: key);



  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  VideoController videoController = Get.put(VideoController());
  PageController pageController = PageController();
  List<Widget>? list;
  bool hadReachedEnd = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkNet(context).then(
      (value) {
        controller.SelectedUserProfileAPI(context, widget.selectedUserId);
        dynamic body = {'user_id': widget.selectedUserId};
        controller.admireListAPI(context, body);
      },
    );
    controller.addListener(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: Obx(
        () => controller.selectedUserDetails == null
            ? Center(
                child: Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(loader, height: 20.h, width: 20.w)),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: pageController,
                            itemCount: 1,
                            onPageChanged: (v) {
                              // if (v == controller.admireList.length - 1) {
                              //   hadReachedEnd = true;
                              // }
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return UserProfileDetails(
                                  userDetails: controller.selectedUserDetails.value);
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
                  Padding(
                    padding:  EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Row(
                      children: [
                        setHelceticaBold(
                            '${controller.selectedUserDetails.value.firstName.toString().capitalizeFirst} Admires',
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
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
                               SizedBox(
                                height: 4.h,
                              ),
                              setHelveticaMedium(
                                  controller.admireList[index]
                                          .admireDetails!.firstName ??
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
}
