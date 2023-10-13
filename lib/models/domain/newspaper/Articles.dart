import 'package:newspaper_app/models/domain/newspaper/Source.dart';

class Articles {
  Source? source;
  String? author;
  String? title;
  Null description;
  String? url;
  Null urlToImage;
  String? publishedAt;
  Null content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles copyWith({
    Source? source,
    String? author,
    String? title,
    Null description,
    String? url,
    Null urlToImage,
    String? publishedAt,
    Null content,
  }) {
    return Articles(
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      source: json['source'] == null ? null : Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as Null,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as Null,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as Null,
    );
  }

  @override
  String toString() => "Articles(source: $source,author: $author,title: $title,description: $description,url: $url,urlToImage: $urlToImage,publishedAt: $publishedAt,content: $content)";

  @override
  int get hashCode => Object.hash(source, author, title, description, url, urlToImage, publishedAt, content);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Articles &&
          runtimeType == other.runtimeType &&
          source == other.source &&
          author == other.author &&
          title == other.title &&
          description == other.description &&
          url == other.url &&
          urlToImage == other.urlToImage &&
          publishedAt == other.publishedAt &&
          content == other.content;
}
