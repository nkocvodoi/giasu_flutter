import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/view_model/postRequestModel.dart';
import 'package:test_giasu/core/view_model/selectedModel.dart';
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

  final TextEditingController tuition_fee = TextEditingController();
  final TextEditingController grade = TextEditingController();
  final TextEditingController lesson_per_week = TextEditingController();
  final TextEditingController time_per_lesson = TextEditingController();
  final TextEditingController student_per_class = TextEditingController();
  final TextEditingController course_education = TextEditingController();
  final TextEditingController tutor_gender = TextEditingController();
  final TextEditingController form_teaching_id = TextEditingController();
  final TextEditingController from_date = TextEditingController();
  final TextEditingController phone_number = TextEditingController();
  final TextEditingController _controller11 = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController about_course = TextEditingController();

  Map postRequestInfor = Map();
  GlobalKey<FormState> _key = GlobalKey();
  List<String> className = [
    "5 tuổi",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "Khác"
  ];
  List<String> lesson_per_week_list = [
    "1 buổi",
    "2 buổi",
    "3 buổi",
    "4 buổi",
    "5 buổi",
    "6 buổi",
    "7 buổi",
  ];
  List<String> time_per_lesson_list = [
    "1h",
    "1.5h",
    "2h",
    "2.5h",
  ];
  List<int> student_per_class_list = [
    1,
    2,
  ];
  List<String> form_teaching_list = [
    "Gia sư Offline (tại nhà)",
    "Gia sư Online (trực tuyến)",
  ];
  DateTime _date = DateTime.now();
  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        from_date.text = formatDate(_date, [dd, '/', mm, '/', yyyy]);
      });
    }
  }

  bool dateTimeNull() {
    if (_date == null) return true;
    return false;
  }

  List<String> genderList = ["Nam", "Nữ", "Không yêu cầu"];
  int genderID;
  bool _validate = false;
  int classID;
  int lessonID;
  int timeID;
  int student_numberID;
  int teaching_formID;
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
            // SliverPersistentHeader(
            //   pinned: true,
            //   delegate: _SliverAppBarDelegate(
            //       child: PreferredSize(
            //     preferredSize: Size.fromHeight(40),
            //     child:
            //   ),
            // ),
            // )
          ];
        }, body: Consumer<PostRequestModel>(builder: (_, model, __) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
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
                                width: SizeConfig.blockSizeHorizontal * 85,
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
                                          fontSize: 16,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
                                width: SizeConfig.safeBlockHorizontal * 85,
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
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 3.0, bottom: 5.0, left: 10),
                              width: SizeConfig.safeBlockHorizontal * 85,
                              height: 50,
                              child: DropdownButton<int>(
                                autofocus: true,
                                underline: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  color: Colors.transparent,
                                ),
                                isExpanded: true,
                                value: classID,
                                items: [
                                  DropdownMenuItem(
                                    child: Text('Lớp',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.grey)),
                                    value: null,
                                  ),
                                  ...List.generate(14, (index) {
                                    return DropdownMenuItem(
                                      child: Text('${className[index]}',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.grey)),
                                      value: index,
                                    );
                                  }),
                                ],
                                onChanged: (int value) {
                                  if (value != classID) {
                                    setState(() {
                                      classID = value;
                                    });
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: black, width: 1.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 3.0, bottom: 5.0, left: 10),
                              width: SizeConfig.safeBlockHorizontal * 85,
                              height: 50,
                              child: DropdownButton<int>(
                                autofocus: true,
                                underline: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  color: Colors.transparent,
                                ),
                                isExpanded: true,
                                value: lessonID,
                                items: [
                                  DropdownMenuItem(
                                    child: Text('Số buổi học/tuần',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.grey)),
                                    value: null,
                                  ),
                                  ...List.generate(7, (index) {
                                    return DropdownMenuItem(
                                      child: Text(
                                          '${lesson_per_week_list[index]}',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.grey)),
                                      value: index,
                                    );
                                  }),
                                ],
                                onChanged: (int value) {
                                  if (value != lessonID) {
                                    setState(() {
                                      lessonID = value;
                                    });
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: black, width: 1.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 3.0, bottom: 5.0, left: 10),
                              width: SizeConfig.safeBlockHorizontal * 85,
                              height: 50,
                              child: DropdownButton<int>(
                                autofocus: true,
                                underline: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  color: Colors.transparent,
                                ),
                                isExpanded: true,
                                value: timeID,
                                items: [
                                  DropdownMenuItem(
                                    child: Text('Thời gian học/buổi',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.grey)),
                                    value: null,
                                  ),
                                  ...List.generate(4, (index) {
                                    return DropdownMenuItem(
                                      child: Text(
                                          '${time_per_lesson_list[index]}',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.grey)),
                                      value: index,
                                    );
                                  }),
                                ],
                                onChanged: (int value) {
                                  if (value != timeID) {
                                    setState(() {
                                      timeID = value;
                                    });
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: black, width: 1.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 3.0, bottom: 5.0, left: 10),
                              width: SizeConfig.safeBlockHorizontal * 85,
                              height: 50,
                              child: DropdownButton<int>(
                                autofocus: true,
                                underline: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  color: Colors.transparent,
                                ),
                                isExpanded: true,
                                value: student_numberID,
                                items: [
                                  DropdownMenuItem(
                                    child: Text('Số học viên/lớp',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.grey)),
                                    value: null,
                                  ),
                                  ...List.generate(2, (index) {
                                    return DropdownMenuItem(
                                      child: Text(
                                          '${student_per_class_list[index]}',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.grey)),
                                      value: index,
                                    );
                                  }),
                                ],
                                onChanged: (int value) {
                                  if (value != student_numberID) {
                                    setState(() {
                                      student_numberID = value;
                                    });
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: black, width: 1.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 3.0, bottom: 5.0, left: 10),
                              width: SizeConfig.safeBlockHorizontal * 85,
                              height: 50,
                              child: DropdownButton<int>(
                                autofocus: true,
                                underline: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  color: Colors.transparent,
                                ),
                                isExpanded: true,
                                value: model.idEducation,
                                items: [
                                  DropdownMenuItem(
                                    child: Text('Đối tượng dạy',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.grey)),
                                    value: null,
                                  ),
                                  ...List.generate(model.education.length,
                                      (index) {
                                    return DropdownMenuItem(
                                      child: Text(
                                          '${model.education[index].name}',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.grey)),
                                      value: model.education[index].id,
                                    );
                                  }),
                                ],
                                onChanged: (int value) {
                                  if (value != model.idEducation) {
                                    model.setIdEducation(value);
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: black, width: 1.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 3.0, bottom: 5.0, left: 10),
                              width: SizeConfig.safeBlockHorizontal * 85,
                              height: 50,
                              child: DropdownButton<int>(
                                autofocus: true,
                                underline: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  color: Colors.transparent,
                                ),
                                isExpanded: true,
                                value: genderID,
                                items: [
                                  DropdownMenuItem(
                                    child: Text('Giới tính gia sư',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.grey)),
                                    value: null,
                                  ),
                                  ...List.generate(3, (index) {
                                    return DropdownMenuItem(
                                      child: Text('${genderList[index]}',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.grey)),
                                      value: index,
                                    );
                                  }),
                                ],
                                onChanged: (int value) {
                                  if (value != genderID) {
                                    setState(() {
                                      genderID = value;
                                    });
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: black, width: 1.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 3.0, bottom: 5.0, left: 10),
                              width: SizeConfig.safeBlockHorizontal * 85,
                              height: 50,
                              child: DropdownButton<int>(
                                autofocus: true,
                                underline: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  color: Colors.transparent,
                                ),
                                isExpanded: true,
                                value: teaching_formID,
                                items: [
                                  DropdownMenuItem(
                                    child: Text('Hình thức dạy',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.grey)),
                                    value: null,
                                  ),
                                  ...List.generate(form_teaching_list.length,
                                      (index) {
                                    return DropdownMenuItem(
                                      child: Text(
                                          '${form_teaching_list[index]}',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.grey)),
                                      value: index,
                                    );
                                  }),
                                ],
                                onChanged: (int value) {
                                  if (value != teaching_formID) {
                                    setState(() {
                                      teaching_formID = value;
                                    });
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: black, width: 1.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            SizedBox(height: 30),
                            SmallTextField('Học phí/buổi (vnđ)', tuition_fee),
                            SmallTextField('Điện thoại', phone_number),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 3.0, bottom: 5.0, left: 10),
                              width: SizeConfig.safeBlockHorizontal * 85,
                              height: 50,
                              child: DropdownButton<int>(
                                autofocus: true,
                                underline: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  color: Colors.transparent,
                                ),
                                isExpanded: true,
                                value: model.idCity,
                                items: [
                                  DropdownMenuItem(
                                    child: Text('Địa điểm dạy',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.grey)),
                                    value: null,
                                  ),
                                  ...List.generate(model.city.length, (index) {
                                    return DropdownMenuItem(
                                      child: Text('${model.city[index].name}',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.grey)),
                                      value: model.city[index].id,
                                    );
                                  }),
                                ],
                                onChanged: (int value) {
                                  if (value != model.idCity) {
                                    model.setIdCity(value);
                                  }
                                },
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: black, width: 1.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            SizedBox(height: 30),
                            SmallTextField('Địa chỉ học', address),
                            Container(
                                padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                                width: SizeConfig.safeBlockHorizontal * 85,
                                height: 80,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 8,
                                      child: TextFormField(
                                        controller: from_date,
                                        autofocus: true,
                                        validator: validate,
                                        onSaved: (String val) {
                                          if (dateTimeNull()) {
                                            from_date.text = val;
                                          } else {
                                            from_date.text = formatDate(_date,
                                                [dd, '/', mm, '/', yyyy]);
                                          }
                                        },
                                        enableSuggestions: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 10),
                                          hintText: 'Ngày dự kiến học',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          hintStyle: TextStyle(
                                            fontSize: 18,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: black),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                                          icon: Icon(Icons.calendar_today),
                                          onPressed: () {
                                            selectDate(context);
                                          }),
                                    )),
                                  ],
                                )),
                            LargeTextField(
                                'Nhập mô tả chi tiết nội dung muốn học',
                                about_course),
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
                              child: Consumer<SelectedTimeModel>(
                                  builder: (_, selectedModel, __) {
                                List<Schedule> listSchedule =
                                    new List<Schedule>();
                                List<int> schedules = new List<int>();
                                List<int> form_teaching_list_of =
                                    new List<int>();
                                form_teaching_list_of.add(teaching_formID);
                                return RaisedButton(
                                  color: colorApp,
                                  onPressed: () async {
                                    List<Map> scheduleList = new List<Map>();
                                    for (int i = 0;
                                        i < selectedModel.listSelected.length;
                                        i++) {
                                      if (selectedModel.listSelected[i] ==
                                          true) {
                                        var schedule = Schedule(
                                            day: ((i - (i % 3)) ~/ 3),
                                            session: (i % 3));
                                        listSchedule.add(schedule);
                                        //schedules.add(schedule.id);
                                        scheduleList.add(schedule.toMap());
                                      }
                                    }
                                    _sendToServer();
                                    // model.setRole();
                                    postRequestInfor["name"] = "Kiên đi học";
                                    //name.text;
                                    postRequestInfor["grade"] = "12";
                                    //className[classID];
                                    postRequestInfor["lesson_per_week"] =
                                        "4 buổi";
                                    //lesson_per_week_list[lessonID];
                                    postRequestInfor["time_per_lesson"] = 1.5;
                                    // time_per_lesson_list[timeID];
                                    postRequestInfor["student_per_class"] = 2;
                                    //student_per_class_list[student_numberID];
                                    postRequestInfor["course_education"] = [
                                      {"id": 4, "name": "Người đi làm"}
                                    ];
                                    // [
                                    //   (model.education[model.idEducation - 1].name)
                                    // ];
                                    postRequestInfor["tutor_gender"] = 1;
                                    //(genderID + 1).toString();
                                    postRequestInfor["form_teaching_id"] = 1;
                                    //  (teaching_formID + 1);
                                    postRequestInfor["tuition_fee"] = "150000";
                                    // tuition_fee.text;
                                    postRequestInfor["phone_number"] =
                                        "0398567928";
                                    // phone_number.text;
                                    postRequestInfor["location_id"] = 13;
                                    //model.idCity;
                                    postRequestInfor["address"] = address.text;
                                    postRequestInfor["from_date"] =
                                        from_date.text;
                                    postRequestInfor["about_course"] =
                                        about_course.text;
                                    postRequestInfor["schedules"] =
                                        [Schedule(day: 1,session: 1), Schedule(day: 3, session: 1)];
                                    postRequestInfor["topics"] = [15];
                                    postRequestInfor["topic_id"] = [15];
                                    print(postRequestInfor);
                                    var postData = await model
                                        .postRequest(postRequestInfor);
                                    if (postData) {
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
                                );
                              }))
                        ],
                      ),
                    ],
                  ),
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
