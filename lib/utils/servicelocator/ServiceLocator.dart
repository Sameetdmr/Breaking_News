import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_app/rest/newspaper/NewspaperRestService.dart';

import 'package:newspaper_app/services/common/ExceptionHandlingService.dart';

@immutable
final class ServiceLocator {
  static final ServiceLocator _singleton = ServiceLocator._internal();

  ServiceLocator._internal();

  factory ServiceLocator() {
    return _singleton;
  }

  T get<T>() {
    return Get.find<T>();
  }

  void init() {
    Get.lazyPut<IExceptionHandlingService>(() => ExceptionHandlingService(), fenix: true);
    Get.lazyPut<INewspaperRestService>(() => NewspaperRestService(), fenix: true);
  }
}
