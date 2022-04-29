import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/Styles/my_colors.dart';
import 'package:blackchecktech/Styles/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white_ffffff,
      body: _children[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color.fromARGB(255, 27, 25, 35),
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
                      offset: Offset(1, 5), // changes position of shadow
                    ),
                  ],),
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
                backgroundColor: Color.fromARGB(255, 27, 25, 35),
                onTap: onTabTapped,
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: _currentIndex == 0
                          ? const Icon(Icons.home_outlined, color: Colors.white)
                          : Icon(
                              Icons.home_outlined,
                              color: Colors.grey[600],
                            ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: _currentIndex == 1
                          ? const Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            )
                          : Icon(
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
                      icon: _currentIndex == 3
                          ? const Icon(
                              Icons.person,
                              color: Colors.white,
                            )
                          : Icon(Icons.person, color: Colors.grey[600]),
                      label: ''),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
