import 'dart:convert';

import 'package:http/http.dart' as http;

//import 'List_ClassData.dart' as filter;

class FormTeachingService {
  static final FormTeachingService instance = FormTeachingService.internal();
  FormTeachingService.internal();
  factory FormTeachingService() => instance;
  Future<List<Teachings>> fetchTeaching() async {
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/form_teachings');
    if(response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if(mapResponse["code"] == 1) {
        final form_teachings = mapResponse["data"].cast<Map<String, dynamic>>();
        final listOfTeaching = await form_teachings.map<Teachings>((json) {
          return Teachings.fromJson(json);
        }).toList();
        return listOfTeaching;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load ');
    }
  }
}

class Teachings {
  final int id;
  final String name;

  Teachings({
    this.id,
    this.name,
  });

  factory Teachings.fromJson(Map<dynamic, dynamic> json) => Teachings(
    id: json['id'],
    name: json['name'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
  };
}