import 'package:flutter/material.dart';
import 'Open_App/SignIn_Page.dart';
import 'Open_App/SignUp_Page.dart';


import 'UI_Main/BottomNavigationBar.dart';
import 'test_PW1.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'giasu',
      home: BottomNavigationBar(currentIndex: 0,),
    );
  }
}
