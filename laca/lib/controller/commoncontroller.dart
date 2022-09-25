import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonController extends GetxController {
  RxInt bottomIndex = 0.obs;
  Rx<File?>? image;
  RxBool isSelected = false.obs;
  RxString url = "".obs;
  PageController pageController = PageController(initialPage: 0);
  RxBool containText = false.obs;
  RxBool haveValue = false.obs;
  RxString gcode = "".obs;
  RxMap? response;
  late SharedPreferences preferences;

  @override
  void onInit() async {
    preferences = await SharedPreferences.getInstance();
    checkValue();
    super.onInit();
  }

  void checkValue() {
    String url = getUrl();
    if (url.isNotEmpty) {
      haveValue.value = true;
    } else {
      haveValue.value = false;
    }
  }

  void setUrl(String value) async {
    bool result = await preferences.setString("url", value);
    haveValue.value = result;
  }

  dynamic getUrl() {
    printInfo(info: preferences.getString("url").toString());
    return preferences.getString("url") ?? "";
  }
}
