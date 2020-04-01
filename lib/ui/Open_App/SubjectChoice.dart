// ignore: avoid_web_libraries_in_flutter
//setState
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/subjectservice.dart';
import 'package:test_giasu/core/model/topicService.dart';
import 'package:test_giasu/core/view_model/personalInforModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
//import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'DetailRaisedButton.dart';
import 'SubjectChoiceDetails.dart';

class SubjectChoice extends StatefulWidget {
  // Map personalInfor = new Map();
  // SubjectChoice(this.personalInfor);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SubjectChoiceState();
  }
}

class SubjectChoiceState extends State<SubjectChoice> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Topics> topicList = new List<Topics>();

  void fillLists(List<Subjects> subjects, List<Topics> first,
       List<Topics> data) {
    for (int j = data.length - 1; j >= 0; j--) {
      if (data[j].subject_id == subjects[0].id) {
        first.add(data[j]);
      }
      if (data[j].subject_id == subjects[1].id) {
        first.add(data[j]);
      }
      if (data[j].subject_id == subjects[2].id) {
        first.add(data[j]);
      }
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: new Text(value, textAlign: TextAlign.start),
        duration: Duration(seconds: 1),
      ),
    );
  }

  List<bool> listsBool = List.filled(25, true, growable: true);
  List<Subjects> listSubject = new List<Subjects>();
  List<Map> subjects = List();
  void onPressed(Subjects subject) {
    setState(() => listsBool[subject.id] = !listsBool[subject.id]);
    if (listsBool[subject.id] == false) {
      listSubject.add(subject);
      subjects.add(subject.toMap());
    }
    if (listsBool[subject.id] == true) {
      listSubject.removeWhere((item) => item.id == subject.id);
      subjects.removeWhere((element) => element["id"] == subject.toMap()["id"]);
      // firstTopicList = List();
      // secondTopicList = List();
      // thirdTopicList = List();
    }
  }

  Widget _subjectChoice(Subjects firstSubject, size1, Subjects secondSubject,
      size2, Subjects thirdSubject, size3) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 8,
          child: DetailRaisedButton(
            selected: listsBool[firstSubject.id],
            onPressed: () => onPressed(firstSubject),
            size: size1,
            subject: firstSubject.name,
          ),
        ),
        Expanded(
          child: SizedBox(),
        ),
        Expanded(
          flex: 8,
          child: DetailRaisedButton(
            subject: secondSubject.name,
            size: size2,
            selected: listsBool[secondSubject.id],
            onPressed: () => onPressed(secondSubject),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 8,
          child: DetailRaisedButton(
            subject: thirdSubject.name,
            size: size3,
            selected: listsBool[thirdSubject.id],
            onPressed: () => onPressed(thirdSubject),
          ),
        ),
        Expanded(
          child: SizedBox(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: buildPreviousButton(),
        backgroundColor: Color.fromRGBO(47, 101, 174, 1),
        title: Center(
            child: Text(
          'Lựa chọn môn dạy',
        )),
      ),
      body: Consumer<PersonalInforModel>(builder: (_, model, __) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: ScreenUtil.getInstance().setHeight(130),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 65,
                          alignment: Alignment.center,
                          color: Color.fromRGBO(47, 101, 174, 1),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 350,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.blue[400]),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Lựa chọn tối đa 3 môn',
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      Container(
                        child: Text(
                          '   Môn phổ thông',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil.getInstance().setSp(30),
                              color: Colors.blue),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _subjectChoice(model.subject[0], 30, model.subject[1], 30,
                          model.subject[2], 30),
                      _subjectChoice(model.subject[3], 30, model.subject[4], 25,
                          model.subject[5], 18),
                      _subjectChoice(model.subject[6], 25, model.subject[7], 27,
                          model.subject[8], 25),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                              flex: 8,
                              child: DetailRaisedButton(
                                subject: model.subject[9].name,
                                size: 25,
                                selected: listsBool[model.subject[9].id],
                                onPressed: () => onPressed(model.subject[9]),
                              )),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                              flex: 8,
                              child: DetailRaisedButton(
                                subject: model.subject[10].name,
                                size: 25,
                                selected: listsBool[model.subject[10].id],
                                onPressed: () => onPressed(model.subject[10]),
                              )),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                              flex: 8,
                              child: RaisedButton(
                                child: Text(
                                  "Môn khác",
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              )),
                          Expanded(child: SizedBox(), flex: 1),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text(
                          '   Môn ngoại ngữ',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil.getInstance().setSp(30),
                              color: Colors.blue),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _subjectChoice(model.subject[11], 25, model.subject[12],
                          25, model.subject[13], 25),
                      _subjectChoice(model.subject[14], 25, model.subject[15],
                          25, model.subject[16], 25),
                      Row(
                        children: <Widget>[
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                              flex: 8,
                              child: RaisedButton(
                                child: Text(
                                  "Ngoại ngữ khác",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 2.5),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                          Expanded(
                            flex: 19,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text(
                          '   Thể thao & Nghệ thuật',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil.getInstance().setSp(30),
                              color: Colors.blue),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _subjectChoice(model.subject[17], 25, model.subject[18],
                          26, model.subject[19], 27),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                              flex: 8,
                              child: DetailRaisedButton(
                                subject: model.subject[20].name,
                                size: 25,
                                selected: listsBool[model.subject[20].id],
                                onPressed: () => onPressed(model.subject[20]),
                              )),
                          Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                          Expanded(
                              flex: 8,
                              child: RaisedButton(
                                child: Text(
                                  "Thể thao khác",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 3),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              )),
                          Expanded(
                            flex: 10,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(180),
                  ),
                  Divider(thickness: 1),
                  Container(
                    height: ScreenUtil.getInstance().setHeight(100),
                    width: ScreenUtil.getInstance().setWidth(700),
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      color: Color.fromRGBO(47, 101, 174, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        'Lựa chọn',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil.getInstance().setSp(25),
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (listSubject.length <= 3 && listSubject.length >= 1) {
                          topicList = new List<Topics>();
                          fillLists(listSubject, topicList, model.topic);
                          for (int i = 0; i < topicList.length; i++) {
                            print(topicList[i].name);
                          }
                          
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubjectChoiceDetails(
                                    listSubject,
                                    topicList,
                                   ),
                              ));
                        } else if (listSubject.length == 0) {
                          showInSnackBar('Lựa chọn ít nhất 1 môn');
                        } else {
                          showInSnackBar('Lựa chọn tối đa 3 môn');
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
