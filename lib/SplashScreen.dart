import 'dart:async';

import 'package:KnowYourDevice/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Get.off(
              Homescreen(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/1.jpeg'), fit: BoxFit.cover),
          ),
          // child: Image(
          //   image: AssetImage('assets/images/splash.gif'),
          // ),
        ),
      ),
    );
  }
}
