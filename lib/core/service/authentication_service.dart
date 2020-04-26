import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_giasu/core/model/List_TeacherDetail.dart';
import 'package:test_giasu/core/model/currentUser.dart';

class AuthenticationService extends ChangeNotifier {
  SharedPreferences _prefs;
  CurrentUser _currentUser;
  Detail_teacher _user;
  int _id;
  String _token;
  String _notification;
  AuthenticationService() {
    reload();
  }

  Future<bool> _setString(String key, String val) async {
    return await _prefs.setString(key, val);
  }

  String _getString(String key) {
    return _prefs.getString(key);
  }
  Future<bool> _setInt(String key, int val) async {
    return await _prefs.setInt(key, val);
  }

  int _getInt(String key) {
    return _prefs.getInt(key);
  }



  CurrentUser get currentUser {
    return _currentUser;
  }

  void setCurrentUser(CurrentUser currentUser) {

//    if (currentUser.toString() != _currentUser.toString()) {

      // @todo: viet lai bieu thuc check
      _currentUser = currentUser;
//      print(_currentUser.toString());
      this._setString("currentUser", _currentUser.toString());
      notifyListeners();
//    }
  }
Detail_teacher get user {
    return _user;
  }

  void setUser(Detail_teacher user) {
//    if (currentUser.props != _currentUser.props) {
//      print(currentUser.props);
      // @todo: viet lai bieu thuc check
      _user = user;
      this._setString("user", _user.toString());
      notifyListeners();
//    }
  }

  get token {
    return _token;
  }

  void setToken(String token) {
    if (token != _token) {
      _token = token;
      this._setString("token", _token);
      notifyListeners();
    }
  }
get id {
    return _id;
  }

  void setId(int id) {
    if (id != _id) {
      _id = id;
      this._setInt("id", _id);
      notifyListeners();
    }
  }
  get notification {
    return _notification;
  }

  void setNotification(String notification) {
    if (notification != _notification) {
      _notification = notification;
      this._setString("notification", _notification);
      notifyListeners();
    }
  }

  void reload() async {
    if (this._prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    var _val = this._getString("currentUser");
    if(_val != null) {
      Map<String, dynamic> mapcurrentUser =
      jsonDecode(this._getString("currentUser"));
      _currentUser = CurrentUser.fromJson(mapcurrentUser);
    }
//    var _v = this._getString("user");
//    if(_v != null) {
//      Map<String, dynamic> mapUser =
//      jsonDecode(this._getString("user"));
//      _user = Detail_teacher.fromJson(mapUser);
//    }

    _token = this._getString("token") ?? null;
    _notification = this._getString("notification") ?? null;
    _id = this._getInt("id") ?? null;

  }

  get isLogined => _token != null ? true : false;





}
