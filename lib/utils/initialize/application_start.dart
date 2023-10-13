import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kartal/kartal.dart';

import '../../firebase_options.dart';
import '../servicelocator/ServiceLocator.dart';

@immutable
final class ApplicationStart {
  const ApplicationStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await DeviceUtility.instance.initPackageInfo();
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.black));
    ServiceLocator().init();
  }
}
