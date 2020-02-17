import 'package:flutter/material.dart';


import 'dart:async';
import 'dart:core';

import '../SignIn_Page.dart';

class Waiting_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Waiting_screenState();
  }
}

class Waiting_screenState extends State<Waiting_screen>{
  Timer _timer;
  Waiting_screenState(){
  _timer = new Timer(Duration(seconds: 3), (){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => MyApp(),
    ),
    );
  });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Stack(
        children: <Widget>[
          new Positioned(
            left: 60,
            width: 300,
            height: 500,
            child: new Image.asset('lib/assets/Logo2.png'),
          ),
          new Positioned(
            bottom: 200.0,
            left: 15.0,
            child: new Text(
              'Nền tảng kết nối gia sư, lớp hoc, khóa hoc',
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            },
          ),
          
        ],
      ),
    );
  }
}
