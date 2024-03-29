import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/Profile.dart';
import 'package:blackchecktech/Screens/Home/Settings/view/ProfileSetting.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:blackchecktech/Utils/preference_utils.dart';
import 'package:blackchecktech/Utils/share_predata.dart';
import 'package:blackchecktech/Widget/CreateBottomSheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AdmireProfileList extends StatefulWidget {
  // final AdmireList admireList;
  const AdmireProfileList({Key? key}) : super(key: key);

  @override
  State<AdmireProfileList> createState() => _AdmireProfileListState();
}

class _AdmireProfileListState extends State<AdmireProfileList> {
  AdmireProfileController controller = Get.put(AdmireProfileController());
  int userId = 0;
  SignupModel? myModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    var preferences = MySharedPref();
    myModel = await preferences.getSignupModel(SharePreData.keySignupModel);
    userId = myModel?.data?.id?.toInt() ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return myModel == null
        ? SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: Center(
                child: CircularProgressIndicator(color: black, strokeWidth: 2)),
          )
        : GestureDetector(
            onVerticalDragEnd: (val) {
              controller.userProfileAPI(context, true).then((val) {
                Get.to(Profile(),
                    duration: Duration(milliseconds: 500),
                    transition: Transition.downToUp);
              });
            },
            child: Stack(
              children: [
                myModel?.data?.image == null
                    ? SvgPicture.asset(
                        placeholder,
                        height: controller.admireList.isEmpty
                            ? MediaQuery.of(context).size.height
                            : MediaQuery.of(context).size.height * .83,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: myModel?.data?.image ?? "",
                        // widget.admireList.admireDetails!.image!,
                        height: controller.admireList.isEmpty
                            ? MediaQuery.of(context).size.height
                            : MediaQuery.of(context).size.height * .83,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => SizedBox(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: Center(
                              child: CircularProgressIndicator(
                                  color: black, strokeWidth: 2)),
                        ),
                        errorWidget: (context, url, error) => SizedBox(
                          height: MediaQuery.of(context).size.height * 0.75,
                          child: Center(
                              child: CircularProgressIndicator(
                                  color: black, strokeWidth: 2)),
                        ),
                      ),
                Container(
                  color: Colors.black.withOpacity(0.3),
                  height: controller.admireList.isEmpty
                      ? MediaQuery.of(context).size.height
                      : MediaQuery.of(context).size.height * .83,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w, top: 50.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            icon_back_black_arrow,
                            width: 24.w,
                            height: 24.h,
                            color: white_ffffff,
                          )),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            createBottomSheet(context, myModel?.data?.id ?? "");
                          },
                          child:
                              // userId == widget.admireList.admireDetails!.id ?
                              Container(
                                  height: 48.h,
                                  width: 48.w,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.r),
                                    child: SvgPicture.asset(
                                      add_icon,
                                      width: 24.w,
                                      height: 24.h,
                                    ),
                                  ))
                          // : Container(
                          //     height: 48,
                          //     width: 48,
                          //   )
                          ),
                      GestureDetector(
                          onTap: () {
                            Get.to(ProfileSetting())!.then((value) {
                              init();
                            });
                          },
                          child:
                              // userId == widget.admireList.admireDetails!.id ?
                              SvgPicture.asset(
                            settings_icon,
                            height: 48.h,
                            width: 48.w,
                          )
                          // : GestureDetector(
                          //     onTap: () {
                          //       displayBottomSheet(context);
                          //     },
                          //     child: Container(
                          //       height: 48,
                          //       width: 48,
                          //       child: Icon(Icons.more_horiz, color: Colors.white),
                          //     ),
                          //   ),
                          ),
                      SizedBox(
                        width: 12.w,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.50,
                        height: MediaQuery.of(context).size.width * 0.068,
                        child: FittedBox(
                          child: setHelceticaBold(
                              // widget.admireList.admireDetails!.userName != null
                              //     ? "@" + widget.admireList.admireDetails!.userName!
                              //     : "@" + widget.admireList.admireDetails!.firstName!,
                              myModel?.data?.userName != null
                                  ? (myModel?.data?.userName ?? "")
                                  : (myModel?.data?.firstName ?? ""),
                              20.sp,
                              white_ffffff,
                              FontWeight.w600,
                              FontStyle.normal,
                              -0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .52),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.80,
                            height: MediaQuery.of(context).size.width * 0.13,
                            child: FittedBox(
                              child: setHelceticaBold(
                                  // widget.admireList.admireDetails!.fullName != null
                                  //     ? widget.admireList.admireDetails!.fullName!
                                  //         .toUpperCase()
                                  //     : "",
                                  myModel?.data?.fullName != null
                                      ? (myModel?.data?.fullName ?? "")
                                          .toUpperCase()
                                      : "",
                                  40.sp,
                                  white_ffffff,
                                  FontWeight.w900,
                                  FontStyle.normal,
                                  1.6),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              // widget.admireList.admireDetails!.currentJobs != null
                              //     ? widget.admireList.admireDetails!.currentJobs!.title!
                              //             .toUpperCase() +
                              //         ' - ' +
                              //         widget.admireList.admireDetails!.currentJobs!
                              //             .companyName!
                              //             .toUpperCase()
                              //     : "",
                              myModel?.data?.currentJobs != null
                                  ? myModel?.data?.currentJobs?.title != null &&
                                          myModel?.data?.currentJobs
                                                  ?.companyName !=
                                              null
                                      ? '${myModel?.data?.currentJobs?.title!.toUpperCase()} - ${myModel?.data?.currentJobs?.companyName!.toUpperCase()}'
                                      : myModel?.data?.currentJobs?.title !=
                                              null
                                          ? '${myModel?.data?.currentJobs?.title!.toUpperCase()}'
                                          : myModel?.data?.currentJobs
                                                      ?.companyName !=
                                                  null
                                              ? '${myModel?.data?.currentJobs?.companyName!.toUpperCase()}'
                                              : ""
                                  : "",
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: helveticaNeueNeue_medium,
                                fontWeight: FontWeight.w600,
                                color: Colors.white70,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 6.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 24.w, right: 24.w),
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: MediaQuery.of(context).size.height * .69,
                //       ),
                //       GestureDetector(
                //         onTap: () {
                //           // var preferences = MySharedPref();
                //           // SignupModel? modelM =
                //           //     await preferences.getSignupModel(SharePreData.keySignupModel);

                //           // if (modelM!.data!.id == widget.admireList.admireId) {
                //           controller.userProfileAPI(context, true);
                //           // }
                //           //  else {
                //           // controller.admireProfileAPI(
                //           //   context, widget.admireList.admireDetails!.id
                //           // );
                //           // }
                //         },
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Container(
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(4.r),
                //                 color: grey_94ffffff,
                //               ),
                //               child: Padding(
                //                 padding: EdgeInsets.only(
                //                     top: 8.h,
                //                     bottom: 8.h,
                //                     left: 16.w,
                //                     right: 16.w),
                //                 child: setHelveticaMedium(
                //                     'View Profile',
                //                     16.sp,
                //                     black_121212,
                //                     FontWeight.w500,
                //                     FontStyle.normal),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .76,
                        // height: MediaQuery.of(context).size.height * .69,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // widget.admireList.admireDetails!.cityDetails != null
                          myModel?.data?.cityDetails != null
                              ? const Icon(
                                  Icons.location_on,
                                  size: 12,
                                  color: orange_ff881a,
                                )
                              : Container(),
                          setHelveticaMedium(
                            // widget.admireList.admireDetails!.cityDetails != null
                            //     ? widget.admireList.admireDetails!.cityDetails!.name! +
                            //         ', ' +
                            //         widget
                            //             .admireList.admireDetails!.stateDetails!.name! +
                            //         ', ' +
                            //         widget
                            //             .admireList.admireDetails!.countryDetails!.name!
                            //     : "",
                            myModel?.data?.cityDetails != null
                                ?
                                // (myModel?.data?.cityDetails?.name
                                //             .toString()
                                //             .capitalizeFirst ??
                                //         "") +
                                //     ', ' +
                                (myModel!.data!.stateDetails!.name
                                            .toString()
                                            .capitalizeFirst ??
                                        "") +
                                    ', ' +
                                    (myModel?.data?.countryDetails?.name
                                            .toString()
                                            .toUpperCase() ??
                                        "")
                                : "",
                            10.sp,
                            Colors.white70,
                            FontWeight.w600,
                            FontStyle.normal,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
