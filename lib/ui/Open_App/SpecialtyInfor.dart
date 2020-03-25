import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SpecialtyInforState();
  }
}

class _SpecialtyInforState extends State<SpecialtyInfor> {
  
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();
  final TextEditingController _controller7 = TextEditingController();
  final TextEditingController _controller8 = TextEditingController();
  final TextEditingController _controller9 = TextEditingController();
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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LargeTextField('Kinh nghiệm gia sư & dạy học',_controller7),
                  LargeTextField('Thành tích học tập & dạy học',_controller8),
                  SmallTextField('Bạn đang là', _controller),
                  SmallTextField('Hình thức dạy', _controller1),
                  SmallTextField(
                      'Học phí vnđ/buổi (VD: 150.000)', _controller2),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 3, bottom: 3),
                    child: FlatButton(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubjectChoice(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      width: SizeConfig.safeBlockHorizontal * (90),
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
                  ),),
                  SmallTextField('Số lượng lớp đã dạy (VD: 5)', _controller3),
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
                            width: ScreenUtil.getInstance().setWidth(300),
                            height: ScreenUtil.getInstance().setHeight(150),
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
                        width: ScreenUtil.getInstance().setWidth(150),
                      ),
                      RaisedButton(
                        color: colorApp,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyBottomNavigationBar(currentIndex: 0)));
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
