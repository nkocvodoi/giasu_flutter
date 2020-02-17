import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/Widgets/LargeTextField.dart';
import 'package:test_giasu/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/Widgets/SmallTextField.dart';

class PostRequest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostRequestState();
  }
}

class PostRequestState extends State<PostRequest> {
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
            'Đăng yêu cầu',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontSize: ScreenUtil.getInstance().setSp(30),
            ),
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
                        height: ScreenUtil.getInstance().setHeight(130),
                        alignment: Alignment.center,
                        color: Color.fromRGBO(47, 101, 174, 1),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(600),
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Tìm gia sư Tiếng Anh lớp 6 tại Cầu Giấy',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: ScreenUtil.getInstance().setSp(25),
                                  fontStyle: FontStyle.normal),
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
                  padding: EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    children: <Widget>[
                      SmallTextField('Môn học'),
                      SmallTextField('Chủ đề học'),
                      SmallTextField('Lớp'),
                      SmallTextField('Số buổi học/tuần'),
                      SmallTextField('Thời gian học/buổi'),
                      SmallTextField('Số học viên/lớp'),
                      SmallTextField('Đối tượng dạy'),
                      SmallTextField('Giới tính gia sư'),
                      SmallTextField('Hình thức dạy'),
                      SmallTextField('Học phí/buổi (vnđ)'),
                      SmallTextField('Điện thoại'),
                      SmallTextField('Địa điểm'),
                      SmallTextField('Địa chỉ học'),
                      LargeTextField('Nhập mô tả chi tiết nội dung muốn học'),
                    ],
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
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(700),
                  height: ScreenUtil.getInstance().setHeight(100),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: <Widget>[
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: ScreenUtil.getInstance().setWidth(300),
                            height: ScreenUtil.getInstance().setHeight(150),
                            margin: EdgeInsets.all(5.0),
                            child: Text(
                              'Vui lòng cập nhật đầy đủ thông tin phía trên',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: ScreenUtil.getInstance().setSp(25),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: ScreenUtil.getInstance().setWidth(130),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10) ),
                        onPressed: () {
                          print('tap');
                        },
                        child: Text(
                          'Đăng yêu cầu',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(27),
                            color: Colors.white,
                          ),
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
