import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newspaper_app/utils/theme/colors/ColorSchemeLight.dart';

class CustomTextTheme {
  static CustomTextTheme? _instance;

  static CustomTextTheme get instance {
    return _instance ??= CustomTextTheme._init();
  }

  CustomTextTheme._init();

  final TextStyle boldTopTitleText = TextStyle(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
    color: ColorSchemeLight.instance.blackColor,
  );

  final TextStyle boldSubtitleText = TextStyle(
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 12.sp,
    color: ColorSchemeLight.instance.blackColor,
  );

  final TextStyle cardTitleText = TextStyle(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
    color: ColorSchemeLight.instance.blackColor,
  );

  final TextStyle cardSubtitleText = TextStyle(
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontSize: 8.sp,
    color: ColorSchemeLight.instance.blackColor,
  );

  final TextStyle boldSnackbarText = TextStyle(
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    fontSize: 14.sp,
    color: Colors.white,
  );
}
