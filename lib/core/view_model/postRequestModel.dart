import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class PostRequestModel extends ChangeNotifier {
  int _group = 0;
  int get group => _group;
  void setGroup(int val) {
    if (val != _group) {
      _group = val;
      notifyListeners();
    }
  }

  String _role = 'parentt';
  String get role => _role;
  void setRole() {
    if (_group == 0)
      _role = 'parentt';
    else
      _role = 'tutor';
    notifyListeners();
  }

  Future<bool> postRequest(Map _map) async {
//    var data = {"user":{
//      "role": role,
//      "full_name": full_name,
//      "phone_number": phone_number,
//      "email": email,
//      "password": password,
//      "password_confirmation": password_confirmation
//    }
//    };
    var data = {"course": _map};

    var res = await http.post(APIUrl + 'main/thong-tin',
        body: json.encode(data), headers: {'Content-Type': 'application/json'});
    if (res.statusCode == 200) //return res.body;
    {
//      Map<String, dynamic> mapResponse =  json.decode(res.body);

      return true;
    } else {
      return null;
    }
  }

  // Future<Post> createPost(String url, {Map body}) async {
  // return http.post(url, body: body).then((http.Response response) {
  //   final int statusCode = response.statusCode;

  //   if (statusCode < 200 || statusCode > 400 || json == null) {
  //     throw new Exception("Error while fetching data");
  //   }
  //   return Post.fromJson(json.decode(response.body));
  // });
//}

}
