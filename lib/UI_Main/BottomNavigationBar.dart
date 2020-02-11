import 'package:flutter/material.dart';
import 'package:test_giasu/UI_Main/Account.dart';
import 'package:test_giasu/UI_Main/Bits_Manager.dart';
import 'package:test_giasu/UI_Main/Lists_Class.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarState();
  }
}

class _BottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  int _currentIndex = 0;
  final List<Widget> _children = [
    Account(),
    Lists_Class(),
    Bits_Manager(),
    Account(),
    Account(),
  ];
  void _onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onTappedBar,
          currentIndex: _currentIndex,
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
                'Danh sách lớp',
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
}
