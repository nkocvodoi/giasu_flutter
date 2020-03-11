import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/core/model/List_TeacherDetail.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/Widgets/ARichTextLine.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/ui/Widgets/SmallTextBox.dart';
import 'package:test_giasu/ui/Widgets/SmallTextBoxWithBold.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/model/List_TeacherData.dart';

class TutorInfor extends StatefulWidget {
  Data_teacher teacherData;
  TutorInfor(this.teacherData);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TutorInforState(teacherData);
  }
}

class TutorInforState extends State<TutorInfor> {
  Data_teacher teacherData;
  TutorInforState(this.teacherData);
  Widget _box(int number, String detail) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 25,
      height: SizeConfig.blockSizeVertical * 25,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '$number',
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Divider(thickness: 2, color: Colors.blue),
          Text(
            detail,
            style: TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.normal,
            ),
          )
        ],
      ),
    );
  }

  Widget _iconTextBox(
      Text text,
      Icon icon,
      Color color,
      int height,
      ) {
    return Container(
      padding: EdgeInsets.only(right: 5, left: 5),
      height: 40,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: <Widget>[
          icon,
          text,
        ],
      ),
    );
  }

  Widget _iconTextBoxNoBorder(
      Text text,
      Icon icon,
      Color color,
      int height,
      ) {
    return Container(
      padding: EdgeInsets.only(right: 5, left: 5),
      height: 40,
      child: Row(
        children: <Widget>[
          icon,
          text,
        ],
      ),
    );
  }

  String getGender(String gender) {
    if (gender == 'female') return 'Nữ';
    if (gender == 'male') return 'Nam';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(
        width: MediaQuery.of(context).size.width.toInt(),
        height: MediaQuery.of(context).size.height.toInt(),
        allowFontScaling: true);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 101, 174, 1),
        title: Center(
          child: Text(
            'Chi tiết ',
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
                  height: SizeConfig.safeBlockVertical * 35,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: SizeConfig.safeBlockVertical * 27,
                        alignment: Alignment.center,
                        color: Color.fromRGBO(47, 101, 174, 1),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(150),
                          height: ScreenUtil.getInstance().setHeight(150),
                          decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.white),
                            color: Colors.white,
                          ),
                          child: Expanded(
                            child: Image.network(
                                'https://giasu.htcon.vn' + teacherData.avatar),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: SizeConfig.safeBlockVertical * 10,
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: SizedBox()),
                      Icon(Icons.business_center, color: Colors.green),
                      SizedBox(
                        width: ScreenUtil.getInstance().setWidth(20),
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'ID Gia Sư: ',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            TextSpan(
                              text: ' ${teacherData.id}',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(700),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          '${teacherData.full_name}',
                          style: TextStyle(
                            color: Colors.blue[400],
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                          flex: 8,
                        ),
                        _iconTextBox(
                            Text(
                              'Lưu',
                              style: TextStyle(
                                  fontSize: 15, fontStyle: FontStyle.normal),
                            ),
                            Icon(MaterialCommunityIcons.heart, size: 15),
                            null,
                            50),
                        Expanded(
                          child: SizedBox(),
                        ),
                        _iconTextBox(
                            Text(
                              'Bỏ thích',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white),
                            ),
                            Icon(MaterialCommunityIcons.thumb_up, size: 15),
                            Color.fromRGBO(47, 101, 174, 1),
                            50),
                        Expanded(child: SizedBox()),
                        _iconTextBox(
                            Text(
                              'Đánh giá',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white),
                            ),
                            Icon(
                              MaterialCommunityIcons.star,
                              size: 15,
                            ),
                            Color.fromRGBO(47, 101, 174, 1),
                            50),
                        Expanded(
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(thickness: 1),
                Container(
                  width: ScreenUtil.getInstance().setWidth(650),
                  child: Row(
                    children: <Widget>[
                      _iconTextBoxNoBorder(
                          Text(
                            '${teacherData.subject_text}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                            ),
                          ),
                          Icon(MaterialCommunityIcons.book),
                          null,
                          50),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 2,
                      ),
                      _iconTextBoxNoBorder(
                          Text(
                            '${(teacherData.tuition_fee / 1000).toInt()},000 vnđ/buổi',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(MaterialCommunityIcons.tag, color: Colors.red),
                          null,
                          50),
                    ],
                  ),
                ),
                SizedBox(
                  width: ScreenUtil.getInstance().setHeight(50),
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  width: ScreenUtil.getInstance().setWidth(650),
                  child: Row(
                    children: <Widget>[
                      _iconTextBoxNoBorder(
                          Text(
                            '${teacherData.location.name}',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 15,
                            ),
                          ),
                          Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          ),
                          null,
                          50),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal * 2,
                      ),
                      _iconTextBoxNoBorder(
                          Text(
                            'Gia sư Offline (tại nhà)',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.business_center, color: Colors.black),
                          null,
                          50),
                    ],
                  ),
                ),
                SizedBox(
                  width: ScreenUtil.getInstance().setHeight(50),
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(child: SizedBox()),
                      _box(teacherData.course_count, 'Lớp đã dạy'),
                      Expanded(child: SizedBox()),
                      _box(teacherData.like_count, 'Lượt thích'),
                      Expanded(child: SizedBox()),
                      _box(teacherData.promotion_coin, 'Lượt đánh giá'),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 90,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'THÔNG TIN GIA SƯ',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(47, 101, 174, 1),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: SizeConfig.safeBlockHorizontal * 5,
                  endIndent: SizeConfig.safeBlockHorizontal * 5,
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(10),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 5,
                      right: SizeConfig.safeBlockHorizontal * 5,
                      bottom: 20),
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SmallTextBoxWithBold('Thông tin cơ bản'),
                      SmallTextBox(
                        'Năm sinh: ' + teacherData.birthdate.substring(0, 4),
                      ),
                      SmallTextBox(
                        'Giới tính: ' + getGender(teacherData.gender),
                      ),
                      SmallTextBox('Quê quán: ' + teacherData.location.name),
                      SmallTextBox('Giọng nói: ' ),
                      SmallTextBox('Học vấn: '),
                      SmallTextBox(
                          'Đại học năm ${teacherData.school_year} - ${teacherData.specialism} - ${teacherData.university}'),
                      SmallTextBoxWithBold('Kinh nghiệm gia sư, giảng dạy'),
                      SmallTextBox('${teacherData.experience}'),
                      SmallTextBoxWithBold('Thành tích trong học tập và dạy học'),
                      SmallTextBox('${teacherData.achievement}'),
                    ],
                  ),
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 90,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'LỚP ĐÃ DẠY',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(47, 101, 174, 1),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: SizeConfig.safeBlockHorizontal * 5,
                  endIndent: SizeConfig.safeBlockHorizontal * 5,
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 90,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'LỊCH DẠY GIA SƯ',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(47, 101, 174, 1),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: SizeConfig.safeBlockHorizontal * 5,
                  endIndent: SizeConfig.safeBlockHorizontal * 5,
                ),
                SizedBox(
                    height: 10
                ),
                RichTextLine(),
                SelectedTimeColumn(),
                SizedBox(height: 20),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 100,
                  height: SizeConfig.safeBlockVertical * 10,
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: SizeConfig.safeBlockHorizontal * 30,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'VỊ TRÍ GIA SƯ',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            color: Color.fromRGBO(47, 101, 174, 1),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        width: SizeConfig.safeBlockHorizontal * 65,
                        // height: SizeConfig.safeBlockVertical * 20,
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                '${teacherData.address} ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    launch(
                                        'https://www.google.com/maps/place/38+Tr%E1%BA%A7n+Qu%C3%BD+Ki%C3%AAn,+D%E1%BB%8Bch+V%E1%BB%8Dng,+C%E1%BA%A7u+Gi%E1%BA%A5y,+H%C3%A0+N%E1%BB%99i,+Vi%E1%BB%87t+Nam/@21.0373781,105.7920155,17z/data=!3m1!4b1!4m5!3m4!1s0x3135ab37c1376ff7:0x245ac013cbc4304e!8m2!3d21.0373781!4d105.7920155?hl=vi-VNv');
                                  },
                                text: '( Xem bản đồ )',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  color: Colors.deepOrange,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: SizeConfig.safeBlockHorizontal * 3,
                  endIndent: SizeConfig.safeBlockHorizontal * 3,
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                Container(
                  width: SizeConfig.safeBlockHorizontal * 90,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'ĐÁNH GIÁ GIA SƯ',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(47, 101, 174, 1),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: SizeConfig.safeBlockHorizontal * 5,
                  endIndent: SizeConfig.safeBlockHorizontal * 5,
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  height: SizeConfig.safeBlockVertical * 5,
                  child: Container(
                    width: SizeConfig.safeBlockHorizontal * 25,
                    height: SizeConfig.safeBlockVertical * 5,
                    child: RaisedButton(
                      color: Color.fromRGBO(47, 101, 174, 1),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Mời dạy',
                        style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(30),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
