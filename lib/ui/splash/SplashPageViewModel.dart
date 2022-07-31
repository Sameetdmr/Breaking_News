import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/ui/ViewModelBase.dart';
import 'package:newspaper_app/ui/newspaper/NewspaperPage.dart';

class SplashPageViewModel extends ViewModelBase {
  SplashPageViewModel() {
    initPage();
  }

  initPage() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      await isStart();
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  isStart() async {
    Get.offAll(HomePage());
  }
}
