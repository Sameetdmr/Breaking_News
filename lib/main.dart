import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newspaper_app/utils/constants/App_Constants.dart';
import 'firebase_options.dart';
import 'ui/splash/SplashPage.dart';
import 'utils/servicelocator/ServiceLocator.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = (FlutterErrorDetails details) async {
    try {
      FirebaseCrashlytics.instance.setCustomKey('Error', details.exception.toString());
      FirebaseCrashlytics.instance.setCustomKey('Details', details.toString());
      FirebaseCrashlytics.instance.setCustomKey('StackTrace', StackTrace.current.toString());
      FirebaseCrashlytics.instance.crash();
    } catch (ex) {
      FirebaseCrashlytics.instance.log(details.exception.toString() + ' / ' + details.toString() + " - " + StackTrace.current.toString());
      FirebaseCrashlytics.instance.crash();
    }
  };

  ServiceLocator().init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.black));
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
