import 'dart:async';
import 'package:system_info/system_info.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
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
    const int MEGABYTE = 1024 * 1024;
    Size size = MediaQuery.of(context).size;
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
                    glassheight: size.height * 0.17,
                    glasswidth: size.width * 0.45,
                    glassborder: 25,
                    glasswidget: Center(
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.device_hub,
                            size: size.width * 0.2,
                            color: Colors.white,
                          ),
                          Text(
                            'Manufacturer : $manufacturer',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Brand : $brand',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Model : $model',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Codename : $device',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GlassContainer(
                    glassheight: size.height * 0.17,
                    glasswidth: size.width * 0.45,
                    glassborder: 25,
                    glasswidget: Center(
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.android,
                            size: size.width * 0.2,
                            color: Colors.white,
                          ),
                          Text(
                            'Android version : $release',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Android sdk version : $sdkintval',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Security Patch: $securitypatch',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GlassContainer(
                    glassheight: size.height * 0.17,
                    glasswidth: size.width * 0.45,
                    glassborder: 25,
                    glasswidget: Center(
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.battery_std_rounded,
                            size: size.width * 0.2,
                            color: Colors.white,
                          ),
                          Text(
                            'Battery level: $batlevl',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '$_batteryState',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GlassContainer(
                    glassheight: size.height * 0.17,
                    glasswidth: size.width * 0.45,
                    glassborder: 25,
                    glasswidget: Center(
                      child: Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.memory_outlined,
                            size: size.width * 0.2,
                            color: Colors.white,
                          ),
                          Text(
                            'Kernel name: ${SysInfo.kernelName}',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Kernel Arch: ${SysInfo.kernelArchitecture}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GlassContainer(
                glassheight: size.height * 0.20,
                glasswidth: size.width * 0.95,
                glassborder: 25,
                glasswidget: Center(
                  child: Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.storage_rounded,
                        size: size.width * 0.2,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'Memory information',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.05),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'Total Physical Memory : ${SysInfo.getTotalPhysicalMemory() ~/ MEGABYTE} MB',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Free Physical Memory : ${SysInfo.getFreePhysicalMemory() ~/ MEGABYTE} MB',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Total Virtual Memory : ${SysInfo.getTotalVirtualMemory() ~/ MEGABYTE} MB',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Free Virtual Memory : ${SysInfo.getFreeVirtualMemory() ~/ MEGABYTE} MB',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Virtual Memory Size : ${SysInfo.getVirtualMemorySize() ~/ MEGABYTE} MB',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              GlassContainer(
                glassheight: size.height * 0.20,
                glasswidth: size.width * 0.95,
                glassborder: 25,
                glasswidget: Center(
                  child: Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.all_inclusive_rounded,
                        size: size.width * 0.2,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text(
                            'Other Information',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.05),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'Android id : $androidId',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Display: $display',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Hardware : $hardware',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Host : $host',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Device Id : $id',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
