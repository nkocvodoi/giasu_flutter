import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class ClassModel extends ChangeNotifier {
  final AuthenticationService authenticationService;

  ClassModel({this.authenticationService}) {
//    if (authenticationService.isLogined) {
//      initState();
//    }
  }

  List<Data_class> _list_class = new List<Data_class>();
  Future<CLassData> _page_class;
  int _idclass;
  bool _recommended;
  Map<int, String> _request = {0: 'Đề nghị dạy', 1: 'Hủy đề nghị dạy'};
  String _infor ;

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

  Data_class _data_class = new Data_class();
  Data_class get data_class => _data_class;

  bool _isFetchingClassDataId = false;
  bool get isFetchingClassDataId => _isFetchingClassDataId;
  void setBusyClassDataId(bool _val) {
    _isFetchingClassDataId = _val;
    notifyListeners();
  }

  String _stateClass;
  String get StateClass => _stateClass;


  Future<CLassData> fetchClassDatatest() async {
//  https://giasu.htcon.vn/api/v1/parents/courses?filter=%7B%7D&page=2
    final response = await http.get(
      APIUrl + 'api/v1/parents/courses',
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
      APIUrl + 'api/v1/parents/courses?filter=%7B%7D&page=${i}',
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

Future setClassDataId(int _idclass) async {
    setBusyClassDataId(false);
    _data_class = await fetchClassDataId(_idclass);
    setBusyClassDataId(true);

}

  Future<Data_class> fetchClassDataId(int _id) async {
    final response = await http.get(
      APIUrl + 'api/v1/parents/courses/${_id}',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authenticationService.token}',
      },
    );
    Map<String, dynamic> mapResponse = json.decode(response.body);
    if (response.statusCode == 200) {
//      print('log' + mapResponse['data']['status']);

      return Data_class.fromJson(mapResponse["data"]);
    } else {
      throw Exception('Failed to load ');
    }
  }

  Future<bool> post_denghiday() async {
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

  Future<bool> delete_huydenghiday() async {
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
   checkStateClass(Data_class testData) {
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//        builder: (context) => PersonInfor(),

//  _getdata();
    if (testData.parentt_id == authenticationService.id) {
      // Nguoi tao lop
      switch (testData.status) {
        case "completing":
          {
//            print("Lop phat sinh + Change");
            _stateClass = "Lop phat sinh + Change";
          }
          break;
        case "reporting":
          {
//            print("Change");
            _stateClass = "Change" ;
          }
          break;
        case "date_changed":
          {
//            print("No button");
            _stateClass = "No button";
          }
          break;

        default:
          {
//            print("Xem de nghi day");
            _stateClass = "Xem de nghi day";
          }
          break;
      }
    } else {
      if (testData.check_recommend) {
        //Nguoi de nghi

        switch (testData.status) {
          case "completing":
            {
//              print("Lop phat sinh + Change");
              _stateClass = "Lop phat sinh + Change";

            }
            break;
          case "pending":
            {
              if (testData.recommend_status == "accepted") {
//                print("Thanh toan");
                _stateClass = "Thanh toan";
              } else {
//                print('Huy de nghi');
                _stateClass = 'Huy de nghi';
              }
            }
            break;
          case "reporting":
            {
//              print("Change");
              _stateClass = "Change";
            }
            break;
          case "date_changed":
            {
//              print("No button");
              _stateClass = "No button";
            }
            break;

//      default:
//        {
//          print("Invalid choice");
//        }
//        break;
        }
      } else {
        //Chua de nghi
        switch (testData.status) {
          case "reporting":
            {
//              print("Change");
              _stateClass = "Change";
            }
            break;
          case "date_changed":
            {
//              print("No button");
              _stateClass = "No button";
            }
            break;
          default:
            {
//              print("De nghi day");
              _stateClass = "De nghi day";
            }
        }
      }
    }
  }
}

