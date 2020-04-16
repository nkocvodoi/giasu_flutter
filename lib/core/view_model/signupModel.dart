
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_giasu/core/service/authentication_service.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';


class SignUpModel extends ChangeNotifier{
final AuthenticationService authenticationService;

  SignUpModel({this.authenticationService});
  int _group = 0;
  int get group => _group;
  void setGroup(int val) {
    if(val != _group) {
      _group = val;
      notifyListeners();
    }
  }

  String _infor;
  String get Infor => _infor;

//  bool _validate = false;
//  bool get Validate => _validate;
//  void setValidate() {
//    _validate = true;
//  }
  String _role = 'parentt';
  String get role => _role;
  void setRole(){
    if(_group == 0) _role = 'parentt';
    else _role = 'tutor';
    notifyListeners();
  }

  Future<bool> checksignup(Map _map) async
  {
    var data = {"user":_map};
//    https://giasu.htcon.vn/api/users/registrations
    try {
      var res = await http.post(APIUrl + 'api/users/registrations',
          body: json.encode(data),
          headers: {
            'Content-Type': 'application/json'
          });
      if (res.statusCode == 200) //return res.body;
          {
        Map<String, dynamic> mapResponse =  json.decode(res.body);
//        print(mapResponse.toString());

        if(mapResponse["code"] == 1) {
        authenticationService.setToken(mapResponse["token"]);
        // authenticationService.setId(mapResponse["user"]["id"]);
        // authenticationService.setEmail(mapResponse["user"]["email"]);
        // authenticationService.setIdentification_number(mapResponse["user"]["identification_number"]);
          return true;
        }
        else {
          _infor = mapResponse["message"];
          return false;
        }
      } else {
        return null;
      }
    }
catch (e) {
      print(e.toString());
}
notifyListeners();
  }

}