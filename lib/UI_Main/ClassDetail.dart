import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/Helper/ScreenConfig.dart';
import 'package:test_giasu/UI_Main/General_Infor.dart';
import 'package:test_giasu/Widgets/ARichTextLine.dart';
import 'package:test_giasu/Widgets/RoundedImageNameBox.dart';
import 'package:test_giasu/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/fetchData/List_ClassData.dart';

class ClassDetail extends StatefulWidget {
  Data_class classData;
  ClassDetail(this.classData);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ClassDetailState(classData);
  }
}

class ClassDetailState extends State<ClassDetail> {
  Data_class classData;
  ClassDetailState(this.classData);
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
                  height: SizeConfig.safeBlockVertical * 24,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: SizeConfig.safeBlockVertical * 21,
                        alignment: Alignment.center,
                        color: Color.fromRGBO(47, 101, 174, 1),
                        child: RoundedImageNameBox('assets/red.jpg', 'Logo2'),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: SizeConfig.safeBlockHorizontal * 80,
                          height: SizeConfig.safeBlockVertical * 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              '${classData.name}',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: SizeConfig.safeBlockHorizontal * 3,
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
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.portrait,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Mã lớp: ${classData.id} - ${classData.subject.name} | Lớp ${classData.grade}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Hình thức học: ${classData.form_teaching_name}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.school,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Số buổi/tuần: ${classData.lesson_per_week} (${(classData.time_per_lesson).toInt()}h/buổi)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.timelapse,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Số học viên: ${classData.student_per_class}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Địa chỉ: ${classData.address}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.map,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 4,
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
                          size: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Học phí/buổi: ${(classData.tuition_fee / 1000).toInt()},000 vnđ/2h',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.monetization_on,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Phí nhận lớp: ${(classData.class_fee /1000).toInt()},000 vnđ',
                          style: TextStyle(
                            color: Colors.blue[400],
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                          ),
                        ),
                        Icon(
                          Icons.attach_money,
                          color: Colors.grey,
                          size: SizeConfig.safeBlockHorizontal * 4,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 95,
                  height: SizeConfig.safeBlockHorizontal * 25,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    '${classData.about_course}',
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey,
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
                              'Đã có ${classData.recommend_number}/6 đề nghị dạy',
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
                          color: colorApp,
                          onPressed: () {
                            print('tap');
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
          ],
        ),
      ),
    );
  }
}
