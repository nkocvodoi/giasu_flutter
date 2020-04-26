import 'package:flutter/cupertino.dart';
import 'package:test_giasu/core/service/authentication_service.dart';

class Support_SettingModel extends ChangeNotifier {

  final AuthenticationService authenticationService;

  Support_SettingModel({this.authenticationService});

//  bool _count = (authenticationService.notification == 'notify_on')? true : false;
  bool _count = true;
      bool get count => _count;
  void setCount(bool val) {
    if (val != _count) {
      _count = val;
      notifyListeners();
    }
  }

//  String _notifi = (authenticationService.notification == 'notify_on')? 'Nhận' : 'Tắt';
  String _notifi = 'Nhận';
  String get notifi => _notifi;
  void setNotifi () {
    if (_count) _notifi ='Nhận';
    else _notifi = 'Tắt';
    notifyListeners();
  }


}