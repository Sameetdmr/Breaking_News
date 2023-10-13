import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:newspaper_app/services/common/ExceptionHandlingService.dart';
import 'package:newspaper_app/utils/servicelocator/ServiceLocator.dart';

class ViewModelBase extends GetxController {
  IExceptionHandlingService exceptionHandlingService = ServiceLocator().get<IExceptionHandlingService>();
}
