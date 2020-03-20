import 'package:flutter/material.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NapBitsModel extends ChangeNotifier {

  final AuthenticationService authenticationService;

  NapBitsModel({this.authenticationService});

  int _group1 = 0;
  int get group1 => _group1;
  void setGroup1(int val) {
    if(val != _group1) {
      _group1 = val;
      notifyListeners();
    }
  }
  int _group2 = 0;
  int get group2 => _group2;
  void setGroup2(int val) {
    if(val != _group2) {
      _group2 = val;
      notifyListeners();
    }
  }

  Future<String> postNapBits() async {
    final response =
    await http.get('http://192.168.0.106:3300/api/v1/payments',
        headers: {
          'Authorization': 'Bearer ${authenticationService.token}',
        }
    );
    Map<String, dynamic> mapResponse = json.decode(response.body);
//    print(mapResponse.toString());
    print(mapResponse["data"]["available_coin"]);
    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
      if (mapResponse["code"] == 1) {
        return mapResponse["data"];
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }

}