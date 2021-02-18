import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'GlassContainer.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/4.jpeg'), fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: GlassContainer(
                    glassheight: Get.height * 0.5,
                    glasswidth: Get.width * 0.75,
                    glassborder: 26,
                    glasswidget: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          'Yash Raut',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Get.height * 0.05,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik'),
                        ),
                        Text(
                          'yashraut362@gmail.com',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Get.height * 0.03,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Rubik'),
                        ),
                        GlassContainer(
                          glassheight: Get.height * 0.075,
                          glasswidth: Get.width * 0.5,
                          glassborder: 26,
                          glasswidget: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('assets/icons/google.png'),
                              Text(
                                'Sign out',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.height * 0.027,
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: Get.height * 0.22,
                left: Get.width * 0.30,
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  minRadius: Get.width * 0.20,
                  child: CircleAvatar(
                    minRadius: Get.width * 0.19,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          Get.back();
        },
        child: CircleAvatar(
          minRadius: Get.width * 0.1,
          backgroundColor: Colors.white.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
