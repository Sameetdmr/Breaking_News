import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newspaper_app/models/domain/Category.dart';
import 'package:newspaper_app/ui/ViewModelBase.dart';

class HomePageViewModel extends ViewModelBase {
  RxInt categoryIndex = 0.obs;
  List<Category> categoryList = <Category>[];

  HomePageViewModel() {
    initPage();
  }
  initPage() {
    getCategory();
  }

  String getDateTime() {
    var tarih = DateFormat("dd-MM-yyyy").format(DateTime.now());
    return '$tarih';
  }

  getCategory() {
    categoryList.addAll({
      Category('', 'Hepsi'),
      Category('assets/images/img_is.jpg', 'İş'),
      Category('assets/images/img_eglence.jpg', 'Eğlence'),
      Category('assets/images/img_saglik.png', 'Sağlık'),
      Category('assets/images/img_bilim.png', 'Bilim'),
      Category('assets/images/img_spor.jpg', 'Spor'),
      Category('assets/images/img_teknoloji.png', 'Teknoloji'),
    });
  }
}
