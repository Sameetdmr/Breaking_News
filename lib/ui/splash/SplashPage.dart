// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/ui/components/CustomLottie.dart';
import 'package:newspaper_app/ui/splash/SplashPageViewModel.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashPageViewModel splashPageViewModel = Get.put(SplashPageViewModel());
    return Scaffold(
      body: Center(
          child: CustomLottie(
        lottieUrl: 'assets/lottie/loading_animation.json',
      )),
    );
  }
}
