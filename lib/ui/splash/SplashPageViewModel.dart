import 'package:flutter/material.dart';
import 'package:newspaper_app/ui/ViewModelBase.dart';
import 'package:newspaper_app/ui/newspaper/NewspaperPage.dart';
import 'package:newspaper_app/utils/constants/DurationConstants.dart';
import 'package:newspaper_app/utils/navigation/CustomNavigator.dart';

class SplashPageViewModel extends ViewModelBase {
  SplashPageViewModel() {
    initPage();
  }

  Future<void> initPage() async {
    try {
      await Future<void>.delayed(DurationConstants.normalDuration);
      await isStart();
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  Future<void> isStart() async {
    CustomNavigator().pushAndRemoveUntil(HomePage());
  }
}
