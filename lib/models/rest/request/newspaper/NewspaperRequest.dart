class NewspaperRequest {
  String? country;

  NewspaperRequest({this.country});

  Map<String, dynamic> toJson() => {
        "country": country,
      };
}
