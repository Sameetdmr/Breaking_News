import 'package:intl/intl.dart';
import 'package:newspaper_app/ui/ViewModelBase.dart';

class HomePageViewModel extends ViewModelBase {
  HomePageViewModel() {
    initPage();
  }
  initPage() {}

  String getDateTime() {
    var tarih = DateFormat("dd-MM-yyyy").format(DateTime.now());
    return '$tarih';
  }
}
