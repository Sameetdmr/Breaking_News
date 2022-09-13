import 'package:newspaper_app/models/rest/request/newspaper/NewspaperRequest.dart';
import 'package:newspaper_app/models/rest/response/newspaper/NewspaperResponse.dart';

abstract class INewspaperRestService {
  Future<NewspaperResponse?> getCategoryNews(NewspaperRequest newspaperRequest, int index);
  Future<NewspaperResponse?> getNews(NewspaperRequest newspaperRequest);
}
