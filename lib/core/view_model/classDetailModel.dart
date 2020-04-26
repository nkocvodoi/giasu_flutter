import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/model/recommendation.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:http/http.dart' as http;

class ClassDetailModel extends ChangeNotifier {
  final AuthenticationService authenticationService;

  ClassDetailModel({this.authenticationService});

  bool _recommend;

  bool _check_recommend;

  String _inforbutton;

  void setrecommend(bool _val) {
    if (_val != _recommend) {
      _recommend = _val;
    }
    _recommend
        ? _inforbutton = 'Hủy đề nghị dạy'
        : _inforbutton = 'Đề nghị dạy';
    _check_recommend = _recommend;
//  setCheck_recommend(_recommend);
  }

  get Check_recommend => _check_recommend;
  void setCheck_recommend(bool _val) {
    if (_val != _check_recommend) {
      _check_recommend = _val;
    }
    _check_recommend
        ? _inforbutton = 'Hủy đề nghị dạy'
        : _inforbutton = 'Đề nghị dạy';
    notifyListeners();
  }

  change() {
    print('${_check_recommend} log1');
    setCheck_recommend(!_check_recommend);
    print('${_check_recommend} log2');
  }

  get Inforbutton => _inforbutton;
  void setInforbutton(String _s) {
    print(_inforbutton + "1");
    _inforbutton = (_s == 'Đề nghị dạy') ? 'Hủy đề nghị dạy' : 'Đề nghị dạy';
    print(_inforbutton + "2");

    notifyListeners();
  }

  Future<Data_class> fetchClassDataId(int _id) async {
//  https://giasu.htcon.vn/api/v1/parents/courses?filter=%7B%7D&page=2
    final response = await http.get(
      APIUrl + 'api/v1/parents/courses/${_id}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationService.token}',
      },
    );
    Map<String, dynamic> mapResponse = json.decode(response.body);
//  print(mapResponse.toString());
//    print('log recommmen');
//    print( mapResponse["data"][8]["recommended"].runtimeType);
    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
//    print('load true');
      return Data_class.fromJson(mapResponse["data"]);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }

  Future<bool> post_denghiday(int _idclass) async {
    var data = {"course_id": _idclass};

    try {
      var res = await http.post(
        APIUrl + 'api/v1/tutors/recommendations',
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authenticationService.token}',
        },
      );

      print(res.body.toString() + 'denghi');

      if (res.statusCode == 200) //return res.body;
      {
        Map<String, dynamic> mapResponse = json.decode(res.body);

        if (mapResponse['code'] == 1) {
          return true;
        } else {
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('login error ' + e.toString());
    }
//    notifyListeners();
  }

  Future<bool> delete_huydenghiday(int _idclass) async {
    try {
      var res = await http.delete(
        APIUrl + 'api/v1/tutors/recommendations/${_idclass}',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authenticationService.token}',
        },
      );
      print(res.body.toString() + 'huy');
      if (res.statusCode == 200) //return res.body;
      {
        Map<String, dynamic> mapResponse = json.decode(res.body);

        if (mapResponse['code'] == 1) {
          return true;
        } else {
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('login error ' + e.toString());
    }
//  notifyListeners();
  }

  Future<List<Recommendation>> get_danhsachdenghi(int _idclass) async {
    try {
      var res = await http.get(APIUrl +'api/v1/tutors/recommendations?course_id=${_idclass}',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1ODgwNjM5MzksImlzcyI6InNhb2todWVlIiwiYXVkIjoiY2xpZW50In0.Pe8Apwi_fRhVnQWXo2tOqZ3UIPbcgkoME2V-Pt7eopA',
        },);

      if (res.statusCode == 200) //return res.body;
          {
        Map<String, dynamic> mapResponse = json.decode(res.body);

        if (mapResponse['code'] == 1) {
//          print(mapResponse['data']);

          final recommendation = mapResponse["data"].cast<Map<String, dynamic>>();
          final listOfRecommendation = await recommendation.map<Recommendation>((json) {
            return Recommendation.fromJson(json);
          }).toList();
          return listOfRecommendation;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('error ' + e.toString());
    }
//  notifyListeners();
  }

  Future<bool> chapnhandenghi(int _course_id, int _tutor_id) async {
    var data = {
      "tutor_id": _tutor_id
    };
    try {
      var res = await http.put(APIUrl +'api/v1/tutors/accept_recommend_user/${_course_id}',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authenticationService.token}',

        },
        body: json.encode(data),
      );

      if (res.statusCode == 200) //return res.body;
          {
        Map<String, dynamic> mapResponse = json.decode(res.body);

        if (mapResponse['code'] == 1) {
          print(mapResponse.toString());
          return true;
        } else {
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('error ' + e.toString());
    }
//  notifyListeners();
  }

  Future<bool> tuchoidenghi(int _course_id, int _tutor_id) async {
    var data = {
      "tutor_id": _tutor_id
    };
    try {
      var res = await http.put(APIUrl +'api/v1/tutors/reject_recommend_user/${_course_id}',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authenticationService.token}',

        },
        body: json.encode(data),
      );

      if (res.statusCode == 200) //return res.body;
          {
        Map<String, dynamic> mapResponse = json.decode(res.body);

        if (mapResponse['code'] == 1) {
//          print(mapResponse['data']);

          return true;
        } else {
          return false;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('error ' + e.toString());
    }
//  notifyListeners();
  }
}
