import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/Widgets/LargeTextField.dart';
import 'package:test_giasu/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/Widgets/SmallTextField.dart';
import 'SubjectChoice.dart';
import 'package:test_giasu/Widgets/SelectedTime.dart';

import 'SubjectChoice.dart';

class SpecialtyInfor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SpecialtyInforState();
  }
}

class _SpecialtyInforState extends State<SpecialtyInfor> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 101, 174, 1),
        title: Center(
          child: Text(
            'HỒ SƠ CHUYÊN MÔN',
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 28.0,
                right: 28.0,
                top: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LargeTextField('Kinh nghiệm gia sư & dạy học'),
                  LargeTextField('Thành tích học tập & dạy học'),
                  SmallTextField('Bạn đang là'),
                  SmallTextField('Hình thức dạy'),
                  SmallTextField('Học phí vnđ/buổi (VD: 150.000)'),
                  Container(
                    height: ScreenUtil.getInstance().setHeight(100),
                    width: ScreenUtil.getInstance().setWidth(640),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlatButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubjectChoice(),
                          ),
                        );
                      },
                      child: Text(
                        'Gia sư môn',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(30),
                          fontStyle: FontStyle.normal,
                          color: Colors.grey[400],
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SmallTextField('Số lượng lớp đã dạy (VD: 5)'),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Chọn thời gian',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(30),
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        TextSpan(
                          text: '(màu',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                            fontSize: ScreenUtil.getInstance().setSp(25),
                          ),
                        ),
                        TextSpan(
                          text: ' cam ',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.orange,
                            fontSize: ScreenUtil.getInstance().setSp(25),
                          ),
                        ),
                        TextSpan(
                          text: 'hiển thị thời gian có thể dạy)',
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil.getInstance().setSp(25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SelectedTimeColumn(),
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
                                fontSize: ScreenUtil.getInstance().setSp(23),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: ScreenUtil.getInstance().setWidth(150),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          print('tap');
                        },
                        child: Text(
                          'Lưu lại',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(30),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
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
