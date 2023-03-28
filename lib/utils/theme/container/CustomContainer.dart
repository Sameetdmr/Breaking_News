import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer {
  static CustomContainer? _instance;

  static CustomContainer get instance {
    return _instance ??= CustomContainer._init();
  }

  CustomContainer._init();

  final double categoryContainerHeight = 0.12.sh;
  final double animatedContainerHeight = 0.07.sh;
  final double animatedContainerWidth = 0.12.sw;
}
