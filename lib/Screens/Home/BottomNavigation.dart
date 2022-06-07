import 'package:blackchecktech/Screens/Authentication/login/model/SignupModel.dart';
import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Screens/Home/Profile/view/AdmireProfile.dart';
import 'package:blackchecktech/Screens/Home/chat_module/friend_list.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex!;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Theme(
              data: Theme.of(context).copyWith(
                canvasColor: const Color.fromARGB(255, 27, 25, 35),
              ), //
              child: Padding(
                padding: const EdgeInsets.only(left: 17.0, right: 17.0, bottom: 30),
                child: Container(
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 2,
                        offset: const Offset(1, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                    child: BottomNavigationBar(
                      //selectedItemColor: Colors.red,
                      //selectedIconTheme: IconThemeData(color: Colors.red),
                      type: BottomNavigationBarType.fixed,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      backgroundColor: const Color.fromARGB(255, 27, 25, 35),
                      onTap: onTabTapped,
                      currentIndex: _currentIndex,
                      items: [
                        BottomNavigationBarItem(
                            activeIcon: const Icon(Icons.home_outlined, color: Colors.white),
                            icon : Icon(
                                    Icons.home_outlined,
                                    color: Colors.grey[600],
                                  ),
                            label: ''),
                        BottomNavigationBarItem(
                            activeIcon: const Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                  ),
                            icon   : Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey[600],
                                  ),
                            label: ''),
                        BottomNavigationBarItem(
                            icon: _currentIndex == 2
                                ? const Icon(Icons.dashboard, color: Colors.white)
                                : Icon(Icons.dashboard, color: Colors.grey[600]),
                            label: ''),
                        BottomNavigationBarItem(
                            activeIcon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                             icon   : Icon(Icons.person, color: Colors.grey[600]),
                            label: ''),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if(index == 0){
        Get.to(HomePage());
      }else if(index == 1){
        Get.to(FriendListScreen());
      }else if(index == 3){
        widget.selectedIndex = 3;
        Get.to(AdmireProfile());
      }
    });
  }
}
