import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/postRequestModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/Open_App/PersonInfor.dart';
import 'package:test_giasu/ui/Open_App/SubjectChoice.dart';
import 'package:test_giasu/ui/Open_App/Waiting_screen.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBarStudent.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInforDemo.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/UI_Main/SubjectChoiceForRequest.dart';
import 'package:test_giasu/ui/Widgets/ARichTextLine.dart';
import 'package:test_giasu/ui/Widgets/LargeTextField.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/ui/Widgets/SmallTextField.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'StudentInfor.dart';

class PostRequest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PostRequestState();
  }
}

class PostRequestState extends State<PostRequest> {
  final TextEditingController name = TextEditingController();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController grade = TextEditingController();
  final TextEditingController lesson_per_week = TextEditingController();
  final TextEditingController time_per_lesson = TextEditingController();
  final TextEditingController student_per_class = TextEditingController();
  final TextEditingController course_education = TextEditingController();
  final TextEditingController tutor_gender = TextEditingController();
  final TextEditingController form_teaching_id = TextEditingController();
  final TextEditingController _controller9 = TextEditingController();
  final TextEditingController _controller10 = TextEditingController();
  final TextEditingController _controller11 = TextEditingController();
  final TextEditingController _controller12 = TextEditingController();
  final TextEditingController _controller13 = TextEditingController();

  Map postRequestInfor = Map();
  GlobalKey<FormState> _key = GlobalKey();
  bool _validate = false;
  String validate(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
//      print("Name $name");
//      print("Mobile $mobile");
//      print("Email $email");
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Scaffold(
      body: Form(
        key: _key,
        autovalidate: _validate,
        child: NestedScrollView(headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: colorApp,
              expandedHeight: 40,
              leading: buildPreviousButton(),
//              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Đăng yêu cầu',
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                  child: PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 30,
                        alignment: Alignment.center,
                        color: Color.fromRGBO(47, 101, 174, 1),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: SizeConfig.blockSizeHorizontal * 90,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: TextField(
                              controller: name,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText:
                                    'VD: Tìm gia sư Tiếng Anh lớp 6 tại Cầu Giấy',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
            )
          ];
        }, body: Consumer<PostRequestModel>(builder: (_, model, __) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.white,
                            padding: EdgeInsets.only(bottom: 6),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SubjectChoiceForRequest()));
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: 3,
                                bottom: 3,
                              ),
                              width: SizeConfig.safeBlockHorizontal * 90,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'Môn học',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.grey[400],
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          SmallTextField('Lớp', grade),
                          SmallTextField('Số buổi học/tuần', lesson_per_week),
                          SmallTextField('Thời gian học/buổi', time_per_lesson),
                          SmallTextField('Số học viên/lớp', student_per_class),
                          SmallTextField('Đối tượng dạy', course_education),
                          SmallTextField('Giới tính gia sư', tutor_gender),
                          SmallTextField('Hình thức dạy', form_teaching_id),
                          SmallTextField('Học phí/buổi (vnđ)', _controller9),
                          SmallTextField('Điện thoại', _controller10),
                          SmallTextField('Địa điểm', _controller11),
                          SmallTextField('Địa chỉ học', _controller12),
                          LargeTextField(
                              'Nhập mô tả chi tiết nội dung muốn học',
                              _controller13),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RichTextLine(),
                    SelectedTimeColumn(),
                    Row(
                      children: <Widget>[
                        Wrap(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              width: SizeConfig.safeBlockHorizontal * 45,
//                  height: SizeConfig.safeBlockVertical * 7,
                              margin: EdgeInsets.all(5.0),
                              child: Text(
                                'Vui lòng cập nhật đầy đủ thông tin phía trên',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 15),
                          child: RaisedButton(
//              padding: EdgeInsets.only(),
                            color: Colors.blue[800],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              _sendToServer();
                              // model.setRole();
                              postRequestInfor["name"] = name.text;
                              postRequestInfor["grade"] = grade.text;
                              postRequestInfor["lesson_per_week"] =
                                  lesson_per_week.text;
                              postRequestInfor["time_per_lesson"] =
                                  time_per_lesson.text;
                              postRequestInfor["student_per_class"] =
                                  student_per_class.text;
                              postRequestInfor["course_education"] =
                                  course_education.text;
                              postRequestInfor["tutor_gender"] =
                                  tutor_gender.text;
                              postRequestInfor["form_teaching_id"] =
                                  form_teaching_id.text;
                              postRequestInfor["tuition_fee"] =
                                  _controller9.text;
                              postRequestInfor["phone_number"] =
                                  _controller10.text;
                              postRequestInfor["location_id"] =
                                  _controller11.text;
                              postRequestInfor["address"] = _controller12.text;
                              postRequestInfor["about_course"] =
                                  _controller13.text;
                              var postData =
                                  model.postRequest(postRequestInfor);
                              if (postData != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MyBottomNavigationBar(),
                                    ));
                              }
                            },
                            child: Text(
                              'Đăng yêu cầu',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        })),
      ),
//       bottomNavigationBar: Container(
// //        width: SizeConfig.blo
// //        height: SizeConfig.safeBlockVertical * 7,
//         decoration: BoxDecoration(),
//         child: Row(
//           children: <Widget>[
//             Wrap(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.only(left: 15),
//                   width: SizeConfig.safeBlockHorizontal * 45,
// //                  height: SizeConfig.safeBlockVertical * 7,
//                   margin: EdgeInsets.all(5.0),
//                   child: Text(
//                     'Vui lòng cập nhật đầy đủ thông tin phía trên',
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                       color: Colors.black38,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: SizedBox(),
//             ),
// //             Consumer<PostRequestModel>(builder: (_, model, __) {
// //               return Container(
// //                 padding: EdgeInsets.only(right: 15),
// //                 child: RaisedButton(
// // //              padding: EdgeInsets.only(),
// //                   color: Colors.blue[800],
// //                   shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(10)),
// //                   onPressed: () {
// //                     _sendToServer();
// //                     model.setRole();
// //                     postRequestInfor["name"] = _controller14.text;
// //                     // postRequestInfor["subject_id"] = _controller.text;
// //                     // postRequestInfor["topics"] = _controller1.text;
// //                     // postRequestInfor["grade"] = _controller2.text;
// //                     // postRequestInfor["lesson_per_week"] = _controller3.text;
// //                     // postRequestInfor["time_per_lesson"] = _controller4.text;
// //                     // postRequestInfor["student_per_class"] = _controller5.text;
// //                     // postRequestInfor["course_education"] = _controller6.text;
// //                     // postRequestInfor["tutor_gender"] = _controller7.text;
// //                     // postRequestInfor["form_teaching_id"] = _controller8.text;
// //                     // postRequestInfor["tuition_fee"] = _controller9.text;
// //                     // postRequestInfor["phone_number"] = _controller10.text;
// //                     // postRequestInfor["location_id"] = _controller11.text;
// //                     // postRequestInfor["address"] = _controller12.text;
// //                     // postRequestInfor["about_course"] = _controller13.text;
// //                     var sigupsuccess = model.postRequest(postRequestInfor);
// //                     if (sigupsuccess != null) {
// //                       if (model.role == 'tutor') {
// //                         return Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) => PersonInfor(),
// //                             ));
// //                       } else {
// //                         Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) => StudentInfor(),
// //                             ));
// //                       }
// //                     }
// //                   },
// //                   child: Text(
// //                     'Đăng yêu cầu',
// //                     style: TextStyle(
// //                       fontSize: 18,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //               );
// //             })
//           ],
//         ),
//       ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
