import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/main.dart';

@immutable
final class CustomNavigator {
  static final CustomNavigator _singleton = CustomNavigator._internal();
  CustomNavigator._internal();
  factory CustomNavigator() {
    return _singleton;
  }

  /// Bir sayfayı ana gezintiye ekler.
  Future<void> pushToMain(Widget widget, {bool replace = false}) async {
    Get.addKey(mainNavigatorKey);
    return Get.to(widget);
  }

  /// Ana gezintiden bir sayfayı kaldırır.
  Future<void> popFromMain() async {
    Get.addKey(mainNavigatorKey);
    return Get.back();
  }

  /// Ana gezintiden mevcut sayfayı yenisiyle değiştirir.
  Future<void> pushReplacementFromMain(Widget widget) async {
    Get.addKey(mainNavigatorKey);
    return Get.off(widget);
  }

  /// Tüm sayfaları ana gezintiden siler ve yeni bir sayfa ekler.
  Future<void> pushAndRemoveUntil(Widget widget) async {
    Get.addKey(mainNavigatorKey);
    return Get.offAll(widget);
  }
}
