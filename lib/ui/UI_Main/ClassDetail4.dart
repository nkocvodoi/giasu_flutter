//Lưu ý + Báo phát sinh

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/classDetailModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/ARichTextLine.dart';
import 'package:test_giasu/ui/Widgets/LargeTextBox.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

class ClassDetail4 extends StatefulWidget {
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
                   Provider.of<ClassDetailModel>(context).baophatsinh(636, _report.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassDetail4(),
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
                        color: Color.fromRGBO(47, 101, 174, 1),
                        child: Icon(Icons.portrait),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: SizeConfig.safeBlockHorizontal * 80,
                          height: SizeConfig.safeBlockVertical * 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Tìm gia sư Tiếng Anh lớp 6 tại Cầu Giấy',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
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
                      _iconTextBox(
                        Text(
                          'Trạng thái: Đang tìm gia sư',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.portrait,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Mã lớp: 522 - Tiếng Anh |Lớp 6',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Hình thức học: Offline',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.school,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Số buổi/tuần: 2 (2h/buổi)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.timelapse,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Số học viên: 1',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Địa chỉ: 155 Cầu Giấy, Hà Nội',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.map,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Cách bạn: 2km',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.radio_button_checked,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Học phí/buổi: 150.000 vnđ/2h',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.monetization_on,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Phí nhận lớp: 490.000 vnđ',
                          style: TextStyle(
                            color: Colors.blue[400],
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.attach_money,
                          color: Colors.grey,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
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
                    // width: ScreenUtil.getInstance().setWidth(600),
                    //height: ScreenUtil.getInstance().setHeight(60),

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
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 90,
                  height: SizeConfig.safeBlockVertical * 8,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 60,
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
