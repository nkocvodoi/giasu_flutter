import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/UI_Main/Lists_Class.dart';

class Bo_Loc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Bo_Loc_State();
  }
}

class _Bo_Loc_State extends State<Bo_Loc> {
  final Color _color = Color.fromRGBO(47, 101, 174, 1);

  var _slidervalue = 0.0;

  Widget _textField(String text) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(30),
            fontStyle: FontStyle.normal,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Center(
          child: Text(
            'BỘ LỌC',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil.getInstance().setWidth(28),
                right: ScreenUtil.getInstance().setWidth(28),
                top: ScreenUtil.getInstance().setHeight(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(15.0),
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
//                  SizedBox(
//                    height: ScreenUtil.getInstance().setHeight(10),
//                  ),
                  Text(
                    'Khoảng cách',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(40),
                      color: _color,
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: _color,
                      //inactiveTrackColor: Colors.red[100],
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 8.0,
                      thumbColor: _color,
                      //thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                     // valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: Colors.indigo,
                      valueIndicatorTextStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    child: Slider(
                      value: _slidervalue,
                      min: 0,
                      max: 20,
                      divisions: 20,
                      label: '$_slidervalue'+ 'Km',
                      onChanged: (newvalue) {
                        setState(() {
                          _slidervalue = newvalue;
                        });
                      },
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyBottomNavigationBar(currentIndex: 1,),
                        ),
                      );
                    },
                    color: _color,
                    child: new Padding(
                      padding: EdgeInsets.only(right: 15.0, left: 15.0, bottom: 10.0,top: 10.0),
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
