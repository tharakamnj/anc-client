import 'dart:convert';

import 'package:anc_bus_service/routes/app_pages.dart';
import 'package:anc_bus_service/utils/common_network.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final firstnametextfield = TextEditingController();
  final lastnametextfield = TextEditingController();
  final usernametextfield = TextEditingController();
  final mobileNumbertextfield = TextEditingController();
  final serviceIdtextfield = TextEditingController();
  final passwordtextfield = TextEditingController();
  final repasswordtextfield = TextEditingController();
  double currentLat = 0.0;
  double currentLong = 0.0;
  String? deviceId = "";

  CommonNetwork api = CommonNetwork();


  loadDriverLocation(context) async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457
    currentLat = position.latitude;
    currentLong = position.longitude;
  }

  onRegister(context) async {
    await loadDriverLocation(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    deviceId = await PlatformDeviceId.getDeviceId;

    var req = jsonEncode(<String, String>{
      "firstName": firstnametextfield.value.text,
      "lastName": lastnametextfield.value.text,
      "username": usernametextfield.value.text,
      "password": passwordtextfield.value.text,
      "serviceId": serviceIdtextfield.value.text,
      "lat": currentLat.toString(),
      "lon": currentLong.toString(),
      "mobileNo": mobileNumbertextfield.value.text,
      "deviceId": deviceId.toString(),
      "status": "ACTIVE"
    });
    print(req);
    var response = await api.getAuthApi(context, '/clientReg', req);
    print(response);
    if (response != null) {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }

  onLogin(context) {
    Get.offAndToNamed(Routes.LOGIN);
  }
}
