import 'package:flutter/material.dart';

class NapBitsModel extends ChangeNotifier {
  int _group1 = 0;
  int get group1 => _group1;
  void setGroup1(int val) {
    if(val != _group1) {
      _group1 = val;
      notifyListeners();
    }
  }
  int _group2 = 0;
  int get group2 => _group2;
  void setGroup2(int val) {
    if(val != _group2) {
      _group2 = val;
      notifyListeners();
    }
  }

}