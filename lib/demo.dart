import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_giasu/core/model/recommendation.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

Future<bool> post_denghiday(Map _map) async {
  var data = {
    "course_id": 632
  };

  try {
    var res = await http.post('http://192.168.0.106:3300/api/v1/tutors/recommendations',
        body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },);

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
Future<bool> delete_huydenghiday(Map _map) async {
  var _id;
  try {
    var res = await http.delete('http://192.168.0.106:3300/api/v1/tutors/recommendations/${_id}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },);

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
Future<bool> put_chapnhandenghiday(Map _map) async {
  var data = {
    "tutor_id": 3
  };

  try {
    var res = await http.put('http://192.168.0.106:3300/api/v1/tutors/accept_recommend_user/:id',
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },);

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
Future<bool> put_tuchoidenghiday(Map _map) async {
  var data = {
    "tutor_id": 3
  };

  try {
    var res = await http.put('http://192.168.0.106:3300/api/v1/tutors/reject_recommend_user/:id',
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },);

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
Future<bool> put_giasunhanlop(Map _map) async {
  var data = {
    "course": {
      "tuition_fee": 710000,
      "method": "Tài khoản coin"
    }
  };

  try {
    var res = await http.put('http://192.168.0.106:3300/api/v1/tutors/complete_courses/:id',
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },);

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
Future<bool> post_chapnhanloimoiday(Map _map) async {
  var data = {
    "data": {
      "course_id": "614",
      "tutor_id": 3
    },
    "course": {
      "tuition_fee": 2810000,
      "method": "Tài khoản coin"
    }
  };

  try {
    var res = await http.post('http://192.168.0.106:3300/api/v1/tutors/accept_invites',
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },);

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
Future<bool> delete_tuchoiloimoiday(Map _map) async {
  var _id;
  try {
    var res = await http.delete('http://192.168.0.106:3300/api/v1/tutors/accept_invites/${_id}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },);

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
Future<bool> put_gsbaophatsinh(Map _map) async {
  var data = {
    "course": {
      "report": "gvbs"
    }
  };

  try {
    var res = await http.put('http://192.168.0.106:3300/api/v1/tutors/report_courses/:id',
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },);

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
Future<bool> get_dataclass(Map _map) async {
  try {
    var res = await http.put(APIUrl +'api/v1/parents/courses/:id',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },);

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




