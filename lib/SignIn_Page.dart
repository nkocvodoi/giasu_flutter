import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Open_App/PassWord1.dart';
import 'dart:ui';

import 'package:test_giasu/Open_App/SignUp_Page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool _isHidden = true;
  // void _toggleVisibility() {
  //   setState(() {
  //     _isHidden = !_isHidden;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    print(window.physicalSize.toString());
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 90,
                      ),
                      Image.asset(
                        'lib/assets/Logo2.png',
                        cacheHeight: 90,
                        cacheWidth: 130,
                        height: ScreenUtil.getInstance().setHeight(200),
                      ),
                    ],
                  )),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 250.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    // child: Padding(
                    //   padding:
                    //       EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
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
                                fontSize: ScreenUtil().setSp(30),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.mail),
                              )),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: ScreenUtil.getInstance().setHeight(60),
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
                            fontSize: ScreenUtil().setSp(25),
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
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  InkWell(
                    child: Center(
                      child: Container(
                        width: ScreenUtil.getInstance().setWidth(300),
                        height: ScreenUtil.getInstance().setHeight(80),
                        decoration: BoxDecoration(
                          color: Colors.orange[300],
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'Đăng nhập',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil().setSp(25),
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
                        width: ScreenUtil.getInstance().setWidth(300),
                        height: ScreenUtil.getInstance().setHeight(80),
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
                                  fontSize:ScreenUtil().setSp(20),
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
                        width: ScreenUtil.getInstance().setWidth(300),
                        height: ScreenUtil.getInstance().setHeight(80),
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
                                  fontSize: ScreenUtil().setSp(20),
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
          ),
          ),
        ],
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
                fontSize: ScreenUtil().setSp(30),
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
