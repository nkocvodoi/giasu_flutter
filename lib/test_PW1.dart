import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:provider/provider.dart';

class TestPassWord1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _PassWord1State();
  }
}

class _PassWord1State extends State<TestPassWord1> {
  String _email_phone = 'Email/ Số điện thoại',
      _newPass = 'Mật khẩu mới',
      _newPass2 = 'Nhập lại mật khẩu mới';
  var _slidervalue = 0.0;
  final Color _color = Color.fromRGBO(47, 101, 174, 1);
  var _value = 0.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: new Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
          child: Text(
            'Quên mật khẩu',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Container(
                alignment: Alignment.center,
                height: 200,
                width: 380,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      _iconTextBox('dsjhfbhdjs', Icon(Icons.account_box), _color, 20.0),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blueAccent, width: 2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
                onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconTextBox(String _text, Icon _icon, Color _c, double _a) {
    return Container(
      child: Row(
        children: <Widget>[
          _icon,
          Text(_text,
          style: TextStyle(
            fontSize: _a,
            color: _c,
            fontWeight: FontWeight.w500,
          ),
          ),
        ],
      ),
    );
  }
}
