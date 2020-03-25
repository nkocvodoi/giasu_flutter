//setState
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/subjectchoiceModel.dart';
import 'package:test_giasu/ui/Open_App/SpecialtyInfor.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

import 'DetailRaisedButton.dart';

class SubjectChoiceDetails extends StatefulWidget {
  final List<String> data;
  Map personalInfor = new Map();
  SubjectChoiceDetails({Key key, @required this.data,this.personalInfor});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SubjectChoiceDetailsState(data,personalInfor);
  }
}

class SubjectChoiceDetailsState extends State<SubjectChoiceDetails> {
  final List<String> data;
  Map personalInfor = new Map();
  SubjectChoiceDetailsState(this.data,this.personalInfor);
  List<bool> listBools = List.filled(37, true, growable: true);
  List<String> listSubject = List();
  void onPressed(int n, String m) {
    setState(() => listBools[n] = !listBools[n]);
    if (listBools[n] == false) listSubject.add(m);
    if (listBools[n] == true) listSubject.remove(m);
  }
  // ignore: missing_return
  Widget _checkData(List data) {
    switch (data.length) {
      case 1:
        return Column(
          children: <Widget>[
            _subject('${data[0]}', 0),
          ],
        );
        break;
      case 2:
        return Column(
          children: <Widget>[
            _subject('${data[0]}', 0),
            _subject('${data[1]}', 6),
          ],
        );
        break;
      case 3:
        return Column(
          children: <Widget>[
            _subject('${data[0]}', 0),
            _subject('${data[1]}', 6),
            _subject('${data[2]}', 12),
          ],
        );
        break;
    }
  }

  Widget _subject(String subject, int n) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            child: Text(
              '     Môn $subject',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _rowOfChoices(n, '$subject cấp 3', 30, '$subject cấp 2', 30),
          _rowOfChoices(
              2 + n, '$subject cấp 1', 30, '$subject ôn thi Đại học', 23),
          _rowOfChoices(4 + n, '$subject ôn thi THPT', 25,
              '$subject luyện thi học sinh giỏi', 17),
        ]);
  }

  Widget _rowOfChoices(
      int n, String firstChoice, int size1, String secondChoice, int size2) {
    return Consumer<SubjectChoiceModel>(builder: (_, model, __) {
      return Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 8,
            child: DetailRaisedButton(
              subject: firstChoice,
              size: size1,
              selected: listBools[n],
              // model.count,
              onPressed: () => setState(() => listBools[n] = !listBools[n])
              // => model.change()
              ,
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Expanded(
            flex: 8,
            child: DetailRaisedButton(
              subject: secondChoice,
              size: size2,
              selected: listBools[n + 1],
              onPressed: () =>
                  setState(() => listBools[n + 1] = !listBools[n + 1]),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      );
    });
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
          style: TextStyle(
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.start,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _checkData(data),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(80),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SpecialtyInfor(personalInfor),
                            ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
