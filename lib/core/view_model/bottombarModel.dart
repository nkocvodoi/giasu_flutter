import 'package:flutter/material.dart';

class BottomBarModel extends ChangeNotifier {

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setCurrentIndex(int value) {
    if(value != _currentIndex) {
      _currentIndex = value;
    }
    notifyListeners();
  }

}