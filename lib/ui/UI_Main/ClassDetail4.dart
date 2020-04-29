import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//Lưu ý + Báo phát sinh

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/view_model/classDetailModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/ARichTextLine.dart';
import 'package:test_giasu/ui/Widgets/LargeTextBox.dart';
import 'package:test_giasu/ui/Widgets/RoundedImageNameBox.dart';
import 'package:test_giasu/ui/Widgets/RoundedImageNameBoxForDemo.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ClassDetail4 extends StatefulWidget {
  Data_class classData;
  ClassDetail4(this.classData);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ClassDetail4State();
  }
}

class ClassDetail4State extends State<ClassDetail4> {

  TextEditingController _report = TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  String validateReport(String value) {
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
//      print("Name $name");
//      print("Mobile $mobile");
//      print("Email $email");
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  void _baophatsinh(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              titlePadding: EdgeInsets.zero,
              title: Container(
                padding: EdgeInsets.all(10.0),
                color: colorApp,
                child: Text(
                  'Lớp phát sinh',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ),
              content: Form(
                  key: _key,
                  autovalidate: _validate,
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nội dung phát sinh *',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  _textLargeField('Nhập nội dung phát sinh'),
                ],
              )),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5, bottom: 5),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: new Text(
                      "X Đóng",
                      style: TextStyle(color: Colors.black45, fontSize: 20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  color: colorApp,
                  child: Container(
//                    color: colorApp,
                    padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5, bottom: 5),
                    decoration:
                    BoxDecoration(border: Border.all(color: colorApp)),
                    child: new Text(
                      "Đánh giá",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  onPressed: () {
                    _sendToServer();
                   Provider.of<ClassDetailModel>(context).baophatsinh(widget.classData.id, _report.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassDetail4(widget.classData),
                      ),
                    );
                  },
                ),
              ],
            ));
  }

  Widget _textLargeField(String _s) {
    return Container(
      height: 120,
      width: 380,
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        height: 120,
        child: TextFormField(
          maxLines: 5,
          style: TextStyle(fontSize: 19.0),
          decoration: InputDecoration(
            border: InputBorder.none,
              hintText: _s),
          validator: validateReport,
          onSaved: (String _val){
            _report.text = _val;
          },
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueAccent),
        
      ),
    );
  }

  Widget _iconTextBox(Text text, Icon icon) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey),
          ),
      child: Row(
        children: <Widget>[
          icon,
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(20),
          ),
          text,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: buildPreviousButton(),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(47, 101, 174, 1),
        title: Text(
          'Chi tiết lớp học',
          textAlign: TextAlign.start,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: SizeConfig.safeBlockVertical * 20,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: SizeConfig.safeBlockVertical * 17.5,
                        alignment: Alignment.center,
                        color: colorApp,
                        child: RoundedImageNameBoxForDemo(
                          widget.classData.parent.avatar,
                          widget.classData.parent.full_name,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: SizeConfig.safeBlockHorizontal * 80,
                          height: SizeConfig.safeBlockVertical * 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: grey, width: 1),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: SizeConfig.safeBlockHorizontal * 8,
                                maxHeight: SizeConfig.safeBlockHorizontal * 10,
                                minWidth: SizeConfig.safeBlockHorizontal * 8,
                                maxWidth: SizeConfig.safeBlockHorizontal * 78,
                              ),
                              child: AutoSizeText(
                                widget.classData.name,
                                maxLines: 1,
                                maxFontSize: 20,
                                style: TextStyle(
                                    fontStyle: FontStyle.normal, color: black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  // alignment: Alignment.center,
                  width: SizeConfig.safeBlockHorizontal * 95,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      _iconTextBox(
                        Text(
                          'SĐT trung tâm: 0862856500',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.portrait,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      Divider(
                        color: grey,
                      ),
                      _iconTextBox(
                        Text(
                          'SĐT Phụ huynh/ HV: 0862856500',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.portrait,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      Divider(
                        color: grey,
                      ),
                      _iconTextBox(
                        Text(
                          'Trạng thái: ${widget.classData.status}',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.portrait,
                          color: black,
                          size: 15,
                        ),
                      ),
                      Divider(
                        color: grey,
                      ),
                      _iconTextBox(
                        Text(
                          'Mã lớp: ${widget.classData.id} - ${widget.classData.subject.name} | Lớp ${widget.classData.grade}',
                          style: TextStyle(
                            color: black,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.home,
                          color: black,
                          size: 15,
                        ),
                      ),
                      Divider(
                        color: grey,
                      ),
                      _iconTextBox(
                        Text(
                          'Hình thức học: ${widget.classData.form_teaching_name}',
                          style: TextStyle(
                            color: black,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.school,
                          color: black,
                          size: 15,
                        ),
                      ),
                      Divider(
                        color: grey,
                      ),
                      _iconTextBox(
                        Text(
                          'Số buổi/tuần: ${widget.classData.lesson_per_week} (${(widget.classData.time_per_lesson).toInt()}h/buổi)',
                          style: TextStyle(
                            color: black,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.timelapse,
                          color: black,
                          size: 15,
                        ),
                      ),
                      Divider(
                        color: grey,
                      ),
                      _iconTextBox(
                        Text(
                          'Số học viên: ${widget.classData.student_per_class}',
                          style: TextStyle(
                            color: black,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.person_outline,
                          color: black,
                          size: 15,
                        ),
                      ),
                      Divider(
                        color: grey,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Icon(
                              Icons.map,
                              color: Colors.grey,
                              size: 15,
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              width: ScreenUtil.getInstance().setWidth(20),
                            ),
                          ),
                          Expanded(
                            flex: 20,
                            child: Container(
                              child: RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: widget.classData.address,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        fontFamily: 'UTM',
                                      ),
                                    ),
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          launch(
                                              'https://www.google.com/maps/place/38+Tr%E1%BA%A7n+Qu%C3%BD+Ki%C3%AAn,+D%E1%BB%8Bch+V%E1%BB%8Dng,+C%E1%BA%A7u+Gi%E1%BA%A5y,+H%C3%A0+N%E1%BB%99i,+Vi%E1%BB%87t+Nam/@21.0373781,105.7920155,17z/data=!3m1!4b1!4m5!3m4!1s0x3135ab37c1376ff7:0x245ac013cbc4304e!8m2!3d21.0373781!4d105.7920155?hl=vi-VNv');
                                        },
                                      text: ' ( Xem bản đồ )',
                                      style: TextStyle(
                                        fontFamily: 'UTM',
                                        color: orange,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: grey,
                      ),
                      _iconTextBox(
                        Text(
                          'Cách bạn: 2km',
                          style: TextStyle(
                            color: black,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.radio_button_checked,
                          color: black,
                          size: 15,
                        ),
                      ),
                      Divider(
                        color: grey,
                      ),
                      _iconTextBox(
                        Text(
                          'Học phí/buổi: ${(widget.classData.tuition_fee)} vnđ/2h',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.monetization_on,
                          color: black,
                          size: 15,
                        ),
                      ),
                      Divider(
                        color: grey,
                      ),
                      _iconTextBox(
                        Text(
                          'Phí nhận lớp: ${(widget.classData.class_fee)} vnđ',
                          style: TextStyle(
                            color: Colors.blue[400],
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.attach_money,
                          color: black,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                LargeTextBox('Chi tiết nội dung yêu cầu'),
                RichTextLine(),
                SelectedTimeColumn(),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 5,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.all(5),

                    // width: ScreenUtil.getInstance().setWidth(80),
                    // height: ScreenUtil.getInstance().setHeight(50),
                    color: colorApp,
                    child: Text(
                      'Lưu ý khi nhận lớp',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 70,
                  height: SizeConfig.safeBlockVertical * 8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        height: SizeConfig.safeBlockVertical * 5,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: colorApp,
                          onPressed: () {
                            _baophatsinh(context);
                          },
                          child: Text(
                            'Báo phát sinh',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
