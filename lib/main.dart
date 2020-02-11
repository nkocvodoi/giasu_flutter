import 'package:flutter/material.dart';
import 'package:test_giasu/Open_App/PassWord2.dart';
import 'package:test_giasu/Open_App/Waiting_screen.dart';
import 'package:test_giasu/Open_App/PassWord1.dart';
import 'package:test_giasu/UI_Main/Account.dart';
import 'package:test_giasu/UI_Main/Bits_Manager.dart';
import 'package:test_giasu/UI_Main/Bo_Loc.dart';
import 'package:test_giasu/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/UI_Main/Invite_Friend.dart';
import 'package:test_giasu/UI_Main/Lists_Class.dart';
import 'package:test_giasu/UI_Main/Nap_Bits.dart';
import 'package:test_giasu/UI_Main/Payments.dart';
import 'package:test_giasu/UI_Main/PersonInfor.dart';
import 'package:test_giasu/UI_Main/Request.dart';
import 'package:test_giasu/UI_Main/SpecialtyInfor.dart';
import 'package:test_giasu/UI_Main/Support_Settings.dart';

import 'Open_App/SignIn_Page.dart';
import 'Open_App/SignUp_Page.dart';

import 'test_PW1.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'giasu',
      home: Nap_Bits(),
    );
  }
}
