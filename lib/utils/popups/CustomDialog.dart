import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/utils/navigation/CustomNavigator.dart';

@immutable
final class CustomDialog {
  const CustomDialog._();

  static Future<void> showLoadingDialog({bool isOpaqueBackground = false}) async {
    await Future<void>.delayed(Duration(milliseconds: 50));
    Get.dialog<void>(Container(child: Center(child: CupertinoActivityIndicator()), color: (isOpaqueBackground != false) ? Colors.white : Colors.transparent));
  }

  static void dismiss() {
    if (Get.isDialogOpen!) {
      CustomNavigator().popFromMain();
    }
  }
}
