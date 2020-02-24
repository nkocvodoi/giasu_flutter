import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/Helper/ScreenConfig.dart';
import 'package:test_giasu/Widgets/ARichTextLine.dart';
import 'package:test_giasu/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/fetchData/List_ClassData.dart';

class ClassDetail extends StatefulWidget {
  Data_class class1;

  ClassDetail({Key key, this.class1}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ClassDetailState(class1: class1);
  }
}

class _ClassDetailState extends State<ClassDetail> {
  Data_class class1;

  _ClassDetailState({this.class1});

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
        backgroundColor: Color.fromRGBO(47, 101, 174, 1),
        title: Center(
          child: Text(
            'Chi tiết lớp học',
            textAlign: TextAlign.start,
          ),
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
                        height: SizeConfig.safeBlockVertical * 16,
                        alignment: Alignment.center,
                        color: Color.fromRGBO(47, 101, 174, 1),
                        child: Icon(Icons.portrait),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: SizeConfig.safeBlockHorizontal * 80,
                          height: SizeConfig.safeBlockVertical * 8,
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
                                fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                              ),
                              textAlign: TextAlign.center,
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
                          'Trạng thái: Đang tìm gia sư',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.portrait,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 3,
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
                          size: SizeConfig.safeBlockHorizontal * 3,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Hình thức học: ${class1.form_teaching_name}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.school,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 3,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Số buổi/tuần: ${class1.lesson_per_week} (${class1.time_per_lesson}h/buổi)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.timelapse,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 3,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Số học viên: ${class1.student_per_class}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 3,
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
                          size: SizeConfig.safeBlockHorizontal * 3,
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
                          size: SizeConfig.safeBlockHorizontal * 3,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Học phí/buổi: ${class1.tuition_fee} vnđ/${class1.time_per_lesson}h',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.monetization_on,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 3,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Phí nhận lớp: ${class1.class_fee} vnđ',
                          style: TextStyle(
                            color: Colors.blue[400],
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.attach_money,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 3,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'Chi tiết nội dung yêu cầu',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 95,
                  height: SizeConfig.safeBlockHorizontal * 25,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      '${class1.about_course}',
                      style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 4,
                        fontStyle: FontStyle.normal,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(10),
                ),
                RichTextLine(),
                SelectedTimeColumn(),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 90,
                  height: SizeConfig.safeBlockVertical * 10,
                  child: Row(
                    children: <Widget>[
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: ScreenUtil.getInstance().setWidth(145),
                            margin: EdgeInsets.all(5.0),
                            child: Text(
                              'Đã có ${class1.recommend_number}/6 đề nghị dạy',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: SizeConfig.safeBlockHorizontal * 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 40,
                      ),
                      RaisedButton(
                          color: Colors.blue,
                          onPressed: () {
                            print('tap');
                            print(class1.about_course);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: SizeConfig.safeBlockVertical * 5,
                            child: Text(
                              'Đề nghị dạy',
                              style: TextStyle(
                                fontSize: SizeConfig.safeBlockHorizontal * 3,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
