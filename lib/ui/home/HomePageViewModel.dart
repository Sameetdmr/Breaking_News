import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newspaper_app/interfaces/rest/newspaper/INewspaperRestService.dart';
import 'package:newspaper_app/models/domain/newspaper/Category.dart';
import 'package:newspaper_app/models/rest/request/newspaper/NewspaperRequest.dart';
import 'package:newspaper_app/ui/ViewModelBase.dart';
import 'package:newspaper_app/utils/popups/CustomDialog.dart';
import 'package:newspaper_app/utils/servicelocator/ServiceLocator.dart';

class HomePageViewModel extends ViewModelBase {
  RxInt categoryIndex = 0.obs;
  List<Category> categoryList = <Category>[];
  INewspaperRestService _inewspaperRestService = ServiceLocator().get<INewspaperRestService>();

  HomePageViewModel() {
    initPage();
  }
  initPage() {
    getCategory();
    getHaberler();
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

  getHaberler() async {
    try {
      NewspaperRequest newspaperRequest = new NewspaperRequest();
      newspaperRequest.country = 'tr';

      CustomDialog.showLoadingDialog();
      final newspaperResponse = await _inewspaperRestService.getNews(newspaperRequest, 4);
      CustomDialog.dismiss();
    } catch (e) {
      print(e.toString());
    }
  }
}
