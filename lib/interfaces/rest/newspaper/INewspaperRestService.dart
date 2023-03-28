import 'package:newspaper_app/models/rest/response/newspaper/NewspaperResponse.dart';

abstract class INewspaperRestService {
  Future<NewspaperResponse?> getCategoryNews(int index);
  Future<NewspaperResponse?> getNews();
}
