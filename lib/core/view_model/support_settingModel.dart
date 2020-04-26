import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class Support_SettingModel extends ChangeNotifier {
  final AuthenticationService authenticationService;

  Support_SettingModel({this.authenticationService}) {
     _count =
        (authenticationService.notification == 'notify_on') ? true : false;
    setNotifi();

  }

  bool _count;
  bool get count => _count;
  void setCount(bool val) {
    if (val != _count) {
      _count = val;
      notifyListeners();
    }
  }

  String _notifi = 'Nhận';
  String get notifi => _notifi;
  void setNotifi() {
    if (_count)
      _notifi = 'Nhận';
    else
      _notifi = 'Tắt';
    notifyListeners();
  }

  Future setNotification() async {
    try {
      var res = await http.put(
        APIUrl + 'api/v1/tutors/user_notifications/${authenticationService.id}',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authenticationService.token}',
        },
      );

      if (res.statusCode == 200) //return res.body;
      {
        Map<String, dynamic> mapResponse = json.decode(res.body);

        if (mapResponse['code'] == 1) {
          print(mapResponse.toString());
        }
      }
    } catch (e) {
      print('login error ' + e.toString());
    }
//  notifyListeners();
  }
}
