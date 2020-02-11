import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialtyInfor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SpecialtyInforState();
  }
}

class _SpecialtyInforState extends State<SpecialtyInfor> {
  final isSelected1 = [false, false, false];
  final isSelected2 = [false, false, false];
  final isSelected3 = [false, false, false];
  final isSelected4 = [false, false, false];
  final isSelected5 = [false, false, false];
  final isSelected6 = [false, false, false];
  final isSelected7 = [false, false, false];
  Widget _selectedDay(String day, List<bool> isSelected, int space) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Text(
            day,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(30),
              fontStyle: FontStyle.normal,
              color: Colors.black38,
            ),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(space),
          ),
          ToggleButtons(
            borderWidth: 0.0,
            borderRadius: BorderRadius.circular(30.0),
            borderColor: Colors.blue,
            selectedBorderColor: Colors.blue,
            fillColor: Colors.orangeAccent,
            highlightColor: Colors.white,
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(140),
                height: ScreenUtil.getInstance().setHeight(60),
                child: Center(
                  child: Text(
                    'Buổi sáng',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(25),
                    ),
                  ),
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(140),
                height: ScreenUtil.getInstance().setHeight(60),
                child: Center(
                  child: Text(
                    'Buổi chiều',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(25),
                    ),
                  ),
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(140),
                height: ScreenUtil.getInstance().setHeight(60),
                child: Center(
                  child: Text(
                    'Buổi tối',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(25),
                    ),
                  ),
                ),
              ),
            ],
            onPressed: (int index) {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
            isSelected: isSelected,
          ),
        ],
      ),
    );
  }

  Widget _textField(String text) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(30),
            fontStyle: FontStyle.normal,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }

  Widget _largeTextFied(String text) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: ScreenUtil.getInstance().setHeight(300),
        child: new ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: ScreenUtil.getInstance().setHeight(300),
          ),
          child: new Scrollbar(
            child: new SingleChildScrollView(
              scrollDirection: Axis.vertical,
              reverse: true,
              child: SizedBox(
                height: ScreenUtil.getInstance().setHeight(300),
                child: new TextField(
                  maxLines: 100,
                  decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 120.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: text,
                    hintStyle: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(30),
                      fontStyle: FontStyle.normal,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 101, 174, 1),
        title: Center(
          child: Text(
            'HỒ SƠ CHUYÊN MÔN',
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 28.0,
                right: 28.0,
                top: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _largeTextFied('Kinh nghiệm gia sư & dạy học'),
                  _largeTextFied('Thành tích học tập & dạy học'),
                  _textField('Bạn đang là'),
                  _textField('Hình thức dạy'),
                  _textField('Học phí vnđ/buổi (VD: 150.000)'),
                  _textField('Gia sư môn (Dạng lưới: Chọn tối đa 3)'),
                  _textField('Số lượng lớp đã dạy (VD: 5)'),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Chọn thời gian',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(30),
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        TextSpan(
                          text: '(màu',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                            fontSize: ScreenUtil.getInstance().setSp(25),
                          ),
                        ),
                        TextSpan(
                          text: ' cam ',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.orange,
                            fontSize: ScreenUtil.getInstance().setSp(25),
                          ),
                        ),
                        TextSpan(
                          text: 'hiển thị thời gian có thể dạy)',
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil.getInstance().setSp(25),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _selectedDay('Thứ 2', isSelected1, 100),
                  _selectedDay('Thứ 3', isSelected2, 100),
                  _selectedDay('Thứ 4', isSelected3, 100),
                  _selectedDay('Thứ 5', isSelected4, 100),
                  _selectedDay('Thứ 6', isSelected5, 100),
                  _selectedDay('Thứ 7', isSelected6, 100),
                  _selectedDay('Chủ nhật', isSelected7, 59),
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
                                fontSize: ScreenUtil.getInstance().setSp(23),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: ScreenUtil.getInstance().setWidth(150),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          print('tap');
                        },
                        child: Text(
                          'Lưu lại',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(30),
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
