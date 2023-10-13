import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:newspaper_app/utils/popups/SnackbarType.dart';
import 'package:newspaper_app/utils/theme/CustomTextTheme.dart';

@immutable
final class CustomSnackbar {
  const CustomSnackbar._();

  static void showSnackBar(BuildContext context, SnackBarType snackBarType, String text) {
    switch (snackBarType) {
      case SnackBarType.SUCCESS:
        Flushbar<void>(
          flushbarPosition: FlushbarPosition.TOP,
          messageText: Text(
            text,
            style: CustomTextTheme.instance.boldSnackbarText,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color(0xFFa3c5a1),
          duration: Duration(seconds: 3),
          isDismissible: false,
        ).show(context);
        return;
      case SnackBarType.ERROR:
        Flushbar<void>(
          flushbarPosition: FlushbarPosition.TOP,
          messageText: Text(
            text,
            style: CustomTextTheme.instance.boldSnackbarText,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Color(0xffe16e66),
          duration: Duration(seconds: 3),
          isDismissible: false,
        ).show(context);
        return;
    }
  }
}
