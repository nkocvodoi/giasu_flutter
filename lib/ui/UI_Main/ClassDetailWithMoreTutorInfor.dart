import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/model/List_TeacherData.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/Widgets/ARichTextLine.dart';
import 'package:test_giasu/ui/Widgets/LargeTextBox.dart';
import 'package:test_giasu/ui/Widgets/RoundedImageNameBox.dart';
import 'package:test_giasu/ui/Widgets/RoundedImageNameBoxForDemo.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'General_Infor.dart';
import 'TeacherListBox.dart';

class ClassDetailWithMoreTutorInfor extends StatefulWidget {
  Data_class classData;
  ClassDetailWithMoreTutorInfor(this.classData);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ClassDetailWithMoreTutorInforState(classData);
  }
}

class _ClassDetailWithMoreTutorInforState
    extends State<ClassDetailWithMoreTutorInfor> {
  Data_class classData;
  _ClassDetailWithMoreTutorInforState(this.classData);
  List<Data_teacher> teacher;
  Future<TeacherData> list_teacher;

  @override
  void initState() {
    super.initState();
    list_teacher = fetchTeacherData();
  }

  Widget _iconTextBox(Text text, Icon icon) {
    return Row(
      children: <Widget>[
        Expanded(child: icon),
        Expanded(
          child: SizedBox(
            width: ScreenUtil.getInstance().setWidth(20),
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            child: text,
          ),
        ),
        Expanded(
          child: SizedBox(width: 10),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    SizeConfig().init(context);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    // TODO: implement build
    print(classData.schedule_courses);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(47, 101, 174, 1),
        leading: buildPreviousButton(),
        title: Text(
          'Chi tiết lớp học',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: FutureBuilder<TeacherData>(
          future: list_teacher,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: SizeConfig.safeBlockVertical * 22,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: SizeConfig.safeBlockVertical * 19.5,
                                alignment: Alignment.center,
                                color: colorApp,
                                child: RoundedImageNameBoxForDemo(
                                  classData.parent.avatar,
                                  classData.parent.full_name,
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
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
                                        minHeight:
                                            SizeConfig.safeBlockHorizontal * 8,
                                        maxHeight:
                                            SizeConfig.safeBlockHorizontal * 10,
                                        minWidth:
                                            SizeConfig.safeBlockHorizontal * 8,
                                        maxWidth:
                                            SizeConfig.safeBlockHorizontal * 78,
                                      ),
                                      child: AutoSizeText(
                                        classData.name,
                                        maxLines: 1,
                                        maxFontSize: 20,
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            color: black),
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
                            border: Border.all(color: blue),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                              _iconTextBox(
                                Text(
                                  'Trạng thái: ${classData.status}',
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
                                  'Mã lớp: ${classData.id} - ${classData.subject.name} | Lớp ${classData.grade}',
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
                                  'Hình thức học: ${classData.form_teaching_name}',
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
                                  'Số buổi/tuần: ${classData.lesson_per_week} (${(classData.time_per_lesson).toInt()}h/buổi)',
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
                                  'Số học viên: ${classData.student_per_class}',
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
                                      width:
                                          ScreenUtil.getInstance().setWidth(20),
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
                                              text: classData.address,
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
                                  'Học phí/buổi: ${classData.tuition_fee} vnđ/2h',
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
                                  'Phí nhận lớp: ${classData.class_fee} vnđ',
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
                          height: ScreenUtil.getInstance().setHeight(20),
                        ),
                        LargeTextBox(classData.about_course),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(10),
                        ),
                        RichTextLine(),
                        SelectedTimeColumn(),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(50),
                        ),
                        Text(
                          'Gợi ý gia sư phù hợp',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: blue,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical * 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                width: SizeConfig.safeBlockHorizontal * 60,
                                height: SizeConfig.safeBlockVertical * 5,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    hintText: 'Tìm kiếm từ khóa/ID gia sư',
                                    hintStyle: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 13),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            RaisedButton(
                              onPressed: () {},
                              color: blue,
                              child: Text(
                                'Tìm kiếm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                              flex: 1,
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 6),
                        TeacherListBox(snapshot.data.data),
                      ],
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
