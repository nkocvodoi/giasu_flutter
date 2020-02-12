import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../Open_App/PassWord2.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SignUpPage();
  }
}

class _SignUpPage extends State<SignUpPage> {
  final Color _c = Colors.blue[800];

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _nameFilter = new TextEditingController();

  String _name = 'Họ và Tên *',
      _email = 'Email * ',
      _phone = 'Số điện thoại *',
      _password = 'Mật khẩu *',
      _password2 = 'Xác nhận mật khẩu *';

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        //leading: FlatButton.icon( icon: Icon(Icons.arrow_back_ios, textDirection: TextDirection.ltr,)),
        backgroundColor: _c,
        title: new Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
          child: Text(
            'Đăng Ký',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
          ),
        ),
        centerTitle: true,
      ),
      body: new Container(
        //child: new Padding(padding: EdgeInsets.all(30.0),
        child: new Wrap(
          children: <Widget>[
            new Container(
              color: _c,
              child: new Text(
                'Tạo tài khoản dành cho Gia sư',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              alignment: Alignment.center,
              width: double.infinity,
              height: 75,
            ),
            new Container(
              child: new Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Vui lòng điền đầy đủ thông tin vào những mục (*)',
                  style: TextStyle(fontSize: 18.0, color: Colors.deepOrange),
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  _buildTextFields(_name, false),
                  _buildTextFields(_email, false),
                  _buildTextFields(_phone, false),
                  _buildTextFields(_password, true),
                  _buildTextFields(_password2, true),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      '*Mật khẩu bắt buộc từ 6 -32 ký tự (bao gồm chữ và số)',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(bottom: 22.0),
                        child: new Icon(
                          Icons.brightness_1,
                          color: _c,
                          size: 18,
                        ),
                      ),
                      new Expanded(
                        child: new RichText(
                          text: TextSpan(
                            text: ' Đồng ý với ',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.indigo,
                                fontSize: 18.0),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'điều khoản',
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                   
                                  },
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.underline,
                                  decorationColor: _c,
                                ),
                              ),
                              TextSpan(text: ' & '),
                              TextSpan(
                                text: 'chính sách',
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Log');
                                  },
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.underline,
                                  decorationColor: _c,
                                ),
                              ),
                              TextSpan(text: ' sử dụng của HTcon'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PassWord2(),
                            ),
                          );
                        },
                        color: _c,
                        child: new Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Đăng Ký',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        //),
      ),
    );
  }

  Widget _buildTextFields(String _text, bool _a) {
    return new Container(
      child: new TextField(
        //controller: _emailFilter,
        decoration: new InputDecoration(
            labelStyle: TextStyle(fontSize: 25.0), labelText: _text),
        obscureText: _a,
      ),
    );
  }
}
