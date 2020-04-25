import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/model/user.dart';
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
import 'package:test_giasu/ui/Widgets/SmallTextFieldInitialValue.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

import 'SubjectChoice.dart';

import 'SubjectChoice.dart';

class SpecialtyInfor extends StatefulWidget {
  DataUser _data;
  SpecialtyInfor(this._data);
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
  List<int> form_teaching_id;
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
          if(model.idEducation == null) model.setIdEducation(widget._data.education_level_id);
          // if(teaching_formID == null){
          //   for(var i in widget._data.form_teachings){
          //     form_teaching_id.add(i.id);
          //   }
          //   if(form_teaching_id == [1,2]){teaching_formID = 2;}
          //   else if(form_teaching_id == [1]){teaching_formID = 0;}
          //   else teaching_formID = 1;
          // }
          
          print(widget._data.subject);
          print(widget._data.topic);
          print(widget._data.form_teachings); 
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
                          padding:
                              EdgeInsets.only(top: 3.0, bottom: 5.0, left: 10),
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
                                child: Text('Bạn đang là',
                                    style: TextStyle(
                                        fontSize: 18.0, color: black)),
                                value: null,
                              ),
                              ...List.generate(model.education.length, (index) {
                                return DropdownMenuItem(
                                  child: Text('${model.education[index].name}',
                                      style: TextStyle(
                                          fontSize: 18.0, color: black)),
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
                        SmallTextFieldInitialValue("Tốt nghiệp trường", university,widget._data.university),
                        Container(
                          width: SizeConfig.safeBlockHorizontal * 85,
                          height: 80,
                          child: TextFormField(
                            autofocus: true,
                            validator: validate,
                            onSaved: (String val) {
                              school_year.text = val;
                              // if (val !=
                              //     model.authenticationService.identification_number) {
                              //   phone_number.text = val;
                              // }
                            },
                            keyboardType: TextInputType.phone,
                            controller: school_year,
                            enableSuggestions: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              hintText: "Năm tốt nghiệp",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintStyle: TextStyle(
                                fontSize: 18,
                               
                                color: black,
                              ),
                            ),
                          ),
                        ),
                        SmallTextFieldInitialValue("Chuyên ngành", specialism,widget._data.specialism),
                        Container(
                          padding:
                              EdgeInsets.only(top: 3.0, bottom: 5.0, left: 10),
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
                                        fontSize: 18.0, color: black)),
                                value: null,
                              ),
                              ...List.generate(form_teaching_list.length,
                                  (index) {
                                return DropdownMenuItem(
                                  child: Text('${form_teaching_list[index]}',
                                      style: TextStyle(
                                          fontSize: 18.0, color: black)),
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
                        SmallTextFieldInitialValue(
                            'Học phí vnđ/buổi (VD: 150.000)', tuition_fee,"${widget._data.tuition_fee}"),
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
                                padding: EdgeInsets.all(7),
                                width: SizeConfig.safeBlockHorizontal * 85,
                                
                                decoration: BoxDecoration(
                                  border: Border.all(color: black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Gia sư môn',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: black,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Expanded(child: SizedBox()),
                                    Icon(Icons.keyboard_arrow_right),
                                  ],
                                )),
                          ),
                        ),

                        SizedBox(height: 30),
                        SmallTextFieldInitialValue(
                            'Số lượng lớp đã dạy (VD: 5)', number_class, "${widget._data.number_class}"),
                        RichTextLine(),
                        SelectedTimeColumn(),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(50),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<PersonalInforModel>(
        builder: (_, model, __) {
          return Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(),
              ),
              Wrap(
                children: <Widget>[
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 35,
                    child: Text(
                      'Vui lòng cập nhập đầy đủ thông tin phía trên',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: SizeConfig.safeBlockHorizontal * 40),
              Consumer<SelectedTimeModel>(builder: (_, selectedModel, __) {
                List<Schedule> listSchedule = new List<Schedule>();
                List<int> schedules = new List<int>();
                List<int> form_teaching_listof = new List<int>();
                form_teaching_listof.add(teaching_formID);
                return Container(
                    width: SizeConfig.safeBlockHorizontal * 20,
                    child: RaisedButton(
                      color: colorApp,
                      onPressed: () async {
                        List<Map> scheduleList = new List<Map>();
                        for (int i = 0;
                            i < selectedModel.listSelected.length;
                            i++) {
                          if (selectedModel.listSelected[i] == true) {
                            var schedule = Schedule(
                                day: ((i - (i % 3)) ~/ 3), session: (i % 3));
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
                            (about_me.text == "") ? "null" : about_me.text;
                        model.personalInfor["achievement"] =
                            (achievement.text == "")
                                ? "null"
                                : achievement.text;
                        model.personalInfor["form_teaching_id"] = form_teaching_id;
                        // (teaching_formID == 2) ? [1,2] : [(teaching_formID +1)];
                        model.personalInfor["education_level_id"] =
                            model.idEducation.toString();
                        model.personalInfor["lng"] = "3.0";
                        model.personalInfor["lat"] = "2.0";
                        model.personalInfor["schedules"] = scheduleList;
                        //  model.personalInfor["role"] = "tutor";
                        //  model.personalInfor["id"] = 521;
                        //  model.personalInfor["username"] = "Kien";
                        //  model.personalInfor["identification_number"] = "0398567928";
                        model.personalInfor["university"] =
                            "Ironbarrow Technical College";
                        // university.text;
                        model.personalInfor["school_year"] = 2019;
                        model.personalInfor["company"] =
                            "Ironbarrow Technical College";
                        model.personalInfor["specialism"] = "Sư phạm Anh";
                        //specialism.text;
                        print(model.personalInfor.toString());
                        var success = await model
                            .personalInforCheckup(model.personalInfor);

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
                          color: Colors.white,
                        ),
                      ),
                    ));
              }),
              Expanded(
                child: SizedBox(),
              ),
            ],
          );
        },
      ),
    );
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
