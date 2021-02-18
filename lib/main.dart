import 'package:KnowYourDevice/SplashScreen.dart';
import 'package:KnowYourDevice/aboutScreen.dart';
import 'package:KnowYourDevice/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: InstanceBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Homescreen(),
      getPages: [
        GetPage(name: '/home', page: () => Homescreen()),
        GetPage(name: '/splash', page: () => Splashscreen()),
        GetPage(name: '/about', page: () => AboutScreen()),
      ],
    );
  }
}
