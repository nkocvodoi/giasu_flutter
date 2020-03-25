import 'package:flutter/material.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

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
    return Container(
      alignment: Alignment.center,
      color: colorApp,
      child: Stack(
        children: <Widget>[
          Column(
        children: <Widget>[
          Expanded(child: SizedBox(),flex: 2,),
          Image.asset(
            'assets/logo3.png',
            cacheHeight: 100,
          ),
          SizedBox(height: 100),
          Text(
            'Nền tảng kết nối gia sư, lớp học, khóa học',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontFamily: "UTM",
                fontStyle: FontStyle.normal,
                fontSize: 15,
            ),
          ),
          Expanded(child: SizedBox(),flex: 2,),
        ],

      ),
        ],
      )

//          GestureDetector(
//            onTap: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => SignIn_Page(),
//                ),
//              );
//            },
//          ),
    );
  }
}
