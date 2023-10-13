import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

abstract class IExceptionHandlingService {
  Future<void> handleException(Object exception);
}

class ExceptionHandlingService implements IExceptionHandlingService {
  @override
  Future<void> handleException(Object exception) async {
    await FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(
      exception: exception,
      stack: StackTrace.current,
    ));
  }
}
