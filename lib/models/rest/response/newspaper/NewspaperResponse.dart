class NewspaperResponse {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewspaperResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  NewspaperResponse copyWith({
    String? status,
    int? totalResults,
    List<Articles>? articles,
  }) {
    return NewspaperResponse(
      status: status ?? this.status,
      totalResults: totalResults ?? this.totalResults,
      articles: articles ?? this.articles,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles,
    };
  }

  factory NewspaperResponse.fromJson(Map<String, dynamic> json) {
    return NewspaperResponse(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)?.map((e) => Articles.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  @override
  String toString() => "NewspaperResponse(status: $status,totalResults: $totalResults,articles: $articles)";

  @override
  int get hashCode => Object.hash(status, totalResults, articles);

  @override
  bool operator ==(Object other) => identical(this, other) || other is NewspaperResponse && runtimeType == other.runtimeType && status == other.status && totalResults == other.totalResults && articles == other.articles;
}

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

class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  Source copyWith({
    String? id,
    String? name,
  }) {
    return Source(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  @override
  String toString() => "Source(id: $id,name: $name)";

  @override
  int get hashCode => Object.hash(id, name);

  @override
  bool operator ==(Object other) => identical(this, other) || other is Source && runtimeType == other.runtimeType && id == other.id && name == other.name;
}
