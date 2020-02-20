import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentInfor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StudentInforState();
  }
}

class _StudentInforState extends State<StudentInfor> {
  Widget _textField(String text) {
    return Padding(
      padding: EdgeInsets.all(5.0),
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
        backgroundColor: Color.fromRGBO(47, 101, 174, 1),
        title: Center(
          child: Text(
            'THÔNG TIN CÁ NHÂN',
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
                  Text(
                    'Ảnh đại diện',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(30),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    // padding: EdgeInsets.all(3.0),
                    width: ScreenUtil.getInstance().setWidth(250),
                    height: ScreenUtil.getInstance().setHeight(250),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/user.png'),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _textField('Họ và tên'),
                            _textField('Giới tính'),
                            _textField('Số điện thoại'),
                            _textField('Email'),
                            _textField('Địa điểm'),
                            _textField('Địa chỉ nhà'),
                           SizedBox(height: ScreenUtil.getInstance().setHeight(300),),
                            
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(50),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Row(
                        children: <Widget>[
                          Wrap(
                            children: <Widget>[
                              Container(
                                width: ScreenUtil.getInstance().setWidth(300),
                                height: ScreenUtil.getInstance().setHeight(150),
                                margin: EdgeInsets.all(5.0),
                                child: Text(
                                  'Vui lòng cập nhập đầy đủ thông tin phía trên',
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(23),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: ScreenUtil.getInstance().setWidth(150),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: RaisedButton(
                              color: Color.fromRGBO(47, 101, 174, 1),
                              onPressed: () {},
                              child: Text(
                                'Lưu lại',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
