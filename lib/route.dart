import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_giasu/ui/Open_App/SignIn_Page.dart';
import 'package:test_giasu/ui/Open_App/SignUp_Page.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBar.dart';

class RoutePaths {
  static const String Login = 'login';
  static const String Home = '/';
  static const String SignUp = 'signup';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => MyBottomNavigationBar(currentIndex: 0,));
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => SignIn_Page());
      case RoutePaths.SignUp:
//        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => SignUpPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}

class KeyValue {
  dynamic key;
  dynamic value;
  KeyValue({this.key, this.value});
}

final List<KeyValue> topic = [
  KeyValue(key: 0, value: " "),];

final List<KeyValue> form_teachings = [
  KeyValue(key: 0, value: "Gia sư Offline ( tại nhà )"),
  KeyValue(key: 1, value: "Gia sư Online ( trực tuyến )")
];
final List<KeyValue> education = [
  KeyValue(key: 0, value: "Sinh viên"),
  KeyValue(key: 1, value: "Giáo viên"),
  KeyValue(key: 2, value: "Giảng viên"),
  KeyValue(key: 3, value: "Người đi làm"),
  KeyValue(key: 4, value: "Chuyên gia"),
  KeyValue(key: 5, value: "Người nước ngoài"),
];
