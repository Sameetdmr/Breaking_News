import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottie extends StatelessWidget {
  const CustomLottie({Key? key, required this.lottieUrl}) : super(key: key);
  final String lottieUrl;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      lottieUrl,
      repeat: false,
    );
  }
}
