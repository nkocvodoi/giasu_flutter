import 'package:flutter/cupertino.dart';

class PaymentModel extends ChangeNotifier {
  String _value = 'Thanh toán đủ phí';
  String _infor = 'Bạn cần nạp đủ 490 Bits';
  String get v => _value;
  String get infor => _infor;

  void setValue(String val) {
    if (val != _value) {
      _value = val;
    }
    notifyListeners();
  }

  void setInfor() {
    if (_value == 'Nợ phí')
      _infor =
          'Bạn cần nạp đủ 250 Bits và được nợ lại 240 Bits tối đa 35 ngày (kể từ ngày bắt đầu nhận lớp)';
    else
      _infor = 'Bạn cần nạp đủ 490 Bits';
    notifyListeners();
  }
}
