import 'package:flutter/material.dart';

@immutable
final class CustomPadding {
  static CustomPadding? _instance;

  static CustomPadding get instance {
    return _instance ??= CustomPadding._init();
  }

  CustomPadding._init();
  final Radius topContainerLeftRadiusCircular = Radius.circular(20);
}
