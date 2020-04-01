import 'dart:convert';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/service/authentication_service.dart';

class ClassModel extends ChangeNotifier {
  final AuthenticationService authenticationService;

  ClassModel({this.authenticationService}) {
    if (authenticationService.isLogined) {
      initState();
    }
  }

//  bool _busy = false;
//
//  bool get busy => _busy;
//
//  void setBusy(bool value) {
//    _busy = value;
//    notifyListeners();
//  }

  List<Data_class> _list_class = new List<Data_class>();
  Future<CLassData> _page_class;
  int _idclass;
  bool _recommended;
  Map<int, String> _request = {0: 'Đề nghị dạy', 1: 'Hủy đề nghị dạy'};
  String _infor = 'hfh';

  List<Data_class> get list_class => _list_class;

  void setList_class(List<Data_class> _newpage) {
    _list_class.addAll(_newpage);
//    notifyListeners();
  }

  Future<CLassData> get Page_class => _page_class;

  void setPage(int i) {
    _page_class = fetchClassDataNext(i);
    notifyListeners();
  }

  int get idclass => _idclass;

  void setIdclass(int _val) {
    if (_val != _idclass) {
      _idclass = _val;
    }
    notifyListeners();
  }

  bool get recommended => _recommended;

  void setRecomended(bool _val) {
    _infor = _val ? 'Hủy đề nghị dạy' : 'Đề nghị dạy';
    this._recommended = _val;

//    if (_recommended) {
//      _infor = ;
//    } else {
//      _infor = ;

//    notifyListeners();
  }

  String get infor => _infor;

  void setInfor(String _val) {
    _infor = _val;
//
    notifyListeners();
  }

  void initState() {
    _page_class = fetchClassDatatest();
  }



  Future<CLassData> fetchClassDatatest() async {
//  https://giasu.htcon.vn/api/v1/parents/courses?filter=%7B%7D&page=2
    final response = await http.get(
      'http://192.168.0.106:3300/api/v1/parents/courses',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationService.token}',
      },
    );
    Map<String, dynamic> mapResponse = json.decode(response.body);
//  print(mapResponse["total"]);
//    print('log recommmen');
//    print( mapResponse["data"][8]["recommended"].runtimeType);
    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
//    print('load true');
      return CLassData.fromJson(mapResponse);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }

  Future<CLassData> fetchClassDataNext(int i) async {
//print(i);
    final response = await http.get(
      'http://192.168.0.106:3300/api/v1/parents/courses?filter=%7B%7D&page=${i}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationService.token}',
      },
    );
    Map<String, dynamic> mapResponse = json.decode(response.body);
//    print('page ${mapResponse["page"]}');
    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
      return CLassData.fromJson(mapResponse);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }

  Future<bool> post_denghiday() async {
    var data = {"course_id": _idclass};

    try {
      var res = await http.post(
        'http://192.168.0.106:3300/api/v1/tutors/recommendations',
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

  Future<bool> delete_huydenghiday() async {
    try {
      var res = await http.delete(
        'http://192.168.0.106:3300/api/v1/tutors/recommendations/${_idclass}',
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

  change() {
    print(_recommended);
    setRecomended(!_recommended);
    print(' wsdasd${_recommended}');
    notifyListeners();
  }

  Future<void> setDenghi() async {
//       setInfor(_request["1"]);
//      print(_infor);
//      setRecomended(true);
//  _infor = _request["0"];

//  _recommended = true;
//  _infor = 'Hủy đề nghị dạy';
//    setInfor(_recommended);
    await post_denghiday();

    if(await post_denghiday()) {
      change();
    }
//    notifyListeners();
  }

  Future<void> setHuydenghi() async {
//      setInfor(_request["0"]);
//      print(_infor);
//      setRecomended(false);
//  _recommended = false;
//      _infor = 'Đề nghị dạy';
//      setInfor(_recommended);

//    _infor = _request["1"];
//    print(_infor);
//    _recomended = false;

//    await delete_huydenghiday();

    if(await delete_huydenghiday()) {
      change();
    }
//    notifyListeners();
  }
}
