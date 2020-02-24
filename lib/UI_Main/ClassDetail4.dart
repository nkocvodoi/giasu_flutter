import 'package:flutter/material.dart';
import 'package:test_giasu/Helper/ScreenConfig.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/Widgets/ARichTextLine.dart';
import 'package:test_giasu/Widgets/SelectedTimeColumn.dart';

class ClassDetail4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ClassDetail4State();
  }
}

class ClassDetail4State extends State<ClassDetail4> {
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
                                fontSize: SizeConfig.safeBlockHorizontal * 3,
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
                          size: SizeConfig.safeBlockHorizontal * 3,
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
                          size: SizeConfig.safeBlockHorizontal * 3,
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
                          'Hình thức học: Offline',
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
                          'Số buổi/tuần: 2 (2h/buổi)',
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
                          'Số học viên: 1',
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
                          'Học phí/buổi: 150.000 vnđ/2h',
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
                          'Phí nhận lớp: 490.000 vnđ',
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
                Container(
                  width: SizeConfig.safeBlockHorizontal * 95,
                  height: SizeConfig.safeBlockHorizontal * 25,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Chi tiết nội dung yêu cầu',
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4,
                      fontStyle: FontStyle.normal,
                      color: Colors.grey[400],
                    ),
                  ),
                ),

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
                      color: Colors.blue,
                      child: Text(
                        'Lưu ý khi nhận lớp',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 3,
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
                          color: Colors.blue,
                          onPressed: () {
                            print('tap');
                          },
                          child: Text(
                            'Báo phát sinh',
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 3,
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