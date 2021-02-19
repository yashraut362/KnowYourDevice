import 'package:KnowYourDevice/homescreen.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSplash(
        imagePath: 'assets/images/splashicon.png',
        backGroundColor: Colors.black,
        // backGroundColor: Color(0xfffc6042),
        animationEffect: 'zoom-in',
        logoSize: 400,
        home: Homescreen(),
        duration: 2500,
        type: CustomSplashType.StaticDuration,
      ),
    );
  }
}
