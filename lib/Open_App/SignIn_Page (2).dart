import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'PassWord1.dart';
import 'PassWord2.dart';
import 'SignUp_Page.dart';

class SignIn_Page extends StatefulWidget {
  @override
  _SignIn_PageState createState() => _SignIn_PageState();
}

class _SignIn_PageState extends State<SignIn_Page> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
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
                        'assets/Logo_HTcon_ok-01-6-1.png',
                        cacheHeight: 90,
                        cacheWidth: 130,
                        height: 90,
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
                          autofocus: true,
                          style: TextStyle(fontSize: 25.0),
                          decoration: InputDecoration(
                              hintText: 'Email/ Số điện thoại',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Colors.grey[600],
                                fontSize: 20.0,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.mail),
                              )),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(60),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              hintText: 'Mật khẩu',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Colors.grey[600],
                                fontSize: 20.0,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                              )),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                            fontSize: 20.0,
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PassWord1()),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Đăng nhập',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
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
                                  fontSize: 11,
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
                                  fontSize: 12,
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
}
