// ignore: avoid_web_libraries_in_flutter
//setState
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
//import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'DetailRaisedButton.dart';
import 'SubjectChoiceDetails.dart';


class SubjectChoice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return SubjectChoiceState();
  }
}

class SubjectChoiceState extends State<SubjectChoice> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
       SnackBar(
        content: new Text(value, textAlign: TextAlign.start),
        duration: Duration(seconds: 1),
      ),
    );
  }

  List<bool> listsBool = List.filled(25, true, growable: true);
  List<String> listSubject = List();
  void onPressed(int n, String m) {
    setState(() => listsBool[n] = !listsBool[n]);
    if (listsBool[n] == false) listSubject.add(m);
    if (listsBool[n] == true) listSubject.remove(m);
  }

  Widget _subjectChoice(
    int n,
    String subject1,
    int size1,
    String subject2,
    int size2,
    String subject3,
    int size3,
  ) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 5,
          child: DetailRaisedButton(
            selected: listsBool[n],
            onPressed: () => onPressed(n, subject1),
            size: size1,
            subject: subject1,
          ),
        ),
        Expanded(
          child: SizedBox(),
        ),
        Expanded(
          flex: 5,
          child: DetailRaisedButton(
            subject: subject2,
            size: size2,
            selected: listsBool[n + 1],
            onPressed: () => onPressed(n + 1, subject2),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 5,
          child: DetailRaisedButton(
            subject: subject3,
            size: size3,
            selected: listsBool[n + 2],
            onPressed: () => onPressed(n + 2, subject3),
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
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
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
                          height: ScreenUtil.getInstance().setHeight(100),
                          alignment: Alignment.center,
                          color: Color.fromRGBO(47, 101, 174, 1),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: ScreenUtil.getInstance().setWidth(600),
                            height: ScreenUtil.getInstance().setHeight(100),
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
                                  fontSize: ScreenUtil.getInstance().setSp(30),
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
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      _subjectChoice(0, 'Toán', 30, 'Lý', 30, 'Hóa', 30),
                      _subjectChoice(3, 'Văn', 30, 'Tiếng Việt', 25,
                          'Toán + Tiếng Việt', 18),
                      _subjectChoice(
                          6, 'Lịch sử', 25, 'Địa lý', 27, 'Sinh học', 25),
                      _subjectChoice(
                          9, 'Luyện chữ', 24, 'Tin học', 27, 'Môn khác', 24),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
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
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      _subjectChoice(12, 'Tiếng Anh', 25, 'Tiếng Nhật', 25,
                          'Tiếng Hàn', 25),
                      _subjectChoice(15, 'Tiếng Trung', 25, 'Tiếng Đức', 25,
                          'Tiếng Pháp', 25),
                      Row(
                        children: <Widget>[
                          Expanded(flex: 1, child: SizedBox()),
                          Expanded(
                              flex: 5,
                              child: DetailRaisedButton(
                                subject: 'Ngoại ngữ khác',
                                size: 17,
                                onPressed: () =>
                                    onPressed(18, 'Ngoại ngữ khác'),
                                selected: listsBool[18],
                              )),
                          Expanded(
                            flex: 13,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
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
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      _subjectChoice(
                          19, 'Âm nhạc', 25, 'Hội họa', 26, 'Dance', 27),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                              flex: 5,
                              child: DetailRaisedButton(
                                subject: 'Thể thao',
                                size: 25,
                                selected: listsBool[22],
                                onPressed: () => onPressed(22, 'Thể thao'),
                              )),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                              flex: 5,
                              child: DetailRaisedButton(
                                subject: 'Nghệ thuật khác',
                                size: 20,
                                selected: listsBool[23],
                                onPressed: () =>
                                    onPressed(23, 'Nghệ thuật khác'),
                              )),
                          Expanded(
                            flex: 7,
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
                        print(listSubject);
                        if (listSubject.length <= 3 && listSubject.length > 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SubjectChoiceDetails(data: listSubject),
                              ));
                        } else if (listSubject.length == 0) {
                            showInSnackBar('Lựa chọn ít nhất 1 môn');

                            // final snackBar = SnackBar(
                            //   content: Text('Yay! A SnackBar!'),
                            //   action: SnackBarAction(
                            //     label: 'Undo',
                            //     onPressed: () {
                            //       // Some code to undo the change.
                            //     },
                            //   ),
                            // );

                            // // Find the Scaffold in the widget tree and use
                            // // it to show a SnackBar.
                            // Scaffold.of(context).showSnackBar(snackBar);
                          } 
                          else {
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
        ),
      ),
    );
  }
}
