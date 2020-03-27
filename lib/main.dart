import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/Test.dart';
import 'package:test_giasu/ui/UI_Main/Account.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailRequest.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInfor.dart';
import 'package:test_giasu/ui/UI_Main/Lists_Class.dart';
import 'package:test_giasu/ui/UI_Main/Nap_Bits.dart';
import 'package:test_giasu/ui/UI_Main/Profile.dart';
import 'package:test_giasu/ui/UI_Main/Request.dart';
import 'package:test_giasu/ui/Widgets/SelectedTime.dart';
import 'provider_setup.dart' as ProviderSetup;

import 'package:test_giasu/ui/UI_Main/Filter.dart';
import 'package:test_giasu/ui/UI_Main/Payments.dart';

import 'ui/Open_App/SignIn_Page.dart';
import 'ui/Open_App/SignUp_Page.dart';
import 'ui/Open_App/Waiting_screen.dart';
import 'ui/UI_Main/BottomNavigationBar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: ProviderSetup.getProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'giasu',
        theme: ThemeData(fontFamily: 'UTM',
        ),
//      initialRoute: 'open',
//      routes: {
//        '/': (context) => MyBottomNavigationBar(
//              currentIndex: 0,
//            ),
//        'open': (context) => Waiting_screen(),
//        'signIn': (context) => SignIn_Page(),
//        'signUp': (context) => SignUpPage(),
//      },
//        home: Waiting_screen(),
        home: MyBottomNavigationBar(),
      ),
    );
  }
}
