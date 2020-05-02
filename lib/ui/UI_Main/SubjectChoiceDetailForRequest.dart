//setState
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/subjectservice.dart';
import 'package:test_giasu/core/model/topicService.dart';
import 'package:test_giasu/core/view_model/personalInforModel.dart';
import 'package:test_giasu/core/view_model/postRequestModel.dart';
import 'package:test_giasu/core/view_model/subjectchoiceModel.dart';
import 'package:test_giasu/ui/Open_App/DetailRaisedButton.dart';
import 'package:test_giasu/ui/Open_App/SpecialtyInfor.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
import 'package:test_giasu/main.dart';

class SubjectChoiceDetailsForRequest extends StatefulWidget {
  List<Subjects> data;
  List<Topics> firstTopicList;
  List<Topics> secondTopicList;
  List<Topics> thirdTopicList;
  SubjectChoiceDetailsForRequest(this.data, this.firstTopicList, this.secondTopicList,
      this.thirdTopicList);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SubjectChoiceDetailsState();
  }
}

class SubjectChoiceDetailsState extends State<SubjectChoiceDetailsForRequest> {
  GlobalKey<FormState> _key1 = new GlobalKey();

  List<bool> listBools = List.filled(138, true, growable: true);
  List<Topics> listTopic = List();
  List<int> listTopicID = List();
  List<Map> topics = List();
  bool _validate = false;
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

  bool alreadyExist(int id) {
    for (var i in listTopic) {
      if (i.id == id) return true;
    }
    return false;
  }

  void onPressed(Topics topic) {
    setState(() => listBools[topic.id] = !listBools[topic.id]);

    if (listBools[topic.id] == false & alreadyExist(topic.id)) {
      listTopic.add(topic);
      listTopicID.add(topic.id);
    }
    if (listBools[topic.id] == true) {
      listTopic.removeWhere((item) => item.id == topic.id);
      listTopicID.remove(topic.id);
    }
  }

  // ignore: missing_return
  Widget _checkData(List<Subjects> data) {
    print(data.length);
    switch (data.length) {
      case 1:
        print(data.length);
        return Column(
          children: <Widget>[
            (data.length > 0)
                ? _subject(data[0], widget.firstTopicList)
                : SizedBox(),
          ],
        );
        break;
      case 2:
        print(data.length);
        return Column(
          children: <Widget>[
            (data.length > 0)
                ? _subject(data[0], widget.firstTopicList)
                : SizedBox(),
            (data.length > 1)
                ? _subject(data[1], widget.secondTopicList)
                : SizedBox(),
          ],
        );
        break;
      case 3:
        print(data.length);
        return Column(
          children: <Widget>[
            (data.length > 0)
                ? _subject(data[0], widget.firstTopicList)
                : SizedBox(),
            (data.length > 1)
                ? _subject(data[1], widget.secondTopicList)
                : SizedBox(),
            (data.length > 2)
                ? _subject(data[2], widget.thirdTopicList)
                : SizedBox(),
          ],
        );
        break;
    }
  }

  Widget _subject(Subjects a, List<Topics> topicList) {
    int n = topicList.length;
    print(n);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            child: Text(
              '     Môn ${a.name}',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          
          (n > 0) ? _rowOfChoices(topicList, n) : SizedBox(),
           (n > 2) ? _rowOfChoices(topicList, n - 2) : SizedBox(),
           (n > 4) ? _rowOfChoices(topicList, n - 4) : SizedBox(),
          (n > 6) ? _rowOfChoices(topicList, n - 6) : SizedBox(),
           (n > 8) ? _rowOfChoices(topicList, n - 8) : SizedBox(),
           (n > 10) ? _rowOfChoices(topicList, n - 10) : SizedBox(),
          (n > 12) ? _rowOfChoices(topicList, n - 12) : SizedBox(),
          (n > 14) ? _rowOfChoices(topicList, n - 14) : SizedBox(),
          (n > 16) ? _rowOfChoices(topicList, n - 16) : SizedBox(),
         
        ]);
  }

  Widget _rowOfChoices(List<Topics> topicList, int n) {
    print(n);
    if ((n - 2) >= 0) {
      var topic1 = topicList[n - 1];
      var topic2 = topicList[n - 2];
      return Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 8,
            child: DetailRaisedButton(
              subject: topic1.name,
              size: 23,
              selected: listBools[topic1.id],
              // model.count,
              onPressed: () => onPressed(topic1),
              // => model.change()
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Expanded(
            flex: 8,
            child: DetailRaisedButton(
              subject: topic2.name,
              size: 23,
              selected: listBools[topic2.id],
              // model.count,
              onPressed: () => onPressed(topic2),
              // => model.change()
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      );
    } else if (n == 1) {
      var topic1 = topicList[n - 1];
      return Row(
        children: <Widget>[
          Expanded(child: SizedBox(), flex: 1),
          Expanded(
            flex: 8,
            child: DetailRaisedButton(
              subject: topic1.name,
              size: 23,
              selected: listBools[topic1.id],
              // model.count,
              onPressed: () => onPressed(topic1),
              // => model.change()
            ),
          ),
          Expanded(
            child: SizedBox(),
            flex: 10,
          ),
        ],
      );
    }else
      return SizedBox(
        width: double.infinity,
      );
    
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    return Scaffold(
      appBar: AppBar(
        leading: buildPreviousButton(),
        
        backgroundColor: Color.fromRGBO(47, 101, 174, 1),
        centerTitle: true,
        title: Text(
          'Lựa chọn chủ đề',
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _checkData(widget.data),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(80),
                ),
                Divider(thickness: 1),
                Container(
                    height: ScreenUtil.getInstance().setHeight(100),
                    width: ScreenUtil.getInstance().setWidth(700),
                    alignment: Alignment.bottomRight,
                    child:
                        Consumer<PostRequestModel>(builder: (_, model, __) {
                      return RaisedButton(
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
                          print(listTopicID);
                          //  _saveToServer();
                          model.postRequestInfor["topic_id"] = listTopicID;
                          model.postRequestInfor['topics'] = listTopic;
                          model.postRequestInfor['subject_id']= widget.data[0].id;
                          var count = 0;
                          Navigator.popUntil(context, (route) {
                            return count++ == 2;
                          });
                        },
                      );
                    })),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
