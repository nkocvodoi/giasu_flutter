import 'dart:convert';

import 'package:http/http.dart' as http;

//import 'List_ClassData.dart' as filter;

class EducationService {
  static final EducationService instance = EducationService.internal();
  EducationService.internal();
  factory EducationService() => instance;
  Future<List<Educations>> fetchEducation() async {
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/educations');
    if(response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if(mapResponse["code"] == 1) {
        final education = mapResponse["data"].cast<Map<String, dynamic>>();
        final listOfEducation = await education.map<Educations>((json) {
          return Educations.fromJson(json);
        }).toList();
        return listOfEducation;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load ');
    }
  }
}

class Educations {
  final int id;
  final String name;

  Educations({
    this.id,
    this.name,
  });

  factory Educations.fromJson(Map<dynamic, dynamic> json) => Educations(
    id: json['id'],
    name: json['name'] as String,
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
  };
}