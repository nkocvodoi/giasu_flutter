import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: missing_return
//Future<List<Data>> fetchData() async {
//  final response =
//  await http.get('https://giasu.htcon.vn/api/v1/parents/courses');
//
//  if (response.statusCode == 200) {
//    // If the call to the server was successful, parse the JSON.
//    //return Post.fromJson(json.decode(response.body));
//    Map<String, dynamic> mapResponse = json.decode(response.body);
//    if (mapResponse["code"] == 1) {
//      final list = mapResponse["data"].cast<Map<String, dynamic>>();
//      final listOfclass = await list.map<Data>((json) {
//        return Data.fromJson(json);
//      }).toList();
//      return listOfclass;
//    }
//  } else {
//    // If that call was not successful, throw an error.
//    throw Exception('Failed to load ');
//  }
//}
class CLassData {
  int code;
  //List<Data>data;
  String status;
  String page;
  int per_page;
  int total;

  CLassData({
    this.code,
//    this.data,
    this.status,
    this.page,
    this.per_page,
    this.total,
});

  CLassData.fromJson(Map<String, dynamic> json) {
    code = json['code'];


  }




}
