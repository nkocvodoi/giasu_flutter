import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/model/List_TeacherDetail.dart';
import 'package:test_giasu/core/model/user.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'package:http/http.dart' as http;


class ProfileModel extends ChangeNotifier {

  final AuthenticationService authenticationService;

  ProfileModel({this.authenticationService});


//  Future<Detail_teacher> _profile;
//  Future<Detail_teacher> get profile => _profile;
//  void setProfile(){
//    _profile = fetchProfile();
//    notifyListeners();
//
//  }


  Future<DataUser> fetchProfile() async {
//    print('log' + authenticationService.id);
    final response =
    await http.get('https://giasu.htcon.vn/api/v1/users/${authenticationService.id}',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${authenticationService.token}',
        }
    );

    Map<String, dynamic> mapResponse = json.decode(response.body);
//    print(mapResponse.toString());
    if (response.statusCode == 200) {
//    Map<String, dynamic> mapResponse = json.decode(response.body);
      if (mapResponse["code"] == 1) {
        return DataUser.fromJson(mapResponse["data"]);
      }
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load ');
    }
  }
//  void initState(){
//    _userdata = fetchUserData();
//  }



}