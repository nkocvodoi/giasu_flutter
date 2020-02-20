import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/UI_Main/Bo_Loc.dart';
import 'package:test_giasu/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/UI_Main/ClassDetail.dart';

import 'Filter.dart';
import 'package:test_giasu/UI_Main/Filter.dart';
import 'ClassDetail.dart';

// ignore: camel_case_types
class Lists_Class extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Lists_Class_State();
  }
}

class _Lists_Class_State extends State<Lists_Class> {
  final Color _color = Color.fromRGBO(47, 101, 174, 1);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(
        width: MediaQuery.of(context).size.width.toInt(),
        height: MediaQuery.of(context).size.height.toInt(),
        allowFontScaling: true);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Center(
          child: Text(
            'Danh sách lớp gia sư',
            style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(30),
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      //bottomNavigationBar: MyBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: ScreenUtil.getInstance().setHeight(40),
                  decoration: BoxDecoration(
                    color: _color,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                _buildBox(),
              ],
            ),
            Positioned(
              top: ScreenUtil.getInstance().setHeight(10),
              child: Row(
                children: <Widget>[
                  Container(
                    height: ScreenUtil.getInstance().setHeight(55),
                    width: ScreenUtil.getInstance().setWidth(150),
                    child: Center(
                      child: Text(
                        'N kết quả',
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(25),
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: _color,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0)),
                    ),
                  ),
                  Container(
                    height: ScreenUtil.getInstance().setHeight(55),
                    width: ScreenUtil.getInstance().setWidth(150),
                    child: ListTile(
                      title: Text(
                        'Bộ lọc',
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(25),
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        print('Tap');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Bo_Loc(),
                          ),
                        );
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: _color,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBox() {
    return RaisedButton(
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        height: ScreenUtil.getInstance().setHeight(200),
        width: ScreenUtil.getInstance().setWidth(400),
        child: Padding(
          padding: EdgeInsets.only(left: 5.0, top: 7.0),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _iconTextBox(
                    'Mã lớp: 522 - Tiếng Anh lớp 6',
                    _color,
                    20,
                    Icon(Icons.account_box),
                  ),
                  _iconTextBox1(
                    'Gia sư Bình Minh',
                    Colors.deepOrange,
                    20,
                    Icon(Icons.account_box),
                  ),
                  _iconTextBox4(
                    'Số 55 Ngõ 31 Cầu Giấy, Hà Nội',
                    Colors.grey,
                    20,
                    Icon(Icons.account_box),
                  ),
                  _iconTextBox(
                    '150.000 vnd/2h - 2 buổi/tuần',
                    Colors.grey,
                    21,
                    Icon(Icons.account_box),
                  ),
                  _iconTextBox2(
                    'Cách bạn: 2 km',
                    Colors.grey,
                    20,
                    Icon(Icons.account_box),
                  ),
                  _iconTextBox3(
                    'Phí nhận lớp: 480,000 vnđ',
                    Colors.blue,
                    20,
                    Icon(Icons.account_box),
                  ),
                ],
              ),
//              Icon(Icons.arrow_forward_ios,
//              size: 50,
//                color: _color,
//              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.blueAccent,
              width: ScreenUtil.getInstance().setWidth(2)),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClassDetail(),
          ),
        );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _iconTextBox(String _text, Color _c, int _a, Icon _icon) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(27),
      child: Row(
        children: <Widget>[
          _icon,
          Text(
            _text,
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(_a),
              color: _c,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconTextBox1(String _text, Color _c, int _a, Icon _icon) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(27),
      child: Row(
        children: <Widget>[
          _icon,
          Text(
            _text,
            style: TextStyle(
              height: ScreenUtil.getInstance().setSp(1),
              fontSize: ScreenUtil.getInstance().setSp(_a),
              color: _c,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconTextBox2(String _text, Color _c, int _a, Icon _icon) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(27),
      child: Row(
        children: <Widget>[
          _icon,
          Text(
            _text,
            style: TextStyle(
              height: ScreenUtil.getInstance().setSp(1),
              fontSize: ScreenUtil.getInstance().setSp(_a),
              color: _c,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(110),
          ),
          Center(child: Text(
            '0/6 đề nghị',
            style: TextStyle(
              height: ScreenUtil.getInstance().setSp(1),
              fontSize: ScreenUtil.getInstance().setSp(16),
              color: Colors.deepOrange,
              fontWeight: FontWeight.w400,
            ),
          ),),
        ],
      ),
    );
  }

  Widget _iconTextBox3(String _text, Color _c, int _a, Icon _icon) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(33),
      child: Row(
        children: <Widget>[
          _icon,
          Text(
            _text,
            style: TextStyle(
              height: ScreenUtil.getInstance().setSp(1),
              fontSize: ScreenUtil.getInstance().setSp(_a),
              color: _c,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(25),
          ),
          RaisedButton(
            padding: EdgeInsets.only(left: 2.0, right: 2.0),
            color: _color,
            onPressed: () {},
            child: Text(
              'Đề nghị dạy',
              style: TextStyle(
                  fontSize: ScreenUtil.getInstance().setSp(15),
                  color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconTextBox4(String _text, Color _c, int _a, Icon _icon) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(27),
      child: Row(
        children: <Widget>[
          _icon,
          Text(
            _text,
            style: TextStyle(
              height: 1.3,
              fontSize: ScreenUtil.getInstance().setSp(_a),
              color: _c,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(30),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: _color,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}
