import 'package:blackchecktech/Layout/ToolbarBackOnlyProfile.dart';
import 'package:blackchecktech/Model/profilePerson.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Utilities/Constant.dart';
import 'package:blackchecktech/Utilities/TextUtilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../Layout/BlackNextButton.dart';
import '../Styles/my_icons.dart';
import '../Styles/my_strings.dart';

class OwnProfile extends StatefulWidget {
  const OwnProfile({Key? key}) : super(key: key);

  @override
  _OwnProfileState createState() => _OwnProfileState();
}

class _OwnProfileState extends State<OwnProfile>
    with SingleTickerProviderStateMixin {
  List<profilePerson> profilePersonList = <profilePerson>[];
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profilePersonList.add(profilePerson(person, "Ria"));
    profilePersonList.add(profilePerson(person, "Leone"));
    profilePersonList.add(profilePerson(person, "Timo"));
    profilePersonList.add(profilePerson(person, "Claire"));
    profilePersonList.add(profilePerson(person, "Demi"));
    profilePersonList.add(profilePerson(person, "Guin"));
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 715),
      builder: () => Scaffold(
        backgroundColor: white_ffffff,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BackLayoutProfile(),
                    SvgPicture.asset(
                      circleProfile,
                      width: 48.w,
                      height: 48.h,
                      fit: BoxFit.cover,
                    ),
                    SvgPicture.asset(
                      addButton,
                      width: 20.w,
                      height: 20.h,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  // Let’s get started
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(fade_Ogunro,
                                  style: TextStyle(
                                      color: black_121212,
                                      fontFamily: helvetica_neu_bold,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 24.0.sp),
                                  textAlign: TextAlign.left),
                              SizedBox(width: 4.w),
                              SvgPicture.asset(
                                rightImage,
                                width: 14.w,
                                height: 14.h,
                              )
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: SvgPicture.asset(instaImage,
                                  color: grey_aaaaaa,
                                  width: 20.w,
                                  height: 20.h),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: SvgPicture.asset(twitterImage,
                                  width: 20.w, height: 20.h),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: SvgPicture.asset(linkedinImage,
                                  width: 20.w, height: 20.h),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 12.h,
                  ),
                  // Tell us a little bit about yourself to create your account.
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(ceo_Name,
                        style: TextStyle(
                            color: grey_aaaaaa,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0.sp,
                            height: 1.2),
                        textAlign: TextAlign.center),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(url,
                        style: TextStyle(
                            color: blue_aaaaaa,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0.sp,
                            height: 1.2),
                        textAlign: TextAlign.center),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          icon_info,
                          width: 15,
                          height: 15,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        setHelveticaMedium(countryName, 10, grey_aaaaaa,
                            FontWeight.w500, FontStyle.normal)
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Container(height: 2, color: const Color(0xffF4F6F6)),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(fadeAdmires,
                            style: TextStyle(
                                color: black_121212,
                                fontWeight: FontWeight.w700,
                                // fontFamily: helvetica_neu_bold,
                                fontStyle: FontStyle.normal,
                                fontSize: 14.0.sp),
                            textAlign: TextAlign.left),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              setHelveticaMedium(seeMore, 10, grey_aaaaaa,
                                  FontWeight.w500, FontStyle.normal),
                              SizedBox(width: 3.w),
                              SvgPicture.asset(
                                icon_next_arrow,
                                width: 16,
                                height: 16,
                                color: grey_aaaaaa,
                              )
                            ])
                      ],
                    ),
                  ),

                  SizedBox(height: 2.h),

                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: SizedBox(
                      height: 90.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          primary: false,
                          shrinkWrap: true,
                          itemCount: profilePersonList.length,
                          itemBuilder: (BuildContext context, int i) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    profilePersonList[i].imageName,
                                    width: 48.w,
                                    height: 48.h,
                                    color: grey_aaaaaa,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 4),
                                    child: Text(profilePersonList[i].nameTxt,
                                        style: TextStyle(
                                            color: black_121212,
                                            fontWeight: FontWeight.w600,
                                            // fontFamily: helvetica_neu_bold,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.0.sp)),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.h),
                    child: Container(height: 2, color: const Color(0xffF4F6F6)),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TabBar(
                          indicator: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              borderRadius: BorderRadius.circular(20)),
                          indicatorColor: Colors.transparent,
                          unselectedLabelColor: grey_aaaaaa,
                          labelColor: Colors.black,
                          tabs: [
                            Tab(
                              child: Text("Profile"),
                            ),
                            Tab(
                              text: "Post",
                            ),
                            Tab(
                              text: "Video",
                            ),
                            Tab(
                              text: "Events",
                            )
                          ],
                          controller: tabController,
                          //  indicatorSize: TabBarIndicatorSize.tab,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: 1300.h,
                    child: TabBarView(
                      children: [
                        profileTap(MediaQuery.of(context).size.width),
                        Text(''),
                        Text(''),
                        Text(' ')
                      ],
                      controller: tabController,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

profileTap(double width) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(aboutme,
            style: TextStyle(
                color: black_121212,
                fontFamily: helvetica_neu_bold,
                fontStyle: FontStyle.normal,
                fontSize: 16.0.sp),
            textAlign: TextAlign.left),
        SizedBox(height: 20.h),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: grey_aaaaaa),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pastJob,
                    style: TextStyle(
                        color: black_121212,
                        fontFamily: helvetica_neu_bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0.sp),
                    textAlign: TextAlign.left),
                SizedBox(height: 5.h),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      SvgPicture.asset(appleIcon, width: 32.w, height: 32.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          appleTxt,
                          softWrap: true,
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: helveticaNeueNeue_medium,
                              fontWeight: FontWeight.w500,
                              color: grey_aaaaaa,
                              fontStyle: FontStyle.normal),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      SvgPicture.asset(softiyIcon, width: 32.w, height: 32.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          spotifyTxt,
                          softWrap: true,
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: helveticaNeueNeue_medium,
                              fontWeight: FontWeight.w500,
                              color: grey_aaaaaa,
                              fontStyle: FontStyle.normal),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: grey_aaaaaa),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(educationTxt,
                    style: TextStyle(
                        color: black_121212,
                        fontFamily: helvetica_neu_bold,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0.sp),
                    textAlign: TextAlign.left),
                SizedBox(height: 5.h),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    educationTxtData,
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: helveticaNeueNeue_medium,
                        fontWeight: FontWeight.w500,
                        color: grey_aaaaaa,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: grey_aaaaaa),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  SvgPicture.asset(
                    calenderIcon,
                    width: 16.w,
                    height: 16.h,
                    color: const Color(0xff0A84FF),
                    fit: BoxFit.cover,
                  ),
                  Text(dateofBirth,
                      style: TextStyle(
                          color: black_121212,
                          fontFamily: helvetica_neu_bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0.sp),
                      textAlign: TextAlign.left),
                ]),
                SizedBox(height: 5.h),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "December 19,1994",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: helveticaNeueNeue_medium,
                        fontWeight: FontWeight.w500,
                        color: grey_aaaaaa,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: grey_aaaaaa),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  SvgPicture.asset(
                    questionIcon,
                    width: 16.w,
                    height: 16.h,
                    color: const Color(0xffFF881A),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text("WHAT HAVE YOU DONE?",
                        softWrap: true,
                        style: TextStyle(
                            color: black_121212,
                            fontFamily: helvetica_neu_bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.0.sp),
                        textAlign: TextAlign.left),
                  ),
                ]),
                SizedBox(height: 3.h),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id massa sagittis nulla dolor vitae risus libero blandit.",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: helveticaNeueNeue_medium,
                        fontWeight: FontWeight.w500,
                        color: grey_aaaaaa,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: grey_aaaaaa),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  SvgPicture.asset(
                    questionIcon,
                    width: 16.w,
                    height: 16.h,
                    color: const Color(0xffFF881A),
                    fit: BoxFit.cover,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("WHAT WILL YOU BE DOING IN THE FUTURE?",
                          softWrap: true,
                          style: TextStyle(
                              color: black_121212,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0.sp),
                          textAlign: TextAlign.left),
                    ),
                  ),
                ]),
                SizedBox(height: 3.h),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: helveticaNeueNeue_medium,
                        fontWeight: FontWeight.w500,
                        color: grey_aaaaaa,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: grey_aaaaaa),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  SvgPicture.asset(
                    questionIcon,
                    width: 16.w,
                    height: 16.h,
                    color: const Color(0xffFF881A),
                    fit: BoxFit.cover,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("WHAT HILL ARE YOU 1000% WILLING TO DIE?",
                          softWrap: true,
                          style: TextStyle(
                              color: black_121212,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0.sp),
                          textAlign: TextAlign.left),
                    ),
                  ),
                ]),
                SizedBox(height: 3.h),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Lorem ipsum dolor sit amet.",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: helveticaNeueNeue_medium,
                        fontWeight: FontWeight.w500,
                        color: grey_aaaaaa,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: grey_aaaaaa),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  SvgPicture.asset(
                    questionIcon,
                    width: 16.w,
                    height: 16.h,
                    color: const Color(0xffFF881A),
                    fit: BoxFit.cover,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("COME TO ME FOR - WHAT ARE YOU GOOD AT?",
                          softWrap: true,
                          style: TextStyle(
                              color: black_121212,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0.sp),
                          textAlign: TextAlign.left),
                    ),
                  ),
                ]),
                SizedBox(height: 5.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Text(
                            "UI/UX Design",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: helveticaNeueNeue_medium,
                                fontWeight: FontWeight.w500,
                                color: grey_aaaaaa,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Text(
                            "UI/UX Design",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: helveticaNeueNeue_medium,
                                fontWeight: FontWeight.w500,
                                color: grey_aaaaaa,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Text(
                            "Growth Strategy",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: helveticaNeueNeue_medium,
                                fontWeight: FontWeight.w500,
                                color: grey_aaaaaa,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Text(
                            "Life Advice",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: helveticaNeueNeue_medium,
                                fontWeight: FontWeight.w500,
                                color: grey_aaaaaa,
                                fontStyle: FontStyle.normal),
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
        SizedBox(height: 20.h),
        Container(
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: grey_aaaaaa),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  SvgPicture.asset(
                    questionIcon,
                    width: 16.w,
                    height: 16.h,
                    color: const Color(0xffFF881A),
                    fit: BoxFit.cover,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("WHAT SHOULD THE WORLD KNOW ABOUT YOU?",
                          softWrap: true,
                          style: TextStyle(
                              color: black_121212,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0.sp),
                          textAlign: TextAlign.left),
                    ),
                  ),
                ]),
                SizedBox(height: 3.h),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id massa sagittis nulla dolor vitae risus libero blandit.",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: helveticaNeueNeue_medium,
                        fontWeight: FontWeight.w500,
                        color: grey_aaaaaa,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Container(
          width: width,
          decoration: BoxDecoration(
              border: Border.all(color: grey_aaaaaa),
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  SvgPicture.asset(
                    questionIcon,
                    width: 16.w,
                    height: 16.h,
                    color: const Color(0xffFF881A),
                    fit: BoxFit.cover,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("WHAT ARE YOU WORKING ON RIGHT NOW ?",
                          softWrap: true,
                          style: TextStyle(
                              color: black_121212,
                              fontFamily: helvetica_neu_bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.0.sp),
                          textAlign: TextAlign.left),
                    ),
                  ),
                ]),
                SizedBox(height: 3.h),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id massa sagittis nulla dolor vitae risus libero blandit.",
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: helveticaNeueNeue_medium,
                        fontWeight: FontWeight.w500,
                        color: grey_aaaaaa,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    ),
  );
}

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)), //this right here
            child: Container(
              height: 290,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      img_varification,
                      width: 120,
                      height: 97,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    // We Sent You An Email
                    Text(str_we_have,
                        style: TextStyle(
                            color: black_121212,
                            fontFamily: helvetica_neu_bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0),
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 12,
                    ),
                    // Tap on the email link to activate your account.
                    Text(str_tap_on,
                        style: TextStyle(
                            color: grey_aaaaaa,
                            fontFamily: helveticaNeueNeue_medium,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.0,
                            height: 1.5),
                        textAlign: TextAlign.center)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
