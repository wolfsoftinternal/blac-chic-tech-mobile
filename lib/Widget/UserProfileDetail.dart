import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/controller/AdmireProfileController.dart';
import 'package:blackchecktech/Screens/Home/Profile/model/AdmireListModel.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/SelectedUserProfile.dart';
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

class UserProfileDetails extends StatefulWidget {
  final UserDetails userDetails;
  const UserProfileDetails({Key? key, required this.userDetails})
      : super(key: key);

  @override
  State<UserProfileDetails> createState() => _UserProfileDetailsState();
}

class _UserProfileDetailsState extends State<UserProfileDetails> {
  AdmireProfileController controller = Get.put(AdmireProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.userDetails.image == null
            ? SvgPicture.asset(
                placeholder,
                height: MediaQuery.of(context).size.height * .83,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            : CachedNetworkImage(
                imageUrl: widget.userDetails.image!,
                // widget.admireList.admireDetails!.image!,
                height: MediaQuery.of(context).size.height * .83,
                width: double.infinity,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SvgPicture.asset(
                  placeholder,
                  height: MediaQuery.of(context).size.height * .83,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                errorWidget: (context, url, error) => SvgPicture.asset(
                  placeholder,
                  height: MediaQuery.of(context).size.height * .83,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
        Container(
          color: Colors.black.withOpacity(0.3),
          height: MediaQuery.of(context).size.height * .83,
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
                    createBottomSheet(context, widget.userDetails.id);
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
                    // Get.to(ProfileSetting());
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
                      widget.userDetails.userName != null
                          ? widget.userDetails.userName!
                          : widget.userDetails.firstName!,
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
              SizedBox(height: MediaQuery.of(context).size.height * .52),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.80,
                    height: MediaQuery.of(context).size.width * 0.10,
                    child: FittedBox(
                      child: setHelceticaBold(
                          // widget.admireList.admireDetails!.fullName != null
                          //     ? widget.admireList.admireDetails!.fullName!
                          //         .toUpperCase()
                          //     : "",
                          widget.userDetails.fullName ?? "".toUpperCase(),
                          40.sp,
                          white_ffffff,
                          FontWeight.w600,
                          FontStyle.normal,
                          -1.6),
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
                      widget.userDetails.currentJobs != null
                          ? widget.userDetails.currentJobs!.title!
                                  .toUpperCase() +
                              ' - ' +
                              widget.userDetails.currentJobs!.companyName!
                                  .toUpperCase()
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
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .69,
              ),
              GestureDetector(
                onTap: () {
                  // var preferences = MySharedPref();
                  // SignupModel? modelM =
                  //     await preferences.getSignupModel(SharePreData.keySignupModel);

                  // if (modelM!.data!.id == widget.admireList.admireId) {
                  //   controller.userProfileAPI(context);

                  Get.to(SelectedUserProfile(userDetails: widget.userDetails));

                  // }
                  //  else {
                  // controller.admireProfileAPI(
                  //   context, widget.admireList.admireDetails!.id
                  // );
                  // }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Color(0x33121212),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 8.h, bottom: 8.h, left: 16.w, right: 16.w),
                        child: setHelveticaMedium('View Profile', 16.sp,
                            black_121212, FontWeight.w500, FontStyle.normal),
                      ),
                    ),
                  ],
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
                height: MediaQuery.of(context).size.height * .76,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // widget.admireList.admireDetails!.cityDetails != null
                  widget.userDetails.cityDetails != null
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
                    widget.userDetails.cityDetails != null
                        ?
                        // widget.userDetails.cityDetails!.name! +
                        //     ', ' +
                        widget.userDetails.stateDetails!.name! +
                            ', ' +
                            widget.userDetails.countryDetails!.name!
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
    );
  }
}
