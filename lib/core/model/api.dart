import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_giasu/core/model/location.dart';
import 'package:test_giasu/core/model/subject.dart';

import 'List_ClassData.dart';
//import 'List_TeacherData.dart';
class Api {




  Future<bool> login1(String phone_number, String password) async {

    var data = {
      "user": {"phone_number": phone_number, "password": password}
    };
    var res = await http.post('https://giasu.htcon.vn/api/sign_in',
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json'
        });
    if (res.statusCode == 200) //return res.body;
        {
      Map<String, dynamic> mapResponse =  json.decode(res.body);
      print(mapResponse['user']['email']);
      print('true');

      return true;
    } else {
      print(res.body);
      return null;
    }

  }
Future<bool> signup(String role, String full_name, String phone_number, String email, String password, String password_confirmation) async {

    var data = {"user":{
      "role": role,
      "full_name": full_name,
      "phone_number": full_name,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation
    }
    };
    var res = await http.post('https://giasu.htcon.vn/api/users/registrations',
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json'
        });
    if (res.statusCode == 200) //return res.body;
        {
      Map<String, dynamic> mapResponse =  json.decode(res.body);
      print(mapResponse['code']);
      print('true');

      return true;
    } else {
      print(res.body);
      return null;
    }

  }

  Future<Location> fetchLocation() async {
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/locations');
    Map<String, dynamic> mapResponse = json.decode(response.body);
    print(mapResponse["total"]);
    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
      return Location.fromJson(mapResponse["data"]);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }
Future<Subjects> fetchSubject() async {
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/locations');
    Map<String, dynamic> mapResponse = json.decode(response.body);
    print(mapResponse["total"]);
    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
      return Subjects.fromJson(mapResponse["data"]);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }

}