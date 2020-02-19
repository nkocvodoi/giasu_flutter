import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: missing_return
Future<List<list_classData>> fetchList_ClassData() async {
  final response =
      await http.get('https://giasu.htcon.vn/api/v1/parents/courses');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    //return Post.fromJson(json.decode(response.body));
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (mapResponse["code"] == 1) {
      final list = mapResponse["data"].cast<Map<String, dynamic>>();
      final listOfclass = await list.map<list_classData>((json) {
        return list_classData.fromJson(json);
      }).toList();
      return listOfclass;
    }
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load ');
  }
}

class list_classData {
  int id;
  String name;
  String full_name;
  String phone_number;
  String tutor_gender;
  String address;

  // ignore: non_constant_identifier_names
  list_classData({this.id, this.name, this.phone_number, this.tutor_gender, this.address});

  factory list_classData.fromJson(Map<String, dynamic> json) {
    return list_classData(
      id: json['id'],
      name: json['name'],
//      full_name: json['full_name'],
      phone_number: json['phone_number'],
      tutor_gender: json['tutor_gender'],
      address: json['address'],
    );
  }
}
