import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class SignUpModel extends ChangeNotifier{

  int _group = 0;
  int get group => _group;
  void setGroup(int val) {
    if(val != _group) {
      _group = val;
      notifyListeners();
    }
  }
  String _role = 'parentt';
  String get role => _role;
  void setRole(){
    if(_group == 0) _role = 'parentt';
    else _role = 'tutor';
    notifyListeners();
  }

  Future<bool> signup(Map _map) async
  {

//    var data = {"user":{
//      "role": role,
//      "full_name": full_name,
//      "phone_number": phone_number,
//      "email": email,
//      "password": password,
//      "password_confirmation": password_confirmation
//    }
//    };
    var data = {"user":_map};

    var res = await http.post('https://giasu.htcon.vn/api/users/registrations',
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json'
        });
    if (res.statusCode == 200) //return res.body;
        {
//      Map<String, dynamic> mapResponse =  json.decode(res.body);

      return true;
    } else {
      return null;
    }

  }



}