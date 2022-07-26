import 'package:newspaper_app/interfaces/rest/newspaper/INewspaperRestService.dart';
import 'package:newspaper_app/models/domain/newspaper/CategoryEnum.dart';
import 'package:newspaper_app/models/rest/response/newspaper/NewspaperResponse.dart';
import 'package:newspaper_app/models/rest/request/newspaper/NewspaperRequest.dart';
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
  getCategoryNews(NewspaperRequest newspaperRequest, int index) async {
    String country = newspaperRequest.country!;
    String apiKey = _apiKey!;
    NewspaperResponse newspaperResponse = NewspaperResponse.fromJson(await RestServiceManager.call(_apiUrl!, "/top-headlines?country=$country&apiKey=$apiKey&category=${CategoryEnum.values[index - 1].name}", null, RequestType.GET));
    return newspaperResponse;
  }

  @override
  getNews(NewspaperRequest newspaperRequest) async {
    String country = newspaperRequest.country!;
    String apiKey = _apiKey!;
    NewspaperResponse newspaperResponse = NewspaperResponse.fromJson(await RestServiceManager.call(_apiUrl!, "/top-headlines?country=$country&apiKey=$apiKey", null, RequestType.GET));
    return newspaperResponse;
  }
}
