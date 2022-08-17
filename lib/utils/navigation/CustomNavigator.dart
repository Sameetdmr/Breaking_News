import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/main.dart';

class CustomNavigator {
  static final CustomNavigator _singleton = CustomNavigator._internal();
  CustomNavigator._internal();
  factory CustomNavigator() {
    return _singleton;
  }

  void pushToMain(Widget widget) {
    Get.addKey(mainNavigatorKey);
    Get.to(widget);
  }

  void popFromMain() {
    Get.addKey(mainNavigatorKey);
    Get.back();
  }

  void pushReplacementFromMain(Widget widget) {
    Get.addKey(mainNavigatorKey);
    Get.off(widget);
  }

  void pushAndRemoveUntil(Widget widget) {
    Get.addKey(mainNavigatorKey);
    Get.offAll(widget);
  }
}
