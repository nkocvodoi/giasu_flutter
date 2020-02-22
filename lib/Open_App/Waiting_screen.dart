import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:async';
import 'dart:core';

import 'SignIn_Page.dart';

class Waiting_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Waiting_screenState();
  }
}

class Waiting_screenState extends State<Waiting_screen> {
  Timer _timer;
  void _waitMe() {
    _timer = new Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignIn_Page(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _waitMe();
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Container(
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 200),
                new Image.asset(
                  'assets/Logo2.png',
                  height: ScreenUtil.getInstance().setHeight(200),
                ),
                SizedBox(height: 40),
                Text(
                  'Nền tảng kết nối gia sư, lớp hoc, khóa hoc',
                
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignIn_Page(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
