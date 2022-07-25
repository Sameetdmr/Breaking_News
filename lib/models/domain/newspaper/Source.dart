class Source {
  String? name;

  Source({this.name});

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        name: json["name"] == null ? false : json["name"],
      );
}
