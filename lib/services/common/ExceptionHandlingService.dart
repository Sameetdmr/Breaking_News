import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import '../../interfaces/common/IExceptionHandlingService.dart';

class ExceptionHandlingService implements IExceptionHandlingService {
  @override
  handleException(dynamic exception) {
    FirebaseCrashlytics.instance.recordFlutterError(FlutterErrorDetails(
      exception: exception,
      stack: StackTrace.current,
    ));
  }
}
