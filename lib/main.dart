import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/splash/SplashPage.dart';
import 'utils/servicelocator/ServiceLocator.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
/*
  FlutterError.onError = (FlutterErrorDetails details) {
    FirebaseCrashlytics.instance.log(details.toString());
    FirebaseCrashlytics.instance.crash(); // fatal
  };
  */

  ServiceLocator().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: 'Breaking News',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          home: SplashPage(),
          navigatorKey: mainNavigatorKey,
        );
      },
    );
  }
}
