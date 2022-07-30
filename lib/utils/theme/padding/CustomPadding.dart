import 'package:flutter/material.dart';

class CustomPadding {
  static CustomPadding? _instance;

  static CustomPadding get instance {
    return _instance ??= CustomPadding._init();
  }

  CustomPadding._init();

  final EdgeInsets subtitleTopPadding = EdgeInsets.only(top: 20);
  final EdgeInsets topContainerPadding = EdgeInsets.all(10);
  final EdgeInsets topContainerTitleTopPadding = EdgeInsets.only(top: 5);
  final Radius topContainerLeftRadiusCircular = Radius.circular(20);
}
