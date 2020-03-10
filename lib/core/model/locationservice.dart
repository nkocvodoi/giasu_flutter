import 'dart:convert';

import 'package:http/http.dart' as http;

import 'List_TeacherData.dart' as filter;

class LocationService {
  static final LocationService instance = LocationService.internal();
  LocationService.internal();
  factory LocationService() => instance;

  Future<List<filter.Location>> fetchLocation() async {
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/locations');
    if(response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if(mapResponse["code"] == 1) {
        final location = mapResponse["data"].cast<Map<String, dynamic>>();
        final listOfLocation = await location.map<filter.Location>((json) {
          return filter.Location.fromJson(json);
        }).toList();
        return listOfLocation;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load');
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