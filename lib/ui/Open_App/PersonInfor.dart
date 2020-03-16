import 'dart:ui';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/Widgets/SmallTextField.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
import 'SpecialtyInfor.dart';
import 'package:test_giasu/core/view_model/personalInforModel.dart';
// import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
// import 'package:path_provider/path_provider.dart';
import 'SpecialtyInfor.dart';

class PersonInfor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonInforState();
  }
}

class _PersonInforState extends State<PersonInfor> {
// My IPv4 : 192.168.43.171
  final String phpEndPoint = 'http://192.168.43.171/phpAPI/image.php';
  final String nodeEndPoint = 'http://192.168.43.171:3000/image';
  File file;

  void _choose() async {
 //   file = await ImagePicker.pickImage(source: ImageSource.camera);
 file = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  void _upload() {
    if (file == null) return;
    String base64Image = base64Encode(file.readAsBytesSync());
    String fileName = file.path.split("/").last;

    http.post(phpEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((res) {
      print(res.statusCode);
    }).catchError((err) {
      print(err);
    });
  }

  Future<PersonalInfor> _futurePersonalInfor;

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
        leading: buildPreviousButton(),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(47, 101, 174, 1),
        title:Text(
            'THÔNG TIN CÁ NHÂN',
            textAlign: TextAlign.center,
          
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
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    // padding: EdgeInsets.all(3.0),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: GestureDetector(
                      onTap: _choose,
                      child: Image.asset('assets/user.png',cacheHeight: 90,),

                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: (_futurePersonalInfor == null)
                            ? Column(
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
                                  SmallTextField(
                                      'Địa chỉ hiện tại', _controller9),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0, top: 10.0, bottom: 10.0),
                                    child: Text(
                                      'Ảnh xác thực',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10.0),
                                    // padding: EdgeInsets.all(3.0),

                                    // width: ScreenUtil.getInstance().setWidth(150),
                                    height:
                                        ScreenUtil.getInstance().setHeight(200),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: GestureDetector(
                                      onTap: _choose,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          Image.asset('assets/user.png',cacheHeight: 100,),
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
                                                    width:
                                                        ScreenUtil.getInstance()
                                                            .setWidth(440),
                                                    height:
                                                        ScreenUtil.getInstance()
                                                            .setHeight(145),
                                                    child: Text(
                                                      'CMT của bạn sẽ được sử dụng để xác thực. Thông tin này sẽ được chúng tôi bảo mật an toàn.',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontStyle:
                                                            FontStyle.normal,
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
                                    height:
                                        ScreenUtil.getInstance().setHeight(200),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: GestureDetector(
                                      onTap: _choose,
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          Image.asset('assets/user.png',cacheHeight: 100,),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Thẻ sinh viên hoặc bằng cấp ',
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Wrap(
                                                children: <Widget>[
                                                  Container(
                                                    width:
                                                        ScreenUtil.getInstance()
                                                            .setWidth(440),
                                                    height:
                                                        ScreenUtil.getInstance()
                                                            .setHeight(145),
                                                    child: Text(
                                                      'Thẻ sinh viên/bằng cấp của bạn sẽ được sử dụng để xác thực. Thông tin này sẽ được chúng tôi bảo mật an toàn.',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontStyle:
                                                            FontStyle.normal,
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
                                    height:
                                        ScreenUtil.getInstance().setHeight(50),
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
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: SizedBox(),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _futurePersonalInfor =
                                                createPersonalInfor(
                                              _controller.text,
                                              _controller1.text,
                                              _controller2.text,
                                              _controller3.text,
                                              _controller4.text,
                                              _controller5.text,
                                              _controller6.text,
                                              _controller7.text,
                                              _controller8.text,
                                              _controller9.text,
                                            );
                                          });
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
                                          width: 100,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                ],
                              )
                            : FutureBuilder<PersonalInfor>(
                                future: _futurePersonalInfor,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(snapshot.data.full_name);
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }

                                  return CircularProgressIndicator();
                                },
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
