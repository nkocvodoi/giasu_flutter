import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/view_model/filterModel.dart';
import 'package:test_giasu/core/view_model/personalInforModel.dart';
import 'package:test_giasu/core/view_model/selectedModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/ARichTextLine.dart';
import 'package:test_giasu/ui/Widgets/LargeTextField.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/ui/Widgets/SmallTextField.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

import 'SubjectChoice.dart';

import 'SubjectChoice.dart';

class SpecialtyInfor extends StatefulWidget {
  // Map personalInfor = new Map();
  // SpecialtyInfor(this.personalInfor);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SpecialtyInforState();
  }
}

class _SpecialtyInforState extends State<SpecialtyInfor> {
  GlobalKey<FormState> _key1 = new GlobalKey();
  bool _validate = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController university = TextEditingController();
  final TextEditingController school_year = TextEditingController();
  final TextEditingController tuition_fee = TextEditingController();
  final TextEditingController number_class = TextEditingController();
  final TextEditingController specialism = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController about_me = TextEditingController();
  final TextEditingController achievement = TextEditingController();
  final TextEditingController _controller9 = TextEditingController();
  
  List<String> form_teaching_list = [
    "Gia sư Offline (tại nhà)",
    "Gia sư Online (trực tuyến)",
    "Cả hai hình thức",
  ];
  int teaching_formID;

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: new Text(value, textAlign: TextAlign.start),
        duration: Duration(seconds: 1),
      ),
    );
  }

  _saveToServer() {
    if (_key1.currentState.validate()) {
      // No any error in validation
      _key1.currentState.save();
    } else {
      // validation error
      setState(() {
        _validate = true;
      });
    }
  }

  List<bool> isSelected;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: buildPreviousButton(),
          centerTitle: true,
          backgroundColor: colorApp,
          title: Text(
            'HỒ SƠ CHUYÊN MÔN',
            textAlign: TextAlign.start,
          ),
        ),
        body: Consumer<PersonalInforModel>(
          builder: (_, model, __) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                SingleChildScrollView(
                  child: Form(
                    key: _key1,
                    autovalidate: _validate,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          LargeTextField(
                              'Kinh nghiệm gia sư & dạy học', about_me),
                          SizedBox(height: 30),
                          LargeTextField(
                              'Thành tích học tập & dạy học', achievement),
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.only(
                                top: 3.0, bottom: 5.0, left: 10),
                            width: SizeConfig.safeBlockHorizontal * 90,
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
                                  child: Text('Bạn đang là',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.grey)),
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
                          SmallTextField("Tốt nghiệp trường", university),
                          // Container(
                          //   width: SizeConfig.safeBlockHorizontal * 90,
                          //   height: 80,
                          //   child: TextFormField(
                          //     autofocus: true,
                          //     validator: validate,
                          //     onSaved: (String val) {
                          //       school_year.text = val;
                          //       // if (val !=
                          //       //     model.authenticationService.identification_number) {
                          //       //   phone_number.text = val;
                          //       // }
                          //     },
                          //     keyboardType: TextInputType.phone,
                          //     controller: school_year,
                          //     enableSuggestions: true,
                          //     decoration: InputDecoration(
                          //       contentPadding: EdgeInsets.only(left: 10),
                          //       hintText: "Năm tốt nghiệp",
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10.0),
                          //       ),
                          //       hintStyle: TextStyle(
                          //         fontSize: 18,
                          //         fontFamily: 'UTM',
                          //         color: Colors.grey,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // SmallTextField("Chuyên ngành", specialism),
                          Container(
                            padding: EdgeInsets.only(
                                top: 3.0, bottom: 5.0, left: 10),
                            width: SizeConfig.safeBlockHorizontal * 90,
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
                                          fontSize: 18.0, color: Colors.grey)),
                                  value: null,
                                ),
                                ...List.generate(form_teaching_list.length,
                                    (index) {
                                  return DropdownMenuItem(
                                    child: Text('${form_teaching_list[index]}',
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
                          SmallTextField(
                              'Học phí vnđ/buổi (VD: 150.000)', tuition_fee),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 3, bottom: 3),
                            child: FlatButton(
                              // shape: RoundedRectangleBorder(
                              //     borderRadius: BorderRadius.circular(10.0)),

                              onPressed: () {
                                Navigator.pushNamed(context, '/subject');
                              },
                              child: Container(
                                padding: EdgeInsets.all(3.0),
                                width: SizeConfig.safeBlockHorizontal * 90,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Gia sư môn',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.grey[400],
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          SmallTextField(
                              'Số lượng lớp đã dạy (VD: 5)', number_class),
                          RichTextLine(),
                          SelectedTimeColumn(),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(50),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: <Widget>[
                              Wrap(
                                children: <Widget>[
                                  Container(
                                    width:
                                        ScreenUtil.getInstance().setWidth(300),
                                    height:
                                        ScreenUtil.getInstance().setHeight(150),
                                    margin: EdgeInsets.all(5.0),
                                    child: Text(
                                      'Vui lòng cập nhập đầy đủ thông tin phía trên',
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: ScreenUtil.getInstance().setWidth(200),
                              ),
                              Consumer<SelectedTimeModel>(
                                  builder: (_, selectedModel, __) {
                                List<Schedule> listSchedule =
                                    new List<Schedule>();
                                List<int> schedules = new List<int>();
                                List<int> form_teaching_listof = new List<int>();
                                form_teaching_listof.add(teaching_formID);
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
                                        schedules.add(schedule.id);
                                        scheduleList.add(schedule.toMap());
                                      }
                                    }
                                    print(listSchedule.length);
                                    _saveToServer();
                                    model.personalInfor["tuition_fee"] =
                                        (tuition_fee.text == "")
                                            ? "null"
                                            : tuition_fee.text;
                                    model.personalInfor["number_class"] =
                                        (number_class.text == "")
                                            ? "null"
                                            : number_class.text;
                                    model.personalInfor["about_me"] =
                                        (about_me.text == "")
                                            ? "null"
                                            : about_me.text;
                                    model.personalInfor["achievement"] =
                                        (achievement.text == "")
                                            ? "null"
                                            : achievement.text;
                                    model.personalInfor["form_teaching_id"] = [1];
                                        // (teaching_formID == 2) ? [1,2] : [(teaching_formID +1)];
                                    model.personalInfor["education_level_id"] =
                                       model.idEducation.toString();
                                    model.personalInfor["lng"] = "3.0";
                                    model.personalInfor["lat"] = "2.0";
                                    model.personalInfor["schedules"] =
                                        scheduleList;
                                    //  model.personalInfor["role"] = "tutor";
                                    //  model.personalInfor["id"] = 521;
                                    //  model.personalInfor["username"] = "Kien";
                                    //  model.personalInfor["identification_number"] = "0398567928";
                                    model.personalInfor["university"] = "Ironbarrow Technical College";
                                       // university.text;
                                    model.personalInfor["school_year"] = 2019;
                                    model.personalInfor["company"] = "Ironbarrow Technical College";
                                    model.personalInfor["specialism"] = "Sư phạm Anh";
                                        //specialism.text;
                                    print(model.personalInfor.toString());
                                    var success =
                                        await model.personalInforCheckup(
                                            model.personalInfor);

                                    if (success) {
                                      Navigator.pushNamed(context, '/home');
                                    } else {
                                      var _message = await model.Infor;
                                      showInSnackBar(_message);
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Lưu lại',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              })
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }

  String validate(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }
}
