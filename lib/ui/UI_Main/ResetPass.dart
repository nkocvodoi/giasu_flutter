import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/passWordModel.dart';
import 'package:test_giasu/ui/Open_App/ForgotPass2.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

class ResetPass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ResetPassState();
  }
}

class _ResetPassState extends State<ResetPass> {
  Map _resetpass = new Map();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  TextEditingController _oldPass = TextEditingController();
  TextEditingController _newPass = TextEditingController();
  TextEditingController _newPass_confirmation = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: new Text(value, textAlign: TextAlign.start),
        duration: Duration(seconds: 1),
      ),
    );
  }

  String validatePass(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    } else if (value.length < 6) {
      return "Mật khẩu dài ít nhất 6 kí tự.";
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
      key: _scaffoldKey,
      appBar: AppBar(
        leading: buildPreviousButton(),
        backgroundColor: colorApp,
        title: Text(
          'Đổi mật khẩu',
        ),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: Consumer<PassWordModel>(
            builder: (_ ,model, __){
              return Form(
                key: _key,
                autovalidate: _validate,
                child: new Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color: colorApp,
                          ),
                        ),
                        new SizedBox(
                          height: 40.0,
                        ),
                        _buildBox('Mật khẩu mới'),
                        new SizedBox(
                          height: 20.0,
                        ),
                        _buildBoxConfirmation('Nhập lại mật khẩu mới'),
                        new SizedBox(
                          height: 20.0,
                        ),
                        new Container(
                          child: Padding(
                            padding: EdgeInsets.only(left: 60.0, right: 60.0),
                            child: Text(
                              '*Mật khẩu bắt buộc từ 6 -32 ký tự, bao gồm chữ và số',
                              style: TextStyle(
                                  fontSize: 15.0, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                            child: RaisedButton(
                              onPressed: () async {
                                _sendToServer();
                                _resetpass['old_password'] = _oldPass.text;
                                _resetpass['new_password'] = _newPass.text;


                                bool resetpassSuccess = await model.change_password(_resetpass);
                                var _message = await model.Infor;
                                showInSnackBar(_message);


                              },
                              color: Colors.blue[800],
                              child: new Padding(
                                padding: EdgeInsets.only(left: 3, right: 3),
                                child: Text(
                                  'Đổi mật khẩu',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 35.0,
                      child: new Container(
                        child: TextFormField(
//                  autofocus: true,
                            obscureText: true,
                            style: TextStyle(fontSize: 18.0),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              hintText: 'Mật khẩu cũ',
                            ),
                            keyboardType: TextInputType.visiblePassword,
//                            maxLength: 10,
                            validator: validatePass,
                            onSaved: (String val) {
                              _oldPass.text = val.trim();
                            }
                        ),
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
        ),
      ),
    );
  }

  Widget _buildBox(String _a) {
    return new Container(
      width: 300,
      child: TextFormField(
        obscureText: true,
        style: TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: _a,
        ),
          keyboardType: TextInputType.visiblePassword,
//                            maxLength: 10,
          validator: validatePass,
          onSaved: (String val) {
            _newPass.text = val.trim();
          }
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),

    );
  }
  Widget _buildBoxConfirmation(String _a,) {
    return new Container(
      width: 300,
      child: TextFormField(
          obscureText: true,
          style: TextStyle(fontSize: 18.0),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: _a,
          ),
          keyboardType: TextInputType.visiblePassword,
//                            maxLength: 10,
          validator: validatePass,
          onSaved: (String val) {
            _newPass_confirmation.text = val.trim();
          }
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),

    );
  }
}
