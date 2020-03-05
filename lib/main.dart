import 'package:flutter/material.dart';
import 'package:test_giasu/Open_App/SpecialtyInfor.dart';
import 'package:test_giasu/UI_Main/Anouncement.dart';

import 'package:test_giasu/UI_Main/ClassDetail4.dart';
import 'package:test_giasu/UI_Main/Lists_Class.dart';
import 'package:test_giasu/UI_Main/Request.dart';
import 'Open_App/PersonInfor.dart';
import 'package:test_giasu/Open_App/Waiting_screen.dart';
import 'package:test_giasu/Students/Filter_S.dart';
import 'package:test_giasu/UI_Main/ClassDetail.dart';
import 'package:test_giasu/UI_Main/ClassDetailWithMoreTutorInfor.dart';
import 'package:test_giasu/UI_Main/Filter.dart';
import 'Open_App/SignIn_Page.dart';
import 'Open_App/SignUp_Page.dart';

import 'Open_App/Waiting_screen.dart';
import 'Students/PostRequest.dart';
import 'UI_Main/BottomNavigationBar.dart';
import 'UI_Main/ClassDetailRequest.dart';
import 'UI_Main/Filter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'giasu',
  
      home: Lists_Class(),
    );
  }
}
