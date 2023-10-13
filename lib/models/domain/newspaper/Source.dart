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
