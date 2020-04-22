import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class PassWordModel extends ChangeNotifier {
  final AuthenticationService authenticationService;

  PassWordModel({this.authenticationService});

  String _infor;

  String get Infor => _infor;

  Future<bool> change_password(Map _map) async {
    var data = _map;

    try {
      var res = await http.put(
          APIUrl + 'api/v1/users/change_passwords/${authenticationService.id}',
          body: json.encode(data),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authenticationService.token}',
          });

      if (res.statusCode == 200) //return res.body;
      {
        Map<String, dynamic> mapResponse = json.decode(res.body);

        if (mapResponse['code'] == 1) {
          _infor = mapResponse['message'];

          return true;
        } else {
          _infor = mapResponse['message'];
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('login error ' + e.toString());
    }
  }
}
