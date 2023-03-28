import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newspaper_app/utils/constants/App_Constants.dart';
import 'package:newspaper_app/utils/initialize/application_start.dart';
import 'ui/splash/SplashPage.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey();

void main() async {
  await ApplicationStart.init();
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
          title: App_Constants.appName,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          home: SplashPage(),
          navigatorKey: mainNavigatorKey,
        );
      },
    );
  }
}
