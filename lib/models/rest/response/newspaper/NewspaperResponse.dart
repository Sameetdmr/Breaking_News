import 'package:newspaper_app/models/domain/newspaper/Article.dart';

class NewspaperResponse {
  String? status;
  List<Article>? article;
  NewspaperResponse({
    this.status,
    this.article,
  });

  factory NewspaperResponse.fromJson(Map<String, dynamic> json) => NewspaperResponse(
        status: json["status"],
        article: json["articles"] == null ? null : List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
      );
}
