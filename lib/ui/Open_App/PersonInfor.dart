import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/Widgets/SmallTextField.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'SpecialtyInfor.dart';

import 'SpecialtyInfor.dart';

class PersonInfor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonInforState();
  }
}

class _PersonInforState extends State<PersonInfor> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();
  final TextEditingController _controller8 = TextEditingController();
  final TextEditingController _controller9 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 900, height: 1334, allowFontScaling: true);
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
                              SmallTextField('Họ và tên', _controller),
                              SmallTextField('Giới tính', _controller1),
                              SmallTextField('Quê quán', _controller2),
                              SmallTextField('Ngày sinh', _controller3),
                              SmallTextField('Giọng nói', _controller4),
                              SmallTextField(
                                  'Link Facebook của bạn', _controller5),
                              SmallTextField('Số điện thoại', _controller6),
                              SmallTextField('Email', _controller7),
                              SmallTextField('Địa chỉ dạy', _controller8),
                              SmallTextField('Địa chỉ hiện tại', _controller9),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0, top: 10.0, bottom: 10.0),
                                child: Text(
                                  'Ảnh xác thực',
                                  style: TextStyle(
                                    fontSize:
                                       20,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                // padding: EdgeInsets.all(3.0),

                                // width: ScreenUtil.getInstance().setWidth(150),
                                height: ScreenUtil.getInstance().setHeight(200),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    print('object');
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset('assets/user.png'),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Chứng minh thư mặt trước ',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Wrap(
                                            children: <Widget>[
                                              Container(
                                                width: ScreenUtil.getInstance().setWidth(450),
                                                height: ScreenUtil.getInstance()
                                                    .setHeight(145),
                                                child: Text(
                                                  'CMT của bạn sẽ được sử dụng để xác thực. Thông tin này sẽ được chúng tôi bảo mật an toàn.',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                // padding: EdgeInsets.all(3.0),

                                // width: ScreenUtil.getInstance().setWidth(150),
                                height: ScreenUtil.getInstance().setHeight(200),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    print('object');
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset('assets/user.png'),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Chứng minh thư mặt trước ',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Wrap(
                                            children: <Widget>[
                                              Container(
                                                width: ScreenUtil.getInstance().setWidth(450),
                                                    
                                                height: ScreenUtil.getInstance()
                                                    .setHeight(145),
                                                child: Text(
                                                  'CMT của bạn sẽ được sử dụng để xác thực. Thông tin này sẽ được chúng tôi bảo mật an toàn.',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontStyle: FontStyle.normal,
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
                                        width: ScreenUtil.getInstance()
                                            .setWidth(300),
                                        height: ScreenUtil.getInstance()
                                            .setHeight(150),
                                        margin: EdgeInsets.all(5.0),
                                        child: Text(
                                          'Vui lòng cập nhập đầy đủ thông tin phía trên',
                                          style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: ScreenUtil.getInstance()
                                                .setSp(23),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        ScreenUtil.getInstance().setWidth(150),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SpecialtyInfor(),
                                          ),
                                        );
                                      },
                                      child: Image.asset(
                                        "assets/next.png",
                                        width: ScreenUtil.getInstance()
                                            .setWidth(200),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ))
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
