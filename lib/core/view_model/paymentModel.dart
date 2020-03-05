import 'package:flutter/cupertino.dart';

class PaymentModel extends ChangeNotifier {

//  bool _busy = false;
//  bool get busy => _busy;
//  void setBusy(bool value) {
//    _busy = value;
//    notifyListeners();
//  }

String _value;
String get v => _value;
void setValue(String val) {
    _value = val;
    notifyListeners();
}

}