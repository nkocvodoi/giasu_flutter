import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_giasu/core/view_model/signinModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/Open_App/ForgotPass1.dart';
import 'package:test_giasu/ui/Open_App/SignUp_Page.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/UI_Main/TutorInfor.dart';

// ignore: camel_case_types
class SignIn_Page extends StatefulWidget {
  @override
  _SignIn_PageState createState() => _SignIn_PageState();
}

// ignore: camel_case_types
class _SignIn_PageState extends State<SignIn_Page> {

//  void initState() {
//    if (Provider.of<SignInModel>(context).authenticationService.isLogined) {
//      Navigator.push(
//        context,
//        MaterialPageRoute(
//          builder: (context) => MyBottomNavigationBar(),
//        ),
//      );
//    }
//  }

  Map _loginmap = new Map();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  TextEditingController _phone_number = TextEditingController();
  TextEditingController _pass = TextEditingController();

  String validatePass(String value) {
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
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: new Text(value, textAlign: TextAlign.start),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        child: Consumer<SignInModel>(builder: (_, model, __) {
          return Form(
            key: _key,
            autovalidate: _validate,
//            onChanged: ,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: SizeConfig.safeBlockVertical * 40,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: SizeConfig.safeBlockVertical * 5,
                          ),
                          Image.asset(
                            'assets/Logo2.png',
                            cacheHeight: 90,
                            cacheWidth: 130,
                            height: 130,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 5),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.zero,
                                hintText: 'Email/ Số điện thoại',
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.grey[400],
                                  fontSize: 20,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.mail),
                                ),
                              ),
                              autofocus: false,
                              keyboardType: TextInputType.phone,
//                            maxLength: 10,
                              validator: validateMobile,
                              onSaved: (String val) {
                                _phone_number.text = val.trim();
                              }),
                          SizedBox(
                            width: double.infinity,
                            height: SizeConfig.safeBlockVertical * 2,
                          ),
                          _buildBox('Mật khẩu', true),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Đăng ký ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpPage(),
                                      ),
                                    );
                                  },
                              ),
                              TextSpan(text: '|'),
                              TextSpan(
                                text: ' Quên mật khẩu ?',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgotPass1(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 5,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Center(
                        child: RaisedButton(
                          onPressed: () async {
                            _sendToServer();
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) => MyBottomNavigationBar(
//                                  currentIndex: 0,
//                                ),
//                              ),
//                            );
                            _loginmap["phone_number"] = _phone_number.text;
                            _loginmap["password"] = _pass.text;
                            var loginSuccess1 = await model.login1(_loginmap);
//                            var loginSuccess1 = model.authenticationService.isLogined;
//                            print(loginSuccess1);
//                            var a = await model.authenticationService.id;
//                            print(a);
                            if (loginSuccess1) {
                              print(loginSuccess1);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyBottomNavigationBar(),
                                ),
                              );
                            } else {
                              var _message = await model.Infor;
                              showInSnackBar(_message);
                            }
                          },
                          color: Colors.orange[300],
                          child: new Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Đăng Nhập',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    ),
//                        InkWell(
//                          child: Center(
//                            child: Container(
//                              width: SizeConfig.safeBlockHorizontal * 40,
//                              height: SizeConfig.safeBlockVertical * 6,
//                              decoration: BoxDecoration(
//                                color: Colors.orange[300],
//                                borderRadius: BorderRadius.circular(6.0),
//                              ),
//                              child: Material(
//                                color: Colors.transparent,
//                                child: InkWell(
//                                  onLongPress: () async {
//                                    var loginSuccess1 = await model.login(_phone_number.text, _pass.text);
//
//                                    if (loginSuccess1) {
//                                      Navigator.pushNamed(context, RoutePaths.Home);
//                                    }
//                                    else {
//                                      Navigator.pushNamed(context, RoutePaths.SignUp);
//                                    }
////                                _sendToServer;
//
////                                Navigator.push(
////                                  context,
////                                  MaterialPageRoute(
////                                    builder: (context) => MyBottomNavigationBar(
////                                      currentIndex: 0,
////                                    ),
////                                  ),
////                                );
//                                  },
//                                  child: Center(
//                                    child: Text(
//                                      'Đăng nhập',
//                                      style: TextStyle(
//                                        color: Colors.white,
//                                        fontSize: 20,
//                                        letterSpacing: 1.0,
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Center(
                        child: Container(
                          width: SizeConfig.safeBlockHorizontal * 40,
                          height: SizeConfig.safeBlockVertical * 6,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  'Đăng nhập bằng Facebook',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    letterSpacing: 1.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: Center(
                        child: Container(
                          width: SizeConfig.safeBlockHorizontal * 40,
                          height: SizeConfig.safeBlockVertical * 6,
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Center(
                                child: Text(
                                  'Đăng nhập bằng Google +',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    letterSpacing: 1.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

//  Widget _buildBox(String _a, bool _b) {
//    return ChangeNotifierProvider<Counter>(
//      create: (_) => Counter(),
//      child: Consumer<Counter>(
//        builder: (_, counter, __) => _change_obscure(_a, counter),
//      ),
//    );
//  }

  Widget _buildBox(String _a, bool _b) {
    return Consumer<SignInModel>(builder: (_, model, __) {
      return TextFormField(
          obscureText: model.count,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: 'Mật khẩu',
              border: OutlineInputBorder(),
              hintStyle: TextStyle(
//                fontFamily: 'HI',
                color: Colors.grey[400],
                fontSize: 20,
              ),
              suffixIcon: IconButton(
                icon: model.count
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: () {
                  model.change();
//                  print(model.Count);
//                model.Count = !model.Count;
//                print(model.Count);
                },
              )),
          keyboardType: TextInputType.visiblePassword,
//                            maxLength: 10,
          validator: validatePass,
          onSaved: (String val) {
            _pass.text = val.trim();
          });
    });
  }
}
