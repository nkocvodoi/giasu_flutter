import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
  _SpecialtyInforState();
  GlobalKey<FormState> _key1 = new GlobalKey();
  bool _validate = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController tuition_fee = TextEditingController();
  final TextEditingController number_class = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController about_me = TextEditingController();
  final TextEditingController achievement = TextEditingController();
  final TextEditingController _controller9 = TextEditingController();

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
          backgroundColor: Color.fromRGBO(47, 101, 174, 1),
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
                              color: Colors.white,
                              border: Border.all(color: black, width: 1.5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
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
                              value: model.idFormTeaching,
                              items: [
                                DropdownMenuItem(
                                  child: Text('Hình thức dạy',
                                      style: TextStyle(
                                          fontSize: 18.0, color: Colors.grey)),
                                  value: null,
                                ),
                                ...List.generate(model.form_teaching.length,
                                    (index) {
                                  return DropdownMenuItem(
                                    child: Text(
                                        '${model.form_teaching[index].name}',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.grey)),
                                    value: model.education[index].id,
                                  );
                                }),
                              ],
                              onChanged: (int value) {
                                model.setIdFormTeaching(value);
                              },
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                              color: Colors.white,
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
                                return RaisedButton(
                                  color: colorApp,
                                  onPressed: () async {
                                    print(selectedModel.listSelected[0]);
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
                                    model.personalInfor["form_teaching_id"] =
                                        (model.idFormTeaching == null)
                                            ? "null"
                                            : model.idFormTeaching.toString();
                                    model.personalInfor["education_level_id"] =
                                        (model.idEducation == null)
                                            ? "null"
                                            : model.idEducation.toString();
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
}
