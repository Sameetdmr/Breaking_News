import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/splash/SplashPage.dart';
import 'utils/servicelocator/ServiceLocator.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocator().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          home: SplashPage(),
        );
      },
    );
  }
}
