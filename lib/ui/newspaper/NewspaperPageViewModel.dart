import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newspaper_app/interfaces/rest/newspaper/INewspaperRestService.dart';
import 'package:newspaper_app/models/domain/newspaper/Article.dart';
import 'package:newspaper_app/models/domain/newspaper/Category.dart';
import 'package:newspaper_app/models/presentation/NewspaperPM.dart';
import 'package:newspaper_app/models/rest/request/newspaper/NewspaperRequest.dart';
import 'package:newspaper_app/ui/ViewModelBase.dart';
import 'package:newspaper_app/utils/constants/App_Constants.dart';
import 'package:newspaper_app/utils/servicelocator/ServiceLocator.dart';

class NewspaperPageViewModel extends ViewModelBase {
  RxInt categoryIndex = 0.obs;
  List<Category> categoryList = <Category>[];
  String? countryCode = 'tr';
  String? countryName = 'Türkiye';

  RxBool isLoading = false.obs;
  late Rx<NewspaperPM> newspaperPM = NewspaperPM().obs;
  INewspaperRestService _inewspaperRestService = ServiceLocator().get<INewspaperRestService>();

  NewspaperPageViewModel() {
    initPage();
  }
  initPage() {
    try {
      getCategory();
      getHaberler();
    } catch (e) {
      throw Exception(e);
    }
  }

  getCategory() {
    categoryList.clear();
    categoryList.addAll({
      Category(App_Constants.ALLNEWS_LOTTIE_PATH, App_Constants.CATEGORY_ALLNEWS),
      Category(App_Constants.BUSINESS_LOTTIE_PATH, App_Constants.CATEGORY_BUSINESS),
      Category(App_Constants.ENTERTAINMENT_LOTTIE_PATH, App_Constants.CATEGORY_ENTERTAINMENT),
      Category(App_Constants.HEALTH_LOTTIE_PATH, App_Constants.CATEGORY_HEALTH),
      Category(App_Constants.SCIENCE_LOTTIE_PATH, App_Constants.CATEGORY_SCIENCE),
      Category(App_Constants.SPORT_LOTTIE_PATH, App_Constants.CATEGORY_SPORT),
      Category(App_Constants.TECHNOLOGY_LOTTIE_PATH, App_Constants.CATEGORY_TECHNOLOGY),
    });
  }

  getCategoryHaberler(int index) async {
    try {
      NewspaperRequest newspaperRequest = new NewspaperRequest();
      newspaperRequest.country = countryCode!;

      final newspaperResponse = await _inewspaperRestService.getCategoryNews(newspaperRequest, index);

      if (newspaperResponse!.article!.isNotEmpty) {
        fillNewspaperPM(newspaperResponse.article);
      }
    } catch (e) {
      throw e;
    }
  }

  getHaberler() async {
    try {
      NewspaperRequest newspaperRequest = new NewspaperRequest();
      newspaperRequest.country = countryCode!;

      final newspaperResponse = await _inewspaperRestService.getNews(newspaperRequest);

      if (newspaperResponse!.article!.isNotEmpty) {
        fillNewspaperPM(newspaperResponse.article);
      }
    } catch (e) {
      throw e;
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

  fetchCountryNews() {
    clearNewspaperPM();
    getHaberler();
    refresh();
  }

  fillNewspaperPM(List<Article>? article) {
    if (article != null) {
      for (var i = 0; i < article.length; i++) {
        newspaperPM.value.titleList!.add(article[i].title.toString());
        newspaperPM.value.nameList!.add(article[i].source!.name.toString());
        newspaperPM.value.imageList!.add(article[i].urlToImage.toString());
        newspaperPM.value.urlList!.add(article[i].url.toString());

        newspaperPM.value.publishedList!.add(DateFormat('dd-MM-yyyy').format(DateTime.parse(article[i].publishedAt.toString())));
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
