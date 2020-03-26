import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/currentUser.dart';
import 'package:test_giasu/core/view_model/bitsmanagerModel.dart';
import 'package:test_giasu/ui/UI_Main/Account.dart';
import 'package:test_giasu/ui/UI_Main/Nap_Bits.dart';
import 'BottomNavigationBar.dart';
import 'General_Infor.dart';

class Bits_Manager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Bits_Manager_State();
  }
}

class _Bits_Manager_State extends State<Bits_Manager> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorApp,
        centerTitle: true,
        title: Text(
            'Quản lý Bits',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
//            textAlign: TextAlign.center,
        ),
      ),
//      bottomNavigationBar: MyBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Consumer<BitsManagerModel>(
            builder: (_ ,model, __) {
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: colorApp,
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      _Infor_Box('Bits khả dụng',model.authenticationService.currentUser.available_coin.toString()),
                      SizedBox(
                        height: 7,
                      ),
                      _Infor_Box('Bits nợ', model.authenticationService.currentUser.debt.toString()),
                      SizedBox(
                        height: 7,
                      ),
                      _Infor_Box('Bits chờ rút', model.authenticationService.currentUser.booking.toString()),
                      SizedBox(
                        height: 7,
                      ),
                      _infor_text(),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(7),
                        width: 310,
                        height: 35,
                        color: colorApp,
                        child: Text(
                          'LỊCH SỬ GIAO DỊCH BITS',
                          style: TextStyle(color: Colors.white, fontSize: 22.0),
                        ),
                      ),
                      _textField('Chọn giao dịch'),
                      _textField('Ngày giao dịch'),
                      _textField('Trạng thái'),
                      _button(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10.0,
                    child: Row(
                      children: <Widget>[
                        _header_box(
                            Icon(
                              Icons.account_box,
                              size: 40.0,
                            ),
                            'Nạp Bits',
                            1),
                        SizedBox(
                          width: 15.0,
                        ),
                        _header_box(
                            Icon(
                              Icons.account_box,
                              size: 40.0,
                            ),
                            'Chuyển Bits',
                            2),
                        SizedBox(
                          width: 15.0,
                        ),
                        _header_box(
                            Icon(
                              Icons.account_box,
                              size: 40.0,
                            ),
                            'Rút Bits',
                            3),
                      ],
                    ),
                    //child: _header_box(Icon(Icons.account_box, size: 40.0,), 'Nạp Bits')
                  ),
                ],
              );
            }
        ),
      ),
    );
  }

  Widget _Infor_Box(String _s, String _a) {
    return Container(
      height: 45.0,
      width: 310,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                _s,
                style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Text(
              _a,
              style: TextStyle(
                  fontSize: 23.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: colorApp),
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }

  Widget _textField(String _text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _text,
          style: TextStyle(
              fontSize: 23.0, color: Colors.grey, fontWeight: FontWeight.w400),
        ),
        Container(
          margin: EdgeInsets.only(top: 7.0, bottom: 7),
          height: 45.0,
          width: 310,
          child: TextField(
            style: TextStyle(fontSize: 23.0, height: 0.7),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              hintStyle: TextStyle(fontSize: 23.0),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: colorApp),
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ],
    );
  }

  Widget _infor_text() {
    return Container(
      width: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            Infor_Bits_Manager,
            style: TextStyle(color: Colors.grey[700], fontSize: 18.0),
          ),
          RichText(
            text: TextSpan(
              text: 'Xem hướng dẫn,',
              style: TextStyle(color: Colors.grey[700], fontSize: 18.0),
              children: <TextSpan>[
                TextSpan(
                  text: ' tại đây!',
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      print('Log1');
                    },
                  style: TextStyle(
                    color: colorApp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _button() {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {},
        color: colorApp,
        child: new Padding(
          padding:
              EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0, top: 10.0),
          child: Text(
            'Tìm kiếm',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }

  Widget _header_box(
    Icon _icon,
    String _s,
    var _a,
  ) {
    return Container(
      //alignment: Alignment.center,
      height: 100,
      width: 110,
      child: RaisedButton(
        padding: EdgeInsets.all(0.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                print(_a);
            switch (_a) {
              case 1:
                {
                  return Nap_Bits();
                }
                break;
              default:
                {
                  return MyBottomNavigationBar();
                }
                break;
            }
              },
            ),
          );
        },
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _icon,
            SizedBox(
              height: 20.0,
            ),
            Text(
              _s,
              style: TextStyle(
                  fontSize: 20.0, color: colorApp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
