import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newspaper_app/interfaces/rest/newspaper/INewspaperRestService.dart';
import 'package:newspaper_app/models/domain/newspaper/Article.dart';
import 'package:newspaper_app/models/domain/newspaper/Category.dart';
import 'package:newspaper_app/models/presentation/NewspaperPM.dart';
import 'package:newspaper_app/models/rest/request/newspaper/NewspaperRequest.dart';
import 'package:newspaper_app/ui/ViewModelBase.dart';
import 'package:newspaper_app/utils/servicelocator/ServiceLocator.dart';

class HomePageViewModel extends ViewModelBase {
  RxInt categoryIndex = 0.obs;
  List<Category> categoryList = <Category>[];
  RxBool isLoading = false.obs;
  late Rx<NewspaperPM> newspaperPM = NewspaperPM().obs;
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

  getCategoryHaberler(int index) async {
    try {
      NewspaperRequest newspaperRequest = new NewspaperRequest();
      newspaperRequest.country = 'tr';

      final newspaperResponse = await _inewspaperRestService.getCategoryNews(newspaperRequest, index);

      if (newspaperResponse!.article!.isNotEmpty) {
        fillNewspaperPM(newspaperResponse.article);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getHaberler() async {
    try {
      NewspaperRequest newspaperRequest = new NewspaperRequest();
      newspaperRequest.country = 'tr';

      final newspaperResponse = await _inewspaperRestService.getNews(newspaperRequest);

      if (newspaperResponse!.article!.isNotEmpty) {
        fillNewspaperPM(newspaperResponse.article);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  fetchIndexNews(int index) {
    clearNewspaperPM();
    if (index == 0) {
      getHaberler();
    } else {
      getCategoryHaberler(index);
    }
  }

  fillNewspaperPM(List<Article>? article) {
    if (article != null) {
      for (var i = 0; i < article.length; i++) {
        newspaperPM.value.titleList!.add(article[i].title.toString());
        newspaperPM.value.nameList!.add(article[i].source!.name.toString());
        newspaperPM.value.imageList!.add(article[i].urlToImage.toString());
        newspaperPM.value.urlList!.add(article[i].url.toString());

        newspaperPM.value.publishedList!.add(DateFormat('yyyy-MM-dd').format(DateTime.parse(article[i].publishedAt.toString())));
      }
      isLoading.value = true;
    }
  }

  clearNewspaperPM() {
    newspaperPM.value.titleList!.clear();
    newspaperPM.value.nameList!.clear();
    newspaperPM.value.imageList!.clear();
    newspaperPM.value.urlList!.clear();
    newspaperPM.value.publishedList!.clear();
    isLoading.value = false;
  }
}
