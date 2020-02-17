import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/Widgets/SelectedTimeColumn.dart';

class ClassDetail2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ClassDetail2State();
  }
}

class ClassDetail2State extends State<ClassDetail2> {
 
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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            // child: Padding(
            //   padding: EdgeInsets.only(
            //     left: 28.0,
            //     right: 28.0,
            //     top: 10.0,
            //   ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: ScreenUtil.getInstance().setHeight(180),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: ScreenUtil.getInstance().setHeight(150),
                        alignment: Alignment.center,
                        color: Color.fromRGBO(47, 101, 174, 1),
                        child: Icon(Icons.portrait),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(600),
                          height: ScreenUtil.getInstance().setHeight(60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(),
                            color: Colors.white,
                          ),
                          child: Center(child: Text(
                              'Tìm gia sư Tiếng Anh lớp 6 tại Cầu Giấy',
                              textAlign: TextAlign.center,
                            ),),
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
                  // alignment: Alignment.center,
                  width: ScreenUtil.getInstance().setWidth(580),
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
                              fontSize: ScreenUtil.getInstance().setSp(30)),
                        ),
                        Icon(
                          Icons.portrait,
                          color: Colors.grey,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Mã lớp: 522 - Tiếng Anh |Lớp 6',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenUtil.getInstance().setSp(30),
                          ),
                        ),
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Hình thức học: Offline',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenUtil.getInstance().setSp(30),
                          ),
                        ),
                        Icon(
                          Icons.school,
                          color: Colors.grey,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Số buổi/tuần: 2 (2h/buổi)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenUtil.getInstance().setSp(30),
                          ),
                        ),
                        Icon(
                          Icons.timelapse,
                          color: Colors.grey,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Số học viên: 1',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenUtil.getInstance().setSp(30),
                          ),
                        ),
                        Icon(
                          Icons.person_outline,
                          color: Colors.grey,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Địa chỉ: 155 Cầu Giấy, Hà Nội',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenUtil.getInstance().setSp(30),
                          ),
                        ),
                        Icon(
                          Icons.map,
                          color: Colors.grey,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Cách bạn: 2km',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenUtil.getInstance().setSp(30),
                          ),
                        ),
                        Icon(
                          Icons.radio_button_checked,
                          color: Colors.grey,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Học phí/buổi: 150.000 vnđ/2h',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: ScreenUtil.getInstance().setSp(30),
                          ),
                        ),
                        Icon(
                          Icons.monetization_on,
                          color: Colors.grey,
                        ),
                      ),
                      _iconTextBox(
                        Text(
                          'Phí nhận lớp: 490.000 vnđ',
                          style: TextStyle(
                            color: Colors.blue[400],
                            fontSize: ScreenUtil.getInstance().setSp(30),
                          ),
                        ),
                        Icon(
                          Icons.attach_money,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(20),
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(580),
                  height: ScreenUtil.getInstance().setHeight(150),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Chi tiết nội dung yêu cầu',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(30),
                      fontStyle: FontStyle.normal,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(10),
                ),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Thời gian',
                        style: TextStyle(
                          fontSize: ScreenUtil.getInstance().setSp(30),
                          color: Colors.grey,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      TextSpan(
                        text: '(màu',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.grey,
                          fontSize: ScreenUtil.getInstance().setSp(30),
                        ),
                      ),
                      TextSpan(
                        text: ' cam ',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.orange,
                          fontSize: ScreenUtil.getInstance().setSp(30),
                        ),
                      ),
                      TextSpan(
                        text: 'hiển thị thời gian có thể dạy)',
                        style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil.getInstance().setSp(30),
                        ),
                      ),
                    ],
                  ),
                ),
                SelectedTimeColumn(),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(10),
                ),
                
                Container(
                  alignment: Alignment.center,
                  width: ScreenUtil.getInstance().setWidth(700),
                  height: ScreenUtil.getInstance().setHeight(100),
                  
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: ScreenUtil.getInstance().setWidth(50),),
                      Container(
                        height: ScreenUtil.getInstance().setHeight(50),
                        width: ScreenUtil.getInstance().setWidth(150),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child:RaisedButton(
                        
                        color: Colors.orange,
                        onPressed: (){},
                        textColor: Colors.white,
                        child: Text('Từ chối'),
                      ),
                      ),
                      SizedBox(width: ScreenUtil.getInstance().setWidth(250),),
                      Container(
                        height: ScreenUtil.getInstance().setHeight(50),
                        width: ScreenUtil.getInstance().setWidth(150),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child:RaisedButton(
                        
                        color: Colors.blue,
                        onPressed: (){},
                        textColor: Colors.white,
                        child: Text('Đồng ý'),
                      ),
                      ),
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
