class Location {
  final int id;
  final String name;

  Location({
    this.id,
    this.name,
  });

  factory Location.fromJson(Map<dynamic, dynamic> json) => Location(
    id: json['id'],
    name: json['name'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
  };
}