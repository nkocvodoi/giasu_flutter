import 'package:flutter/cupertino.dart';

class Support_SettingModel extends ChangeNotifier {

  bool _count = true;
  bool get count => _count;
  void setCount(bool val) {
    if (val != _count) {
      _count = val;
      notifyListeners();
    }
  }

  String _notifi = 'Nhận';
  String get notifi => _notifi;
  void setNotifi () {
    if (_count) _notifi ='Nhận';
    else _notifi = 'Tắt';
    notifyListeners();
  }


}