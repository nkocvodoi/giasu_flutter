import 'dart:convert';

import 'package:http/http.dart' as http;

//import 'List_ClassData.dart' as filter;

class SubjectService {
  static final SubjectService instance = SubjectService.internal();
  SubjectService.internal();
  factory SubjectService() => instance;
  Future<List<Subjects>> fetchSubject() async {
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/subjects');
    
    if(response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if(mapResponse["code"] == 1) {
        final subject = mapResponse["data"].cast<Map<String, dynamic>>();
        final listOfSubject = await subject.map<Subjects>((json) {
          return Subjects.fromJson(json);
        }).toList();
        return listOfSubject;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load ');
    }
  }
}


class Subjects {
  final int id;
  final String name;
  final String group;
  Subjects({
    this.id,
    this.name,
    this.group
  });

  factory Subjects.fromJson(Map<dynamic, dynamic> json) => Subjects(
    id: json['id'],
    name: json['name'] as String,
    group: json['group'] as String,
  );
   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'group': group,
    };
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'group': group,
  };
}