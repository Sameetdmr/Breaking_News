import 'package:newspaper_app/models/domain/newspaper/Source.dart';

class Article {
  String? name;
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  Article({
    this.name,
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        name: json["name"],
        source: json["source"] != null ? Source.fromJson(json["source"]) : null,
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
      );
}
