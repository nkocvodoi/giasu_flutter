import 'dart:convert';

import 'package:http/http.dart' as http;

import 'List_TeacherData.dart' as filter;

class LocationService {
  Future<filter.Location> fetchLocation() async {
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/locations');
    Map<String, dynamic> mapResponse = json.decode(response.body);
    print(mapResponse["total"]);
    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
      return filter.Location.fromJson(mapResponse["data"]);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }
}

//class Location {
//  final int id;
//  final String name;
//
//  Location({
//    this.id,
//    this.name,
//  });
//
//  factory Location.fromJson(Map<dynamic, dynamic> json) => Location(
//    id: json['id'],
//    name: json['name'] as String,
//  );
//
//  Map<String, dynamic> toJson() => <String, dynamic>{
//    'id': id,
//    'name': name,
//  };
//}