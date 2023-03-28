import 'package:flutter/material.dart';
import 'package:newspaper_app/ui/ViewModelBase.dart';
import 'package:newspaper_app/ui/newspaper/NewspaperPage.dart';
import 'package:newspaper_app/utils/constants/DurationConstants.dart';
import 'package:newspaper_app/utils/navigation/CustomNavigator.dart';

class SplashPageViewModel extends ViewModelBase {
  SplashPageViewModel() {
    initPage();
  }

  initPage() async {
    try {
      await Future.delayed(DurationConstants.normalDuration);
      await isStart();
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  isStart() async {
    CustomNavigator().pushAndRemoveUntil(HomePage());
  }
}
