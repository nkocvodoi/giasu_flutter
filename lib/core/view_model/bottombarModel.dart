import 'package:flutter/material.dart';

class BottomBarModel extends ChangeNotifier {

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void setSelectedIndex(int value) {
    if(value != _selectedIndex) {
      _selectedIndex = value;
    }
    notifyListeners();
  }

}