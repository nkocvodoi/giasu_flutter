import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

  class AutheticationService extends ChangeNotifier {

    AutheticationService() {
      reload();
    }

  var _currentUser;
  String _token;

  get currentUser {
    return _currentUser;
  }
  void setCurrentUser(var currentUser) {
    if(currentUser != _currentUser) { // @todo: viet lai bieu thuc check
      _currentUser = currentUser;
      notifyListeners();
    }
  }
  get token {
    return _token;
  }
  void setToken (String token) {
    if(token != _token) {
      _token = token;
      notifyListeners();
    }
  }

  void reload() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String currentUser = jsonDecode(prefs.getString("currentUser"));
    setCurrentUser(currentUser);
    String token = prefs.getString("currentUser") ?? null;
    setCurrentUser(token);
//    await prefs.setInt('counter', counter);
  }

  get isLogined => _token != null ? true : false;
}