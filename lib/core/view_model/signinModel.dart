import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';


class SignInModel extends ChangeNotifier{

  bool _count = true;

  bool get count => _count;
  void setCount(bool val) {
    if (val != _count) {
      _count = val;
      notifyListeners();
    }
  }
  change() {
    setCount(!_count);
  }


}