import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomDialog {
  static showLoadingDialog({bool isOpaqueBackground = false}) async {
    await Future.delayed(Duration(milliseconds: 50));
    Get.dialog(Container(child: Center(child: CupertinoActivityIndicator()), color: (isOpaqueBackground != false) ? Colors.white : Colors.transparent));
  }

  static dismiss() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
