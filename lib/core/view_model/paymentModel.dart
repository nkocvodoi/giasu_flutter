import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:test_giasu/core/service/authentication_service.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class PaymentModel extends ChangeNotifier {

  final AuthenticationService authenticationService;

  PaymentModel({this.authenticationService});

  String _value = 'Thanh toán đủ phí';
  String _message ;
  String _method = 'Tài khoản coin';
  String _mess_thanhtoan;

  String get v => _value;
  String get message => _message;
  String get method => _method;
  String get mess_thanhtoan => _mess_thanhtoan;

  void setValue(String val) {
    if (val != _value) {
      _value = val;
    }
    setMethod(_value);
    notifyListeners();
  }
  void setMess_thanhtoan(int _phinhanlop, int _nophi) {
    if (_value == 'Nợ phí')
      _mess_thanhtoan =
      'Bạn cần nạp đủ ${_phinhanlop-_nophi} Bits và được nợ lại ${_nophi} Bits tối đa 35 ngày (kể từ ngày bắt đầu nhận lớp)';
    else
      _mess_thanhtoan = 'Bạn cần nạp đủ ${_phinhanlop} Bits';
    notifyListeners();
  }

  void setmessage(String _s) {
    _message = _s;
    notifyListeners();
  }
  void setMethod(String _s){
    if (_s == 'Nợ phí')
      _method = _s;
    else
      _method = 'Tài khoản coin';
//    notifyListeners();
  }

  Future<int> thanhtoan(int _course_id, int _phi_nhanlop) async {
    var data = {
      "data": {
        "course_id": _course_id,
        "tutor_id": authenticationService.id
      },
      "course": {
        "tuition_fee": _phi_nhanlop,
        "method": _method
      }
    };
    try {
      var res = await http.post(APIUrl +'api/v1/tutors/accept_invites',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authenticationService.token}',

        },
        body: json.encode(data),
      );

      if (res.statusCode == 200) //return res.body;
          {
        Map<String, dynamic> mapResponse = json.decode(res.body);

//        print(mapResponse['message']+ 'dsdd');
//        _message = mapResponse['message'];
//        print(_message);
        setmessage(mapResponse['message']);
      return mapResponse['code'];
      }
    } catch (e) {
      print('error ' + e.toString());
    }
  }

  int phi_nhanlop(int class_fee, int tuition_fee,int lesson_per_week ){
   int phinhanlop;
    if(class_fee != null) {
      phinhanlop = ((class_fee~/1000) + phu_phi);
   }
    else{
      phinhanlop = ((tuition_fee*lesson_per_week*4*0.35)~/1000) + phu_phi;
    }
    return phinhanlop;
  }

  int no_phi(int _phi_nhanlop){
    int _a = (_phi_nhanlop-10)~/2;
    int nophi = (_a > 350 ? _a : 350) + 10;
    return nophi;
  }
}
