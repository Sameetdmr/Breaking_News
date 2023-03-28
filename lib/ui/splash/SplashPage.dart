// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/ui/newspaper/components/CustomLottie.dart';
import 'package:newspaper_app/ui/splash/SplashPageViewModel.dart';
import 'package:newspaper_app/utils/constants/App_Constants.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashPageViewModel splashPageViewModel = Get.put(SplashPageViewModel());
    return Scaffold(
      body: Center(child: CustomLottie(lottieUrl: App_Constants.LOTTIE_PATH_SPLASH_LOADING)),
    );
  }
}
