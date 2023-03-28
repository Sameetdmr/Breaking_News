import 'package:newspaper_app/interfaces/rest/newspaper/INewspaperRestService.dart';
import 'package:newspaper_app/models/domain/newspaper/CategoryEnum.dart';
import 'package:newspaper_app/models/rest/response/newspaper/NewspaperResponse.dart';
import 'package:newspaper_app/rest/RequestType.dart';
import 'package:newspaper_app/rest/RestServiceManager.dart';

class NewspaperRestService implements INewspaperRestService {
  String? _apiUrl;
  String? _apiKey;

  NewspaperRestService() {
    _apiUrl = 'https://newsapi.org/v2';
    _apiKey = 'f951dd5671e341789141c38a9925a639';
  }

  @override
  getCategoryNews(int index) async {
    NewspaperResponse newspaperResponse = NewspaperResponse.fromJson(await RestServiceManager.call(_apiUrl!, "/top-headlines?country=tr&apiKey=$_apiKey&category=${CategoryEnum.values[index - 1].name}", null, RequestType.GET));
    return newspaperResponse;
  }

  @override
  getNews() async {
    NewspaperResponse newspaperResponse = NewspaperResponse.fromJson(await RestServiceManager.call(_apiUrl!, "/top-headlines?country=tr&apiKey=$_apiKey", null, RequestType.GET));
    return newspaperResponse;
  }
}
