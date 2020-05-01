import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/service/authentication_service.dart';

import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class SelectedTimeModel extends ChangeNotifier {
  final AuthenticationService authenticationService;

  SelectedTimeModel({this.authenticationService});

  List<bool> isSelected = List.filled(3, false, growable: true);
  List<bool> isSelected1 = List.filled(3, false, growable: true);
  List<bool> isSelected2 = List.filled(3, false, growable: true);
  List<bool> isSelected3 = List.filled(3, false, growable: true);
  List<bool> isSelected4 = List.filled(3, false, growable: true);
  List<bool> isSelected5 = List.filled(3, false, growable: true);
  List<bool> isSelected6 = List.filled(3, false, growable: true);
  List<bool> isSelect = List.filled(21, false, growable: true);
  List<bool> get listSelected => isSelect;
  List<Schedule> schedules = List<Schedule>();
  Future<List<Schedule>> fetchPersonalSchedule() async {
    final response = await http.get(APIUrl + 'api/v1/show_schedule/${authenticationService.id}',headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authenticationService.token}',
    });
    if(response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if(mapResponse["code"] == 1) {
        final schedlules = mapResponse["data"].cast<Map<String, dynamic>>();
        final listOfSchedule = await schedlules.map<Schedule>((json) {
          return Schedule.fromJson(json);
        }).toList();
        return listOfSchedule;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<Schedule>> fetchSchedule() async{
    final response = await http.get(APIUrl + 'api/v1/show_schedule/${authenticationService.id}',headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${authenticationService.token}',
    });
    Map<String, dynamic> mapResponse = json.decode(response.body);
   
    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
      if (mapResponse["code"] == 1) {
        print(mapResponse['data'].toString());
//        print('log');
//        CurrentUser _ds = CurrentUser.fromJson(mapResponse["data"]);
        List<Schedule> _ds = mapResponse['data'];
      //print('log' + Schedules.fromJson(mapResponse["data"]).toString());
//        print('dfhduf' + _ds.role.toString());
        return _ds;
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }



  List<bool> count(int n) {
    switch (n) {
      case 0:
        return isSelected;
        break;
      case 1:
        return isSelected1;
        break;
      case 2:
        return isSelected2;
        break;
      case 3:
        return isSelected3;
        break;
      case 4:
        return isSelected4;
        break;
      case 5:
        return isSelected5;
        break;
      default:
        return isSelected6;
        break;
    }
  }

  refreshList() {
    isSelected = List.filled(3, false, growable: true);
    isSelected1 = List.filled(3, false, growable: true);
    isSelected2 = List.filled(3, false, growable: true);
    isSelected3 = List.filled(3, false, growable: true);
    isSelected4 = List.filled(3, false, growable: true);
    isSelected5 = List.filled(3, false, growable: true);
    isSelected6 = List.filled(3, false, growable: true);
    isSelect = List.filled(21, false, growable: true);
  }

  void setList(bool val, int index){
    isSelect[index] = val;
    notifyListeners();
  }

  void setCount(bool val, int index, int n) {
    switch (n) {
      case 0:
        if (val != isSelected[index]) {
          isSelected[index] = val;
      
          // Schedule newSchedule = Schedule(
          //     id: (index + n * 3 + 1), day: n, session: (index + n * 3));
        }
        break;
      case 1:
        if (val != isSelected1[index]) {
          isSelected1[index] = val;
    
        }
        break;
      case 2:
        if (val != isSelected2[index]) {
          isSelected2[index] = val;
      
        }
        break;
      case 3:
        if (val != isSelected3[index]) {
          isSelected3[index] = val;
    
        }
        break;
      case 4:
        if (val != isSelected4[index]) {
          isSelected4[index] = val;
         
        }
        break;
      case 5:
        if (val != isSelected5[index]) {
          isSelected5[index] = val;
         
        }
        break;
      default:
        if (val != isSelected6[index]) {
          isSelected6[index] = val;
         
        }
        break;
    }
    isSelect = isSelected + isSelected1 + isSelected2 + isSelected3 + isSelected4 + isSelected5 + isSelected6;
    notifyListeners();
   
  }
}
