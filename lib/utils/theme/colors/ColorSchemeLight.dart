import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instance;

  static ColorSchemeLight get instance {
    return _instance ??= ColorSchemeLight._init();
  }

  ColorSchemeLight._init();

  final Color dusk80Color = const Color(0xff717d97);
  final Color dusk65Color = const Color(0xff828ca1);
  final Color dusk55Color = const Color(0xffA3B0C4);
  final Color dusk40Color = const Color(0xffb8becb);
  final Color duskColor = const Color(0xff505d7a);
  final Color whiteColor = Colors.white;
  final Color blackColor = Colors.black;
}
