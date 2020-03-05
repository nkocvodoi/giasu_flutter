class Subjects {
  final int id;
  final String name;

  Subjects({
    this.id,
    this.name,
  });

  factory Subjects.fromJson(Map<dynamic, dynamic> json) => Subjects(
    id: json['id'],
    name: json['name'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
  };
}