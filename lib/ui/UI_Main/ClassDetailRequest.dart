import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/ARichTextLine.dart';
import 'package:test_giasu/ui/Widgets/LargeTextBox.dart';
import 'package:test_giasu/ui/Widgets/RoundedImageNameBox.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

class ClassDetailRequest extends StatefulWidget {
  Data_class classData;
  ClassDetailRequest(this.classData);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ClassDetailRequestState(classData);
  }
}

class _ClassDetailRequestState extends State<ClassDetailRequest> {
  Data_class classData;
  _ClassDetailRequestState(this.classData);
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
    SizeConfig().init(context);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: buildPreviousButton(),
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
                                fontSize: 13,
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
                            fontSize: 15,
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
                            fontSize: 15,
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
                            fontSize: 15,
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
                            fontSize: 15,
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
                            fontSize: 15,
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
                            fontSize: 15,
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
                            fontSize: 15,
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
                            fontSize: 15,
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
                            fontSize: 15,
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
                Divider(
                  thickness: 1,
                ),
                Container(
                  alignment: Alignment.center,
                  width: ScreenUtil.getInstance().setWidth(700),
                  height: ScreenUtil.getInstance().setHeight(100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(),
                        flex: 1,
                      ),
                      Container(
                        height: SizeConfig.safeBlockVertical * 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: RaisedButton(
                          color: orange,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MyBottomNavigationBar()));
                          },
                          textColor: Colors.white,
                          child: Text('Từ chối'),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                        flex: 2,
                      ),
                      Container(
                        height: SizeConfig.safeBlockVertical * 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: RaisedButton(
                          color: colorApp,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MyBottomNavigationBar()));
                          },
                          textColor: Colors.white,
                          child: Text('Đồng ý'),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                        flex: 1,
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
