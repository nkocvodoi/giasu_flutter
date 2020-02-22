import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_giasu/Helper/ScreenConfig.dart';
import 'package:test_giasu/UI_Main/BottomNavigationBar.dart';

import 'PassWord1.dart';
import 'SignUp_Page.dart';

// ignore: camel_case_types
class SignIn_Page extends StatefulWidget {
  @override
  _SignIn_PageState createState() => _SignIn_PageState();
}

// ignore: camel_case_types
class _SignIn_PageState extends State<SignIn_Page> {
  // bool _isHidden = true;
  // void _toggleVisibility() {
  //   setState(() {
  //     _isHidden = !_isHidden;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
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
                          height: 50,
                        ),
                        Image.asset(
                          'assets/Logo2.png',
                          cacheHeight: 90,
                          cacheWidth: 130,
                          height: 130,
                        ),
                      ],
                    ),),
                    SizedBox(height: SizeConfig.safeBlockVertical * 5),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
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
                      ),
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
                                    builder: (context) => PassWord1(),
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
                InkWell(
                  child: Center(
                    child: Container(
                      width: SizeConfig.safeBlockHorizontal * 40,
                      height: SizeConfig.safeBlockVertical * 6,
                      decoration: BoxDecoration(
                        color: Colors.orange[300],
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyBottomNavigationBar(
                                  currentIndex: 0,
                                ),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              'Đăng nhập',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                letterSpacing: 1.0,
                              ),
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
      ),
    );
  }

  Widget _buildBox(String _a, bool _b) {
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(),
      child: Consumer<Counter>(
        builder: (_, counter, __) => _change_obscure(_a, counter),
      ),
    );
  }

  Widget _change_obscure(String _a, Counter counter) {
    return TextField(
      obscureText: counter.count,
      decoration: InputDecoration(
          hintText: 'Mật khẩu',
          border: OutlineInputBorder(),
          hintStyle: TextStyle(
            fontStyle: FontStyle.normal,
            color: Colors.grey[400],
            fontSize: 20,
          ),
          suffixIcon: IconButton(
            icon: counter.count
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility),
            onPressed: () {
              counter.change();
            },
          )),
    );
  }
}

class Counter extends ChangeNotifier {
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
