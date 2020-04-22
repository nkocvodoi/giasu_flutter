import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:http/http.dart' as http;
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class TestState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestState();
  }
}

class _TestState extends State<TestState> {
  TestFunction _function = TestFunction(course_id: 627, user_id: 2);

  Future<Data_class> get_dataclass() async {
    try {
      var res = await http.get(
        APIUrl + 'api/v1/parents/courses/626',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1ODcxMzE5NTAsImlzcyI6InNhb2todWVlIiwiYXVkIjoiY2xpZW50In0.NdrYJTqpEfeafenMiKeQ8oFhR3mkWQzYTXldyK9d6J0',
        },
      );

      if (res.statusCode == 200) //return res.body;
          {
        Map<String, dynamic> mapResponse = json.decode(res.body);

        if (mapResponse['code'] == 1) {
//          print(mapResponse['data']);

          return Data_class.fromJson(mapResponse['data']);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('login error ' + e.toString());
    }
//  notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: RaisedButton(
          color: blue,
          onPressed: () async {
            _function.getdata();
            print(_function.datacalss.toString());
//          Data_class _dsd = await get_dataclass();
//          print(_dsd.status);
//          _function.CheckStateClass(_dsd);

//            print(_function._testData.recommend_status.toString());
          },
          child: Container(
            child: Center(
                child: Text(
              ' State ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            )),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
    );
  }
}

class TestFunction {
//  static final TestFunction instance =
//  TestFunction.internal();
//  TestFunction.internal();
//  factory TestFunction() => instance;


  int course_id;
  int user_id;
  BuildContext context;

  TestFunction({this.course_id, this.user_id,this.testData});

  Data_class testData ;
//  Data_class _testData = get_dataclass();

  Data_class get datacalss => testData;

  Future<void> getdata() async {
    print('log');
    testData = await get_dataclass();
    print(testData.toString());

  }

  void CheckStateClass(Data_class testData) {
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//        builder: (context) => PersonInfor(),

//  _getdata();
    if (testData.parentt_id == user_id) {
      // Nguoi tao lop
      switch (testData.status) {
        case "completing":
          {
            print("Lop phat sinh + Change");
          }
          break;
        case "reporting":
          {
            print("Change");
          }
          break;
        case "date_changed":
          {
            print("No button");
          }
          break;

        default:
          {
            print("Xem de nghi day");
          }
          break;
      }
    } else {
      if (testData.check_recommend) {
        //Nguoi de nghi

        switch (testData.status) {
          case "completing":
            {
              print("Lop phat sinh + Change");
            }
            break;
          case "pending":
            {
              if (testData.recommend_status == "accepted") {
                print("Thanh toan");
              } else {
                print('Huy de nghi');
              }
            }
            break;
          case "reporting":
            {
              print("Change");
            }
            break;
          case "date_changed":
            {
              print("No button");
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
              print("Change");
            }
            break;
          case "date_changed":
            {
              print("No button");
            }
            break;
          default:
            {
              print("De nghi day");
            }
        }
      }
    }
  }

  Future<Data_class> get_dataclass() async {
    try {
      var res = await http.put(
        APIUrl + 'api/v1/parents/courses/${course_id}',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1ODcxMzE5NTAsImlzcyI6InNhb2todWVlIiwiYXVkIjoiY2xpZW50In0.NdrYJTqpEfeafenMiKeQ8oFhR3mkWQzYTXldyK9d6J0',
        },
      );

      if (res.statusCode == 200) //return res.body;
      {
        Map<String, dynamic> mapResponse = json.decode(res.body);

        if (mapResponse['code'] == 1) {
          print(mapResponse['data']);

          return Data_class.fromJson(mapResponse['data']);
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('login error ' + e.toString());
    }
//  notifyListeners();
  }
}
