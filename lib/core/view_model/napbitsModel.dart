import 'package:flutter/material.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class NapBitsModel extends ChangeNotifier {
  final AuthenticationService authenticationService;

  NapBitsModel({this.authenticationService});

  int _group1 = 0;
  int get group1 => _group1;
  void setGroup1(int val) {
    if (val != _group1) {
      _group1 = val;
      notifyListeners();
    }
  }

  int _group2 = 0;
  int get group2 => _group2;
  void setGroup2(int val) {
    if (val != _group2) {
      _group2 = val;
      notifyListeners();
    }
  }

  Map<int, String> _napBits = {
    0: "50000",
    1: "100000",
    2: "200000",
    3: "500000",
  };

  Future<String> postNapBits() async {
    var _data = json.encode({
      "payment": {
        "total_amount": _napBits[_group1],
        "payment_method": "ATM_ONLINE",
        "bank_code": "EXB"
      }
    });
    print(_data.toString());
    final response = await http.post( APIUrl +
      'api/v1/payments',
      headers: {
    'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationService.token}',
      },
      body: _data,
    );
//    print(response);
    Map<String, dynamic> mapResponse = json.decode(response.body);
//    print(response.statusCode);
//    print('log');
//    print(mapResponse["data"]);
  //  print(response.body);

    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
      if (mapResponse["code"] == 1) {
//        String _link = mapResponse["data"];
        return mapResponse["data"];
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }
}
