import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

var _locations = ['Hanoi', 'Danang', 'Saigon', 'Other'];
class Filter_S extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Filter_State();
  }
}

class _Filter_State extends State<Filter_S> {
  final Color _color = Color.fromRGBO(47, 101, 174, 1);

  Widget _textField(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
      child: Container(
        //        height: SizeConfig.blockSizeVertical * 7,
        width: SizeConfig.blockSizeHorizontal * 85,
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            contentPadding: EdgeInsets.only(left: 12.0),
            hintStyle: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(37),
              fontStyle: FontStyle.normal,
              fontFamily: 'UTM',
              color: Colors.grey[400],
            ),
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: _color, width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: buildPreviousButton(),
        backgroundColor: _color,
        title: Center(
          child: Text(
            'Bộ lọc',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'UTM', fontSize: 26),
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 5,
                right: SizeConfig.blockSizeHorizontal * 5,
                top: SizeConfig.blockSizeHorizontal * 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _textField('Địa điểm'),
                        _textField('Môn học'),
                        _textField('Chủ đề'),
                        _textField('Hình thức học'),
                        _textField('Đối tượng dạy'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyBottomNavigationBar(
                            currentIndex: 1,
                          ),
                        ),
                      );
                    },
                    color: _color,
                    child: new Padding(
                      padding: EdgeInsets.only(
                          right: 15.0, left: 15.0, bottom: 10.0, top: 10.0),
                      child: Text(
                        'Tìm kiếm',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}