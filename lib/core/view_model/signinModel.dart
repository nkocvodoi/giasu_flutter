import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_giasu/core/model/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_giasu/core/model/currentUser.dart';
import 'package:test_giasu/core/service/authentication_service.dart';

class SignInModel extends ChangeNotifier {
  final AuthenticationService authenticationService;

  SignInModel({this.authenticationService});

  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  String _infor;

  String get Infor => _infor;

  bool _count = true;

  bool get count => _count;

  void setCount(bool val) {
    if (val != _count) {
      _count = val;
      notifyListeners();
    }
  }

  change() {
    setCount(!_count);
  }


  Future<bool> login1(Map _map) async {
    var data = {"user": _map};

    try {
      var res = await http.post('http://192.168.0.106:3300/api/sign_in',
          body: json.encode(data),
          headers: {'Content-Type': 'application/json'});

      if (res.statusCode == 200) //return res.body;
      {
        Map<String, dynamic> mapResponse = json.decode(res.body);

        if (mapResponse['code'] == 1) {
          authenticationService.setToken(mapResponse["token"]);
          authenticationService.setId(mapResponse["user"]["id"]);
          authenticationService
              .setCurrentUser(CurrentUser.fromJson(mapResponse["user"]));
//          print('log');
//          print(CurrentUser.fromJson(mapResponse["user"]));
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
    notifyListeners();
  }
}
