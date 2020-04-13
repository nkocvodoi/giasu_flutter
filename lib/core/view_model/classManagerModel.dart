import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:http/http.dart' as http;


class ClassManagerModel extends ChangeNotifier {
  final AuthenticationService authenticationService;

  ClassManagerModel({this.authenticationService});


  Future<CLassData> fetchMyClass() async {
//  https://giasu.htcon.vn/api/v1/parents/courses?filter=%7B%7D&page=2
    final response = await http.get(
      APIUrl + 'api/v1/parents/find_manage_course_tutor',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationService.token}',
      },
    );
    Map<String, dynamic> mapResponse = json.decode(response.body);
//  print(mapResponse["total"]);
//    print('log recommmen');
//    print( mapResponse["data"][8]["recommended"].runtimeType);
    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
//    print('load true');
      return CLassData.fromJson(mapResponse);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }

}