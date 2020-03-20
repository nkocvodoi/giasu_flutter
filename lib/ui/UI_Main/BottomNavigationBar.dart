import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/bottombarModel.dart';
import 'package:test_giasu/ui/UI_Main/Account.dart';
import 'package:test_giasu/ui/UI_Main/Anouncement.dart';
import 'package:test_giasu/ui/UI_Main/Bits_Manager.dart';
import 'package:test_giasu/ui/UI_Main/Lists_Class.dart';

class MyBottomNavigationBar extends StatefulWidget {
//  var currentIndex;
//  MyBottomNavigationBar({Key key, this.currentIndex}) : super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarState();
  }
}

class _BottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
//  var currentIndex;
//  _BottomNavigationBarState({this.currentIndex});
  final List<Widget> _children = [
    Lists_Class(),
    Lists_Class(),
    Bits_Manager(),
    Anouncement(),
    Account(),
  ];
//  void _onTappedBar(int index) {
//    setState(() {
//      currentIndex = index;
//    });
//  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<BottomBarModel>(
        builder:(_ ,model, __) {
          return Scaffold(
              body: _children[model.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (int val) {
                  model.setCurrentIndex(val);
                },
                currentIndex: model.currentIndex,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      size: 45.0,
                    ),
                    title: Text(
                      'Trang chủ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.view_list,
                      size: 45.0,
                    ),
                    title: Text(
                      'Lớp mới',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.credit_card,
                      size: 45.0,
                    ),
                    title: Text(
                      'Thanh toán',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.mail,
                      size: 45.0,
                    ),
                    title: Text(
                      'Hộp thư',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 45.0,
                    ),
                    title: Text(
                      'Tài khoản',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ],
              ));
        }
    );
  }
}
