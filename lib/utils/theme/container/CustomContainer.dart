import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer {
  static CustomContainer? _instance;

  static CustomContainer get instance {
    return _instance ??= CustomContainer._init();
  }

  CustomContainer._init();

  final double categoryContainerHeight = 0.12.sh;
  final double animatedContainerHeight = 0.08.sh;
  final double animatedContainerWidth = 0.12.sw;
  final double cacheNetworkImageHeight = 0.12.sh;
  final double cacheNetworkImageWidth = 0.20.sw;
}
