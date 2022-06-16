import 'package:blackchecktech/Screens/Home/HomePage.dart';
import 'package:blackchecktech/SplashScreen.dart';
import 'package:blackchecktech/UIScreen/AdmireGrid.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'UIScreen/Demo.dart';


GetIt getIt = GetIt.instance;

const Color themeColor = Color(0xff00bc56);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),

          home: SplashScreen(),

          //  home: AdmireGrid(),
        );
      },
    );
  }
  //
}
