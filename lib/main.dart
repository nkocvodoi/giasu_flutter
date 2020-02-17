import 'package:flutter/material.dart';
import 'package:test_giasu/Open_App/Waiting_screen.dart';
import 'package:test_giasu/Students/Filter.dart';
import 'package:test_giasu/UI_Main/ClassDetail.dart';
import 'package:test_giasu/UI_Main/ClassDetail3.dart';
import 'Open_App/SignIn_Page.dart';
import 'Open_App/SignUp_Page.dart';


import 'UI_Main/BottomNavigationBar.dart';
import 'UI_Main/ClassDetail2.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'giasu',
     //home: MyBottomNavigationBar(currentIndex: 0,),
      home: Filter(),
    );
  }
}
