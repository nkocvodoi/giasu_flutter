import 'package:flutter/cupertino.dart';

class FilterModel extends ChangeNotifier {
  FilterPageModel() {
//    init();
  }

  bool _busy = false;
  bool get busy => _busy;
  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }


}