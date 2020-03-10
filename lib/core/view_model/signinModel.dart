import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/model/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class SignInModel extends ChangeNotifier{

  bool _busy = false;
  bool get busy => _busy;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

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
  Future<bool> login(String userPhoneText,String userPassText ) async {
    setBusy(true);
//    var userId = int.tryParse(userIdText);
    var success = await login1(userPhoneText, userPassText);
    setBusy(false);
    return success;
  }

  Future<bool> login1(String phone_number, String password) async {

    var data = {
      "user": {"phone_number": phone_number, "password": password}
    };
    try{
      var res = await http.post('https://giasu.htcon.vn/api/sign_in',
          body: json.encode(data),
          headers: {
            'Content-Type': 'application/json'
          });

      if (res.statusCode == 200) //return res.body;
          {
        Map<String, dynamic> mapResponse =  json.decode(res.body);
        if(mapResponse['code']==1) return true;
        else return false;
      } else {
        return null;
      }
    }
    catch (e
    ) {
      print('login error ' + e.toString());
    }
    notifyListeners();
  }

}