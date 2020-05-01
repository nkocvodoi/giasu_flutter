import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:test_giasu/core/model/List_TeacherDetail.dart';
import 'package:test_giasu/core/model/currentUser.dart';
import 'package:test_giasu/core/model/user.dart';
import 'package:test_giasu/core/view_model/personalInforModel.dart';
import 'package:test_giasu/core/view_model/profileModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/ARichTextLine.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeUnchanged.dart';
import 'package:test_giasu/ui/Widgets/SmallTextBox.dart';
import 'package:test_giasu/ui/Widgets/SmallTextBoxWithBold.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
//  void initState() {
//    super.initState();
//    _profile = Provider.of<ProfileModel>(context).fetchProfile();
//  }
  String subject_text(List<Subject> subjects){
    String subject_string = subjects[0].name;
    int i =1;
    while(i< subjects.length){
      subject_string = "${subject_string}, ${subjects[i].name}" ;
      i++;
    }
    return subject_string;
  }

  String topic_text(List<Topic> topics){
    String topic_string = topics[0].name;
    int i = 1;
    while(i<topics.length){
      topic_string = "${topic_string}, ${topics[i].name}";
      i++;
    }
    return topic_string;
  }
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
              fontSize: SizeConfig.safeBlockHorizontal * 5,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Divider(thickness: 2, color: blue),
          Text(
            detail,
            style: TextStyle(
              fontSize: 15,
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
    return Consumer<PersonalInforModel>(builder: (_,model,__){
      return Scaffold(
      appBar: AppBar(
        backgroundColor: colorApp,
        leading: buildPreviousButton(),
        centerTitle: true,
        title: Text(
          'Chi tiết',
          textAlign: TextAlign.start,
        ),
      ),
      body: Center(
        child: FutureBuilder<DataUser>(
          future: Provider.of<ProfileModel>(context).fetchProfile(),
          builder: (context, snapshot) {
//            DataUser _test = await Provider.of<ProfileModel>(context).getdata();
            if(snapshot.hasData) {
//              print('logggg');
              
              DataUser _data = snapshot.data;
              
              return SingleChildScrollView(
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
                            color: colorApp,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: SizeConfig.safeBlockHorizontal * 40,
                              height: SizeConfig.safeBlockHorizontal * 40,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3, color: Colors.white),
                                color: Colors.white,
                              ),

                              child: Image.asset('assets/red.jpg'),
//                                    ),
//                                    child: Expanded(
//                                      child: Image.network(
//                                          'https://giasu.htcon.vn' + _data.avatar ),
//                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
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
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 5,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${_data.id}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 5,
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
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '${_data.full_name}',
                              style: TextStyle(
                                color: blue,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            // _iconTextBox(
                            //     Text(
                            //       'Bỏ thích',
                            //       style: TextStyle(
                            //           fontSize:
                            //               SizeConfig.safeBlockHorizontal * 3,
                            //           color: Colors.white),
                            //     ),
                            //     Icon(
                            //       MaterialCommunityIcons.thumb_up,
                            //       size: SizeConfig.safeBlockHorizontal * 3,
                            //       color: Colors.white,
                            //     ),
                            //     colorApp,
                            //     50),
                            // SizedBox(width: 10),
                            // _iconTextBox(
                            //     Text(
                            //       'Đánh giá',
                            //       style: TextStyle(
                            //           fontSize:
                            //               SizeConfig.safeBlockHorizontal * 3,
                            //           color: Colors.white),
                            //     ),
                            //     Icon(
                            //       MaterialCommunityIcons.star,
                            //       size: SizeConfig.safeBlockHorizontal * 3,
                            //       color: Colors.white,
                            //     ),
                            //     colorApp,
                            //     50),
                            // SizedBox(
                            //   width: 20,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Divider(thickness: 1),
                    Row(
                      children: <Widget>[
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 1),
                        Icon(MaterialCommunityIcons.book),
                        SizedBox(width: 5),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: SizeConfig.safeBlockHorizontal * 20,
                            maxWidth: SizeConfig.safeBlockHorizontal * 50,
                            minHeight: SizeConfig.safeBlockHorizontal * 5,
                            maxHeight: SizeConfig.safeBlockHorizontal * 10,
                          ),
                          child: AutoSizeText(
                            "${subject_text(_data.subjects)}",
                            maxFontSize: 16,
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          MaterialCommunityIcons.tag,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${_data.tuition_fee} vnđ/buổi',
                          style: TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 1),
                        Icon(
                          Icons.location_on,
                          color: blue,
                        ),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 1),
                        Text(
                          '${model.city[_data.location_id - 1].name}',
                          style: TextStyle(
                            color: blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 3),
                        Icon(Icons.business_center, color: Colors.black),
                        SizedBox(width: SizeConfig.safeBlockHorizontal * 1),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: SizeConfig.safeBlockHorizontal * 20,
                            maxWidth: SizeConfig.safeBlockHorizontal * 70,
                            minHeight: SizeConfig.safeBlockHorizontal * 3,
                            maxHeight: SizeConfig.safeBlockHorizontal * 5,
                          ),
                          child: AutoSizeText(
                            // (_data.form_teachings.length == 2)
                            //     ? _data.form_teachings[0].name +
                            //         ', ' +
                            //         _data.form_teachings[1].name
                            //     : "${_data.form_teachings[0].name}",
                            "null",
                            maxLines: 1,
                            maxFontSize: 16,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: SizeConfig.safeBlockHorizontal * 30,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(child: SizedBox()),
                          _box(
                              (_data.number_class == null)
                                  ? 0
                                  : _data.number_class,
                              'Lớp đã dạy'),
                          Expanded(child: SizedBox()),
                          _box(
                              (_data.booking == null) ? 0 : _data.booking,
                              'Lượt thích'),
                          Expanded(child: SizedBox()),
                          _box(
                              (_data.promotion_coin == null)
                                  ? 0
                                  : _data.promotion_coin,
                              'Lượt đánh giá'),
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
                          color: blue,
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
                            'Năm sinh: ${_data.birthdate} ',
                          ),
                          SmallTextBox(
                            'Giới tính: ${(_data.gender == 1) ? "Nam" : "Nữ"} ',
                          ),
//                                SmallTextBox('Quê quán: ${_data.native_country.name}' ),
//                                SmallTextBox('Giọng nói: ${_data.voice.name}' ),
//                                SmallTextBox('Học vấn: ${_data.education_level.name}'),
                          SmallTextBox(
                              'Đại học năm: ${_data.school_year}-${_data.specialism}-${_data.university}'),
                          SmallTextBoxWithBold('Kinh nghiệm gia sư, giảng dạy'),
                          SmallTextBox('${_data.experience}'),
                          SmallTextBoxWithBold(
                              'Thành tích trong học tập và dạy học'),
                          SmallTextBox('${_data.achievement}'),
                          SmallTextBoxWithBold('Chủ đề dạy'),
                          SmallTextBox("${topic_text(_data.topics)}"),
//                                ListView.builder(
//                                  itemCount: _data.subject.length,
//                                  itemBuilder: (BuildContext context, int index) {
//                                    return SmallTextBox('${_data.subject[index].name}');
//                                  },
//                                ),
                          // SmallTextBox('${_data.subject}'),
                          SmallTextBoxWithBold('Gia sư đang là'),
                                SmallTextBox('${model.education[_data.education_level_id -1].name}'),
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
                          color: blue,
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
                          color: blue,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      indent: SizeConfig.safeBlockHorizontal * 5,
                      endIndent: SizeConfig.safeBlockHorizontal * 5,
                    ),
                    SizedBox(height: 10),
                    RichTextLine(),
                    SelectedTimeUnchanged(),
                    SizedBox(height: 20),
                    Container(
                      width: SizeConfig.safeBlockHorizontal * 90,
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
                                color: blue,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            alignment: Alignment.bottomRight,
                            width: SizeConfig.safeBlockHorizontal * 55,
// height: SizeConfig.safeBlockVertical * 20,
                            child: (_data.address != null)
                                ? RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "${_data.address}",
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
                                  )
                                : SizedBox(),
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
                          color: blue,
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
                  ],
                ),
              );
            } else {
              print("nope");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  
    },);
    }
}
