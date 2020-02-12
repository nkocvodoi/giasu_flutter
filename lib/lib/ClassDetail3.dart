import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassDetail3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ClassDetail3State();
  }
}

class ClassDetail3State extends State<ClassDetail3> {
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
                width: ScreenUtil.getInstance().setWidth(170),
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
                width: ScreenUtil.getInstance().setWidth(160),
                height: ScreenUtil.getInstance().setHeight(50),
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

  Widget _teacherListBox(Image image, String name, String place, String subject,
      String fee, double distance, String moreInfor) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Column(children: <Widget>[
        Icon(
          Icons.portrait,
          size: 50,
        ),
        Text(
          name,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            fontSize: ScreenUtil.getInstance().setSp(30),
          ),
        ),
        Text(
          '$place | $subject',
          textAlign: TextAlign.left,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Text('$fee vnđ/buổi'),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: Icon(Icons.location_on),
            ),
            Expanded(
              flex: 2,
              child: Text('$distance km'),
            ),
          ],
        ),
        Divider(
          thickness: 1,
        ),
        Text(
          '$moreInfor',
          maxLines: 2,
        ),
        Container(
          //padding: EdgeInsets.only(left: 60),
          child:RaisedButton(
          
          onPressed: () {},
          color: Colors.blue[400],
          child: Text(
            'Mời dạy',
            style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getInstance().setSp(20),
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
        )
      ]),
    );
  }

  Widget _iconTextBox(Text text, Icon icon) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey),
          ),
      child: Row(
        children: <Widget>[
          icon,
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(20),
          ),
          text,
        ],
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
            'Chi tiết lớp học',
            textAlign: TextAlign.start,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              // child: Padding(
              //   padding: EdgeInsets.only(
              //     left: 28.0,
              //     right: 28.0,
              //     top: 10.0,
              //   ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: ScreenUtil.getInstance().setHeight(180),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: ScreenUtil.getInstance().setHeight(150),
                          alignment: Alignment.center,
                          color: Color.fromRGBO(47, 101, 174, 1),
                          child: Icon(Icons.portrait),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: ScreenUtil.getInstance().setWidth(600),
                            height: ScreenUtil.getInstance().setHeight(60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(),
                              color: Colors.white,
                            ),
                            child: Text(
                              'Tìm gia sư Tiếng Anh lớp 6 tại Cầu Giấy',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    // alignment: Alignment.center,
                    width: ScreenUtil.getInstance().setWidth(580),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        _iconTextBox(
                          Text(
                            'Trạng thái: Đang tìm gia sư',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: ScreenUtil.getInstance().setSp(30)),
                          ),
                          Icon(
                            Icons.portrait,
                            color: Colors.grey,
                          ),
                        ),
                        _iconTextBox(
                          Text(
                            'Mã lớp: 522 - Tiếng Anh |Lớp 6',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil.getInstance().setSp(30),
                            ),
                          ),
                          Icon(
                            Icons.home,
                            color: Colors.grey,
                          ),
                        ),
                        _iconTextBox(
                          Text(
                            'Hình thức học: Offline',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil.getInstance().setSp(30),
                            ),
                          ),
                          Icon(
                            Icons.school,
                            color: Colors.grey,
                          ),
                        ),
                        _iconTextBox(
                          Text(
                            'Số buổi/tuần: 2 (2h/buổi)',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil.getInstance().setSp(30),
                            ),
                          ),
                          Icon(
                            Icons.timelapse,
                            color: Colors.grey,
                          ),
                        ),
                        _iconTextBox(
                          Text(
                            'Số học viên: 1',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil.getInstance().setSp(30),
                            ),
                          ),
                          Icon(
                            Icons.person_outline,
                            color: Colors.grey,
                          ),
                        ),
                        _iconTextBox(
                          Text(
                            'Địa chỉ: 155 Cầu Giấy, Hà Nội',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil.getInstance().setSp(30),
                            ),
                          ),
                          Icon(
                            Icons.map,
                            color: Colors.grey,
                          ),
                        ),
                        _iconTextBox(
                          Text(
                            'Cách bạn: 2km',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil.getInstance().setSp(30),
                            ),
                          ),
                          Icon(
                            Icons.radio_button_checked,
                            color: Colors.grey,
                          ),
                        ),
                        _iconTextBox(
                          Text(
                            'Học phí/buổi: 150.000 vnđ/2h',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: ScreenUtil.getInstance().setSp(30),
                            ),
                          ),
                          Icon(
                            Icons.monetization_on,
                            color: Colors.grey,
                          ),
                        ),
                        _iconTextBox(
                          Text(
                            'Phí nhận lớp: 490.000 vnđ',
                            style: TextStyle(
                              color: Colors.blue[400],
                              fontSize: ScreenUtil.getInstance().setSp(30),
                            ),
                          ),
                          Icon(
                            Icons.attach_money,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(20),
                  ),
                  Container(
                    width: ScreenUtil.getInstance().setWidth(580),
                    height: ScreenUtil.getInstance().setHeight(150),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Chi tiết nội dung yêu cầu',
                      style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(30),
                        fontStyle: FontStyle.normal,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(10),
                  ),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Thời gian',
                          style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(30),
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        TextSpan(
                          text: '(màu',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.grey,
                            fontSize: ScreenUtil.getInstance().setSp(30),
                          ),
                        ),
                        TextSpan(
                          text: ' cam ',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.orange,
                            fontSize: ScreenUtil.getInstance().setSp(30),
                          ),
                        ),
                        TextSpan(
                          text: 'hiển thị thời gian có thể dạy)',
                          style: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.normal,
                            fontSize: ScreenUtil.getInstance().setSp(30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _selectedDay('Thứ 2', isSelected1, 50),
                  _selectedDay('Thứ 3', isSelected2, 50),
                  _selectedDay('Thứ 4', isSelected3, 50),
                  _selectedDay('Thứ 5', isSelected4, 50),
                  _selectedDay('Thứ 6', isSelected5, 50),
                  _selectedDay('Thứ 7', isSelected6, 50),
                  _selectedDay('Chủ nhật', isSelected7, 9),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(10),
                  ),
                  Text(
                    'Gợi ý gia sư phù hợp',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: ScreenUtil.getInstance().setSp(30),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(10),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(300),
                          height: ScreenUtil.getInstance().setHeight(100),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              hintText: 'Tìm kiếm từ khóa/ID gia sư',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: ScreenUtil.getInstance().setWidth(0),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.blue[400],
                            child: Text(
                              'Tìm kiếm',
                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                        flex: 1,
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(20)),
                  GridView.count(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Expanded(
                        child: _teacherListBox(null, 'name', 'place', 'subject',
                            'fee', 8, 'moreInfor'),
                      ),
                      Expanded(
                        child: _teacherListBox(null, 'name', 'place', 'subject',
                            'fee', 8, 'moreInfor'),
                      ),
                      Expanded(
                        child: _teacherListBox(null, 'name', 'place', 'subject',
                            'fee', 8, 'moreInfor'),
                      ),
                      Expanded(
                        child: _teacherListBox(null, 'name', 'place', 'subject',
                            'fee', 8, 'moreInfor'),
                      ),
                    ],
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
