import 'dart:convert';
import 'dart:io';
import 'package:anc_bus_service/utils/app_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class CommonNetwork extends GetxController {
  var verifyUrl;
  AppUtils utils = AppUtils();
  String apiUrl = "";

  getApi(context, url) async {
    Dio dio = Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    try {
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer " + token;
      var response = await dio.get(utils.baseUrl + url);
      return response;
    } catch (e) {
      print(e);
    }
  }

  getAuthApi(context, url, jsonObj) async {
    String credentials = '';
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String encoded = stringToBase64.encode(credentials);

    Dio dio = new Dio();

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      dio.options.headers['Accept'] = 'application/json';
      // dio.options.headers["Authorization"] = "Basic " + encoded;
      print(utils.baseUrl + url);
      var response = await dio.post(utils.baseUrl + url, data: jsonObj);
      return response;
    } catch (e) {
      print(e);
    }
  }

  postApi(context, url, jsonObj) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    Dio dio = new Dio();

    try {
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer " + token;
      var response = await dio.post(utils.baseUrl + url, data: jsonObj);
      return response;
    } catch (e) {
      print(e);
    }
  }

  putApi(context, url, jsonObj) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    Dio dio = new Dio();

    try {
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["Authorization"] = "Bearer " + token;
      var response = await dio.put(utils.baseUrl + url, data: jsonObj);
      return response;
    } catch (e) {
      print(e);
    }
  }

  // check() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     return true;
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     return true;
  //   } else if (connectivityResult == ConnectivityResult.none) {
  //     return false;
  //   }
  // }

  isConnected(context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
  }
}
