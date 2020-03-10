import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/signupModel.dart';
import 'package:url_launcher/url_launcher.dart';

import 'PersonInfor.dart';
import 'SignIn_Page.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SignUpPage();
  }
}

class _SignUpPage extends State<SignUpPage> {
  final Color _c = Colors.blue[800];

  final TextEditingController _email = new TextEditingController();
  final TextEditingController _name = new TextEditingController();
  final TextEditingController _phone = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _password2 = new TextEditingController();

  String _name_hint = 'Họ và Tên *',
      _email_hint = 'Email * ',
      _phone_hint = 'Số điện thoại *',
      _password_hint = 'Mật khẩu *',
      _password2_hint = 'Xác nhận mật khẩu *';

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String validatePass(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    } else if (!regExp.hasMatch(value)) {
      return "Email không đúng định dạng";
    } else {
      return null;
    }
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
//      print("Name $name");
//      print("Mobile $mobile");
//      print("Email $email");
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
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
      body: new SingleChildScrollView(
        //physics: const NeverScrollableScrollPhysics(),
        child: Form(
          key: _key,
          autovalidate: _validate,
          child: Container(
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
                      style:
                          TextStyle(fontSize: 18.0, color: Colors.deepOrange),
                    ),
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      _TextFieldsName(_name_hint),
                      _TextFieldsPhone(_phone_hint),
                      _TextFieldsEmail(_email_hint),
                      _TextFieldsPass(_password_hint),
                      _TextFieldsPass(_password2_hint),
                      new Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          '*Mật khẩu bắt buộc từ 6 -32 ký tự (bao gồm chữ và số)',
                          style: TextStyle(
                              fontSize: 14.5, fontStyle: FontStyle.italic),
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
                                        print('Log1');
                                        launch(
                                            'https://htcon.vn/quy-dinh-chung/');
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
                                        launch(
                                            'https://htcon.vn/chinh-sach-bao-mat-thong-tin/');
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
                              _sendToServer;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PersonInfor(),
                                  ));
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
        ),
      ),
    );
  }

  Widget _TextFieldsName(
    String _text,
  ) {
    return new Container(
      child: new TextFormField(
          //controller: _emailFilter,
          autofocus: true,
          style: TextStyle(fontSize: 25.0),
          decoration: new InputDecoration(
              labelStyle: TextStyle(fontSize: 25.0), labelText: _text),
          keyboardType: TextInputType.text,
//                            maxLength: 10,
          validator: validateName,
          onSaved: (String val) {
            _name.text = val;
          }),
    );
  }

  Widget _TextFieldsEmail(String _text) {
    return new Container(
      child: new TextFormField(
          //controller: _emailFilter,
          autofocus: true,
          style: TextStyle(fontSize: 25.0),
          decoration: new InputDecoration(
              labelStyle: TextStyle(fontSize: 25.0), labelText: _text),
          keyboardType: TextInputType.emailAddress,
//                            maxLength: 10,
          validator: validateEmail,
          onSaved: (String val) {
            _email.text = val;
          }),
    );
  }

  Widget _TextFieldsPhone(String _text) {
    return new Container(
      child: new TextFormField(
          //controller: _emailFilter,
          autofocus: true,
          style: TextStyle(fontSize: 25.0),
          decoration: new InputDecoration(
              labelStyle: TextStyle(fontSize: 25.0), labelText: _text),
          keyboardType: TextInputType.phone,
//                            maxLength: 10,
          validator: validateMobile,
          onSaved: (String val) {
            _phone.text = val;
          }),
    );
  }

  Widget _TextFieldsPass(
    String _text,
  ) {
    return new Container(
      child: new TextFormField(
          //controller: _emailFilter,
          autofocus: true,
          obscureText: true,
          style: TextStyle(fontSize: 25.0),
          decoration: new InputDecoration(
              labelStyle: TextStyle(fontSize: 25.0), labelText: _text),
          keyboardType: TextInputType.visiblePassword,
//                            maxLength: 10,
          validator: validatePass,
          onSaved: (String val) {
            _password.text = val;
          }),
    );
  }
}
