import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/Feed/Feed.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/AdmireProfile.dart';
import 'package:blackchecktech/Screens/Home/chat_module/friend_list.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Utils/preference_utils.dart';
import '../../Utils/share_predata.dart';

class BottomNavigation extends StatefulWidget {
  int? selectedIndex = 0;
  BottomNavigation({
    this.selectedIndex,
  });
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  SignupModel? myModel;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex!;
    init();
  }

  init() async {
    var preferences = MySharedPref();
    myModel = await preferences.getSignupModel(SharePreData.keySignupModel);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Theme(
          //     data: Theme.of(context).copyWith(
          //       canvasColor: const Color.fromARGB(255, 27, 25, 35),
          //     ), //
          //     child: Padding(
          //       padding: EdgeInsets.only(left: 17.0.w, right: 17.0.w, bottom: 20.0.h),
          //       child: Container(
          //         height: 70,
          //         decoration: BoxDecoration(
          //           borderRadius: const BorderRadius.all(
          //             Radius.circular(40),
          //           ),
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.grey.withOpacity(0.1),
          //               spreadRadius: 5,
          //               blurRadius: 2,
          //               offset: const Offset(1, 5), // changes position of shadow
          //             ),
          //           ],
          //         ),
          //         child: ClipRRect(
          //           borderRadius: const BorderRadius.all(
          //             Radius.circular(40),
          //           ),
          //           child: BottomNavigationBar(
          //             //selectedItemColor: Colors.red,
          //             //selectedIconTheme: IconThemeData(color: Colors.red),
          //             type: BottomNavigationBarType.fixed,
          //             showSelectedLabels: false,
          //             showUnselectedLabels: false,
          //             selectedLabelStyle: TextStyle(fontSize: 0),
          //             unselectedLabelStyle: TextStyle(fontSize: 0),
          //             backgroundColor: const Color.fromARGB(255, 27, 25, 35),
          //             onTap: onTabTapped,
          //             currentIndex: _currentIndex,
          //             items: [
          //               BottomNavigationBarItem(
          //                   activeIcon: SvgPicture.asset(home_icon, color: white,),
          //                   icon : SvgPicture.asset(home_icon, color: Colors.grey[600],),
          //                   label: 'Home'),
          //               BottomNavigationBarItem(
          //                   activeIcon: SvgPicture.asset(feed_icon, color: white,),
          //                   icon : SvgPicture.asset(feed_icon, color: Colors.grey[600],),
          //                   label: ''),
          //               BottomNavigationBarItem(
          //                   activeIcon: SvgPicture.asset(chat_icon, color: white, height: 28, width: 28,),
          //                   icon : SvgPicture.asset(chat_icon, color: Colors.grey[600], height: 28, width: 28,),
          //                   label: ''),
          //               BottomNavigationBarItem(
          //                   icon: Container(
          //                     height: 24.h,
          //                     width: 23.w,
          //                     decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.all(Radius.circular(12.r)),
          //                       border: Border.all(color: gray_b3ffffff, width: 2),
          //                     ),
          //                     child: CircularProfileAvatar(
          //                       '',
          //                       radius: 10,
          //                       borderColor: Colors.transparent,
          //                       child: myModel?.data?.image == null
          //                           ? SvgPicture.asset(
          //                         placeholder,
          //                         height: 20.h,
          //                         width: 20.w,
          //                         fit: BoxFit.cover,
          //                       )
          //                           : CachedNetworkImage(
          //                         imageUrl: myModel!.data!.image!,
          //                         height: 20.h,
          //                         width: 20.w,
          //                         fit: BoxFit.cover,
          //                         progressIndicatorBuilder: (context,
          //                             url, downloadProgress) =>
          //                             SvgPicture.asset(
          //                               placeholder,
          //                               height: 20.h,
          //                               width: 20.w,
          //                               fit: BoxFit.cover,
          //                             ),
          //                         errorWidget:
          //                             (context, url, error) =>
          //                             SvgPicture.asset(
          //                               placeholder,
          //                               height: 20.h,
          //                               width: 20.w,
          //                               fit: BoxFit.cover,
          //                             ),
          //                       ),
          //                     ),
          //                    ),
          //                   label: ''
          //                 ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),

          buildMyNavBar(context)
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        Get.to(HomePage());
      } else if (index == 1) {
        _currentIndex = 0;
        Get.to(Feed())!.then((value) {
          _currentIndex = 0;
          Get.offAll(HomePage());
        });
      } else if (index == 2) {
        _currentIndex = 0;
        Get.to(FriendListScreen())!.then((value) {
          _currentIndex = 0;
          Get.offAll(HomePage());
        });
      } else if (index == 3) {
        Get.to(AdmireProfile())!.then((value) {
          _currentIndex = 0;
          Get.offAll(HomePage());
        });
      }
    });
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 70.h,
      margin: EdgeInsets.only(left: 17.0.w, right: 17.0.w, bottom: 20.0.h),
      decoration: BoxDecoration(
        color: black_121212,
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              onTabTapped(0);
            },
            icon: _currentIndex == 0
                ? SvgPicture.asset(
                    home_icon,
                    color: white,
                  )
                : SvgPicture.asset(
                    home_icon,
                    color: Colors.grey[600],
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              onTabTapped(1);
            },
            icon: _currentIndex == 1
                ? SvgPicture.asset(
                    feed_icon,
                    color: white,
                  )
                : SvgPicture.asset(
                    feed_icon,
                    color: Color(0xffB7B9BD),
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              onTabTapped(2);
            },
            icon: _currentIndex == 2
                ? SvgPicture.asset(
                    chat_icon,
                    color: white,
                    height: 28,
                    width: 28,
                  )
                : SvgPicture.asset(
                    chat_icon,
                    color: Color(0xffB7B9BD),
                    height: 28,
                    width: 28,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              onTabTapped(3);
            },
            icon: Container(
              height: 24.h,
              width: 23.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                border: Border.all(color: Color(0xffB7B9BD), width: 2),
              ),
              child: CircularProfileAvatar(
                '',
                radius: 10,
                borderColor: Colors.transparent,
                child: myModel?.data?.image == null
                    ? SvgPicture.asset(
                  placeholder,
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.cover,
                )
                    : CachedNetworkImage(
                  imageUrl: myModel!.data!.image!,
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context,
                      url, downloadProgress) =>
                      SvgPicture.asset(
                        placeholder,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.cover,
                      ),
                  errorWidget:
                      (context, url, error) =>
                      SvgPicture.asset(
                        placeholder,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.cover,
                      ),
                ),

              ),
            ),

            // const Icon(
            //   Icons.person,
            //   color: Colors.white,
            //   size: 28,
            // )
            //     : const Icon(
            //   Icons.person_outline,
            //   color: Colors.grey,
            //   size: 28,
            // ),
          ),
        ],
      ),
    );
  }
}
