import 'package:flutter/material.dart';
import 'package:test_giasu/ui/UI_Main/Account.dart';
import 'package:test_giasu/ui/UI_Main/Anouncement.dart';
import 'package:test_giasu/ui/UI_Main/Bits_Manager.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/UI_Main/Lists_Class.dart';

class MyBottomNavigationBar extends StatefulWidget {
  var currentIndex;
  MyBottomNavigationBar({Key key, this.currentIndex}) : super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarState(currentIndex: currentIndex);
  }
}

class _BottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  var currentIndex;
  _BottomNavigationBarState({this.currentIndex});
  final List<Widget> _children = [
    Lists_Class(),
    Lists_Class(),
    Bits_Manager(),
    Anouncement(),
    Account(),
  ];
  void _onTappedBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      
        body: _children[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: activateColor,
          unselectedItemColor: deactivateColor,
          type: BottomNavigationBarType.fixed,
          onTap: _onTappedBar,
          currentIndex: currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              title: Text(
                'Trang chủ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.view_list,
                size: 30,
              ),
              title: Text(
                'Lớp mới',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.credit_card,
                size: 30,
              ),
              title: Text(
                'Thanh toán',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
                size: 30,
              ),
              title: Text(
                'Hộp thư',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              title: Text(
                'Tài khoản',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ));
  }
}
