import 'package:flutter/material.dart';

class SelectedTimeModel extends ChangeNotifier {
  List<bool> _count = List.filled(3, false, growable: true);

  List<bool> get count => _count;
  void setCount(bool val, int index) {
    if (val != _count[index]) {
      _count[index] = val;
      notifyListeners();
    }
  }

}