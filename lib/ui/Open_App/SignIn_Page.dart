import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/view_model/signinModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/Open_App/SignUp_PageStudent.dart';
import 'package:test_giasu/ui/Open_App/SignUp_PageTutor.dart';
import 'package:test_giasu/ui/Students/PostRequest.dart';
import 'package:test_giasu/ui/UI_Main/Account.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBarStudent.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailRequest.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailRequestDemo.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

import '../../route.dart';
import 'ForgotPass1.dart';
import 'SignUp_Page.dart';

// ignore: camel_case_types
class SignIn_Page extends StatefulWidget {
  @override
  _SignIn_PageState createState() => _SignIn_PageState();
}

// ignore: camel_case_types
class _SignIn_PageState extends State<SignIn_Page> {
  // bool _isHidden = true;
  // void _toggleVisibility() {
  //   setState(() {
  //     _isHidden = !_isHidden;
  //   });
  // }

  Future<CLassData> list_class;
//  Api _api;
  @override
  void initState() {
    super.initState();
    list_class = fetchClassData();
  }

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  TextEditingController _phone_number = TextEditingController();
  TextEditingController _pass = TextEditingController();

  String validatePass(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
//      print("Name $name");
//      print("Mobile $mobile");
//      print("Email $email");
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(
        child: Consumer<SignInModel>(builder: (_, model, __) {
          return Form(
            key: _key,
            autovalidate: _validate,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: SizeConfig.safeBlockVertical * 35,
                      decoration: BoxDecoration(
                        color: colorApp,
                      ),
                      child: Image.asset(
                        'assets/logo3.png',
                        cacheHeight: 90,
                      ),
                    ),
                    SizedBox(height: SizeConfig.safeBlockVertical * 2),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            
                              controller: _controller,
                              
                              decoration: InputDecoration(
                                hintText: 'Email/ Số điện thoại',
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.only(left: 5),
                                hintStyle: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.grey[400],
                                  fontSize: 15,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.mail),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
//                            maxLength: 10,
                              validator: validateMobile,
                              onSaved: (String val) {
                                _phone_number.text = val;
                              }),
                          SizedBox(
                            width: double.infinity,
                            height: SizeConfig.safeBlockVertical * 2,
                          ),
                          _buildBox('Mật khẩu', true),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
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
                              // TextSpan(
                              //   text: ' Đăng ký cho người dùng ',
                              //   recognizer: TapGestureRecognizer()
                              //     ..onTap = () {
                              //       Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) =>
                              //               SignUpPageStudent(),
                              //         ),
                              //       );
                              //     },
                              // ),
                              // TextSpan(text: '|'),
                              TextSpan(
                                text: ' Quên mật khẩu?  ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgotPass1(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RaisedButton(
                      // onPressed: () {
                      //   if (_controller.text == '0123456789') {
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (context) => MyBottomNavigationBarStudent(0, 'name', 'status', 'id', 'subject', 'grade', 'form_teaching', 'lesson_per_week', 'time_per_lesson', 'student_per_class', 'address', 'tuition_fee', 'class_fee', 'about_course')));
                      //   } else if (_controller.text == '0123456788') {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 ClassDetailRequestDemo()));
                      //   }
                          onPressed: () async {
                            _sendToServer();
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) => MyBottomNavigationBar(
//                                  currentIndex: 0,
//                                ),
//                              ),
//                            );

                            print(_phone_number.text);
                            var loginSuccess1 = await model.login1(
                                _phone_number.text, _pass.text);

                            print(loginSuccess1);
                            if (loginSuccess1) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ClassDetailRequestDemo()
                                ),
                              );}
                        //  else {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MyBottomNavigationBarStudent(0, 'name', 'status', 'id', 'subject', 'grade', 'form_teaching', 'lesson_per_week', 'time_per_lesson', 'student_per_class', 'address', 'tuition_fee', 'class_fee', 'about_course')),
                        //   );
                        //}
                      },
                      color: orange,
                      child: Container(
                       width: SizeConfig.safeBlockHorizontal* 40,
                        height: SizeConfig.safeBlockHorizontal* 10,
                        child: Center(
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(
                                fontSize: SizeConfig.safeBlockVertical* 3,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),

//                        InkWell(
//                          child: Center(
//                            child: Container(
//                              width: SizeConfig.safeBlockHorizontal * 40,
//                              height: SizeConfig.safeBlockVertical * 6,
//                              decoration: BoxDecoration(
//                                color: Colors.orange[300],
//                                borderRadius: BorderRadius.circular(6.0),
//                              ),
//                              child: Material(
//                                color: Colors.transparent,
//                                child: InkWell(
//                                  onLongPress: () async {
//                                    var loginSuccess1 = await model.login(_phone_number.text, _pass.text);
//
//                                    if (loginSuccess1) {
//                                      Navigator.pushNamed(context, RoutePaths.Home);
//                                    }
//                                    else {
//                                      Navigator.pushNamed(context, RoutePaths.SignUp);
//                                    }
////                                _sendToServer;
//
////                                Navigator.push(
////                                  context,
////                                  MaterialPageRoute(
////                                    builder: (context) => MyBottomNavigationBar(
////                                      currentIndex: 0,
////                                    ),
////                                  ),
////                                );
//                                  },
//                                  child: Center(
//                                    child: Text(
//                                      'Đăng nhập',
//                                      style: TextStyle(
//                                        color: Colors.white,
//                                        fontSize: 20,
//                                        letterSpacing: 1.0,
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
                    SizedBox(
                      height: 7,
                    ),
                    RaisedButton(
                      
                      color: blue,
                      onPressed: () {},
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal* 40,
                        height: SizeConfig.safeBlockHorizontal*10,
                        child: Center(
                            child: Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/facebook_logo.png',
                              cacheHeight: 20,
                            ),
                            Text(
                              '  Đăng nhập bằng Facebook',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal* 2.7,
                               
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),),
                    ),

                    SizedBox(
                      height: 7,
                    ),
                    RaisedButton(
                      color: red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),),
                      onPressed: () {},
                      child: Container(
                        width: SizeConfig.safeBlockHorizontal* 40,
                        height: SizeConfig.safeBlockHorizontal *10,
                        child: Center(
                          child: Row(children: <Widget>[
                            Image.asset('assets/google_logo.png',cacheHeight: 20,),
                             Text(
                            '  Đăng nhập bằng Google+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.safeBlockHorizontal* 2.7,
                            
                            ),
                            textAlign: TextAlign.center,
                          ),
                          ],)
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

//  Widget _buildBox(String _a, bool _b) {
//    return ChangeNotifierProvider<Counter>(
//      create: (_) => Counter(),
//      child: Consumer<Counter>(
//        builder: (_, counter, __) => _change_obscure(_a, counter),
//      ),
//    );
//  }

  Widget _buildBox(String _a, bool _b) {
    return Consumer<SignInModel>(builder: (_, model, __) {
      return TextFormField(
          obscureText: model.count,
          decoration: InputDecoration(
              hintText: 'Mật khẩu',
              contentPadding: EdgeInsets.only(left: 5),
              border: OutlineInputBorder(),
              hintStyle: TextStyle(
                fontStyle: FontStyle.normal,
                color: Colors.grey[400],
                fontSize: 15,
              ),
              suffixIcon: IconButton(
                icon: model.count
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: () {
                  model.change();
                },
              )),
          keyboardType: TextInputType.visiblePassword,
//                            maxLength: 10,
          validator: validatePass,
          onSaved: (String val) {
            _pass.text = val;
          });
    });
  }
}
