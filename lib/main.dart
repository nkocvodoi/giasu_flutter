import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/ui/Open_App/ForgotPass1.dart';
import 'package:test_giasu/ui/Open_App/PersonInfor.dart';
import 'package:test_giasu/ui/Open_App/SignUp_PageTutor.dart';
import 'package:test_giasu/ui/Open_App/SpecialtyInfor.dart';
import 'package:test_giasu/ui/Open_App/SubjectChoice.dart';
import 'package:test_giasu/ui/Open_App/SubjectChoiceDetails.dart';
import 'package:test_giasu/ui/Students/Filter_S.dart';
import 'package:test_giasu/ui/Students/PostRequest.dart';
import 'package:test_giasu/ui/UI_Main/Anouncement.dart';
import 'package:test_giasu/ui/UI_Main/Bits_Manager.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailRequest.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailRequestDemo.dart';
import 'package:test_giasu/ui/UI_Main/Lists_Class.dart';
import 'package:test_giasu/ui/UI_Main/Nap_Bits.dart';
import 'package:test_giasu/ui/UI_Main/Profile.dart';
import 'package:test_giasu/ui/UI_Main/Request.dart';
import 'package:test_giasu/ui/UI_Main/Support_Settings.dart';
import 'package:test_giasu/ui/Widgets/SelectedTime.dart';
import 'TestList_Class.dart';
import 'provider_setup.dart' as ProviderSetup;

import 'package:test_giasu/ui/UI_Main/Filter.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

import 'ui/Open_App/SignIn_Page.dart';
import 'ui/Open_App/SignUp_Page.dart';
import 'ui/Open_App/Waiting_screen.dart';
import 'ui/UI_Main/BottomNavigationBar.dart';
import 'core/view_model/sendDataExample.dart';
void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //   .then((_){
  runApp(MyApp());
  // });
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: ProviderSetup.getProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HTcon',
        theme: ThemeData(fontFamily: 'UTM'),
        
      initialRoute: '/personal',
     routes: {
       '/': (context) => Waiting_screen(),   
       '/subject': (context) => SubjectChoice(), 
       '/personal': (context) => PersonInfor(),                   
       '/open': (context) => Waiting_screen(),
       '/signIn': (context) => SignIn_Page(),
       '/signUp': (context) => SignUpPage(),
       '/specialty': (context) => SpecialtyInfor(),
       '/subject': (context) => SubjectChoice(),
       '/home': (context) => MyBottomNavigationBar(),
     },

        //home: PersonInfor(),
      ),
    );
  }
}
