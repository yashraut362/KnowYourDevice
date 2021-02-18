import 'dart:async';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:get/get.dart';
import 'package:battery/battery.dart';
import 'GlassContainer.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Battery _battery = Battery();
  BatteryState _batteryState;
  StreamSubscription<BatteryState> _batteryStateSubscription;

  String bootloader = "";
  String androidId = "";
  String brand = "";
  String board = "";
  String device = "";
  String display = "";
  String fingerprint = "";
  String hardware = "";
  String manufacturer = "";
  String model = "";
  String host = "";
  String product = "";
  String id = "";
  String version = "";
  String baseos = "";
  int sdkintval = 0;
  int previewsdkintval = 0;
  String codename = "";
  String release = "";
  String securitypatch = "";
  int batlevl = 0;

  @override
  void initState() {
    super.initState();
    _batteryStateSubscription =
        _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        _batteryState = state;
      });
    });
    getdeviceinfo();
  }

  void getdeviceinfo() async {
    AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    final int batteryLevel = await _battery.batteryLevel;
    setState(() {
      batlevl = batteryLevel;
      bootloader = androidInfo.bootloader;
      brand = androidInfo.brand;
      androidId = androidInfo.androidId;
      board = androidInfo.board;
      device = androidInfo.device;
      display = androidInfo.display;
      fingerprint = androidInfo.fingerprint;
      hardware = androidInfo.hardware;
      manufacturer = androidInfo.manufacturer;
      model = androidInfo.model;
      host = androidInfo.host;
      product = androidInfo.product;
      id = androidInfo.id;
      baseos = androidInfo.version.baseOS;
      sdkintval = androidInfo.version.sdkInt;
      previewsdkintval = androidInfo.version.previewSdkInt;
      codename = androidInfo.version.codename;
      release = androidInfo.version.release;
      securitypatch = androidInfo.version.securityPatch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/1.jpeg'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GlassContainer(
                    glassheight: Get.height * 0.17,
                    glasswidth: Get.width * 0.45,
                    glassborder: 25,
                    glasswidget: Text('$_batteryState'),
                  ),
                  GlassContainer(
                    glassheight: Get.height * 0.17,
                    glasswidth: Get.width * 0.45,
                    glassborder: 25,
                    glasswidget: Text('$batlevl'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GlassContainer(
                    glassheight: Get.height * 0.17,
                    glasswidth: Get.width * 0.45,
                    glassborder: 25,
                    glasswidget: Text('Yash'),
                  ),
                  GlassContainer(
                    glassheight: Get.height * 0.17,
                    glasswidth: Get.width * 0.45,
                    glassborder: 25,
                    glasswidget: Text('Yash'),
                  ),
                ],
              ),
              GlassContainer(
                glassheight: Get.height * 0.20,
                glasswidth: Get.width * 0.95,
                glassborder: 25,
                glasswidget: Text('Yash'),
              ),
              GlassContainer(
                glassheight: Get.height * 0.20,
                glasswidth: Get.width * 0.95,
                glassborder: 25,
                glasswidget: Text('Yash'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
