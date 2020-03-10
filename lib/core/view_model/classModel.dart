import 'package:flutter/cupertino.dart';

class ClassModel extends ChangeNotifier {

  bool _busy = false;
  bool get busy => _busy;
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  int _total = 0;
  int get total => _total;
  void setTotal(int val) {
    if( val != _total) {
      _total = val;
    }
    notifyListeners();
  }

  int _index = 1;
  int get index => _index;
  void setIndex(int i) {
    _index = i++;
  }
}