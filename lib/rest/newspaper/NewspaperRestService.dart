import 'package:newspaper_app/models/domain/newspaper/CategoryEnum.dart';
import 'package:newspaper_app/models/rest/response/newspaper/NewspaperResponse.dart';
import 'package:newspaper_app/rest/RequestType.dart';
import 'package:newspaper_app/rest/RestServiceManager.dart';

abstract class INewspaperRestService {
  Future<NewspaperResponse?> getCategoryNews(int index);
  Future<NewspaperResponse?> getNews();
}

class NewspaperRestService implements INewspaperRestService {
  String? _apiUrl;
  String? _apiKey;

  NewspaperRestService() {
    _apiUrl = 'https://newsapi.org/v2';
    _apiKey = 'f951dd5671e341789141c38a9925a639';
  }

  @override
  Future<NewspaperResponse?> getCategoryNews(int index) async {
    NewspaperResponse newspaperResponse = NewspaperResponse.fromJson(await RestServiceManager.call(_apiUrl!, "/top-headlines?country=tr&apiKey=$_apiKey&category=${CategoryEnum.values[index - 1].name}", null, RequestType.GET));
    return newspaperResponse;
  }

  @override
  Future<NewspaperResponse?> getNews() async {
    NewspaperResponse newspaperResponse = NewspaperResponse.fromJson(await RestServiceManager.call(_apiUrl!, "/top-headlines?country=tr&apiKey=$_apiKey", null, RequestType.GET));
    return newspaperResponse;
  }
}
