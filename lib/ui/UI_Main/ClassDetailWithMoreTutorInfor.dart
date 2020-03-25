import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/model/List_TeacherData.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/Widgets/ARichTextLine.dart';
import 'package:test_giasu/ui/Widgets/LargeTextBox.dart';
import 'package:test_giasu/ui/Widgets/RoundedImageNameBox.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(47, 101, 174, 1),
        leading: buildPreviousButton(),
        title:Text(
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
                          height: SizeConfig.safeBlockVertical * 24,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: SizeConfig.safeBlockVertical * 21,
                                alignment: Alignment.center,
                                color: Color.fromRGBO(47, 101, 174, 1),
                                child: RoundedImageNameBox(
                                  classData.parent.avatar,
                                  classData.parent.full_name,
                                ),
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
                                      classData.name,
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize:
                                            13,
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
                                  'Trạng thái: ${classData.status}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize:
                                        15,
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
                                  'Mã lớp: ${classData.id} - ${classData.subject.name} | Lớp ${classData.grade}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize:
                                        15,
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
                                  'Hình thức học: ${classData.form_teaching_name}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize:
                                        15,
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
                                  'Số buổi/tuần: ${classData.lesson_per_week} (${(classData.time_per_lesson).toInt()}h/buổi)',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize:
                                        15,
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
                                  'Số học viên: ${classData.student_per_class}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize:
                                        15,
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
                                  'Địa chỉ: ${classData.address}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize:
                                        15,
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
                                    fontSize:
                                        15,
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
                                  'Học phí/buổi: ${(classData.tuition_fee / 1000).toInt()},000 vnđ/2h',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize:
                                        15,
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
                                  'Phí nhận lớp: ${(classData.class_fee / 1000).toInt()},000 vnđ',
                                  style: TextStyle(
                                    color: Colors.blue[400],
                                    fontSize:
                                        15,
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
                            color: Colors.blue,
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
                                        fontSize:
                                            13),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Container(
                              height: SizeConfig.safeBlockVertical * 5,
                              width: SizeConfig.safeBlockHorizontal * 23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: RaisedButton(
                                onPressed: () {},
                                color: Colors.blue[400],
                                child: Text(
                                  'Tìm kiếm',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontSize:
                                        15,
                                  ),
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
