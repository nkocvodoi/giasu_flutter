import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_giasu/UI_Main/BottomNavigationBar.dart';

class Lists_Class extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Lists_Class_State();
  }
}

class _Lists_Class_State extends State<Lists_Class> {
  final Color _color = Color.fromRGBO(47, 101, 174, 1);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Center(
          child: Text(
            'Danh sách lớp gia sư',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      //bottomNavigationBar: MyBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: _color,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                _buildBox(),
              ],
            ),
            Positioned(
              top: 10,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 55,
                    width: 150,
                    child: Text(
                      'N kết quả',
                      style: TextStyle(
                          height: 1.7,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      color: _color,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0)),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 150,
                    child: ListTile(
                      title: Text(
                        'Bộ lọc',
                        style: TextStyle(
                            height: 0.8,
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {print('Tap');},
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                    ),
                    decoration: BoxDecoration(
                      color: _color,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBox() {
    return RaisedButton(
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        height: 190,
        width: 380,
        child: Padding(
          padding: EdgeInsets.only(left: 5.0, top: 7.0),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _iconTextBox(
                    'Mã lớp: 522 - Tiếng Anh lớp 6',
                    _color,
                    20.0,
                    Icon(Icons.account_box),
                  ),
                  _iconTextBox1(
                    'Gia sư Bình Minh',
                    Colors.deepOrange,
                    20.0,
                    Icon(Icons.account_box),
                  ),
                  _iconTextBox4(
                    'Số 55 Ngõ 31 Cầu Giấy, Hà Nội',
                    Colors.grey,
                    20.0,
                    Icon(Icons.account_box),
                  ),
                  _iconTextBox(
                    '150.000 vnd/2h - 2 buổi/tuần',
                    Colors.grey,
                    21.0,
                    Icon(Icons.account_box),
                  ),
                  _iconTextBox2(
                    'Cách bạn: 2 km',
                    Colors.grey,
                    20.0,
                    Icon(Icons.account_box),
                  ),
                  _iconTextBox3(
                    'Phí nhận lớp: 480,000 vnđ',
                    Colors.blue,
                    20.0,
                    Icon(Icons.account_box),
                  ),
                ],
              ),
//              Icon(Icons.arrow_forward_ios,
//              size: 50,
//                color: _color,
//              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blueAccent, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _iconTextBox(String _text, Color _c, double _a, Icon _icon) {
    return Container(
      child: Row(
        children: <Widget>[
          _icon,
          Text(
            _text,
            style: TextStyle(
              fontSize: _a,
              color: _c,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconTextBox1(String _text, Color _c, double _a, Icon _icon) {
    return Container(
      child: Row(
        children: <Widget>[
          _icon,
          Text(
            _text,
            style: TextStyle(
              height: 1.3,
              fontSize: _a,
              color: _c,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconTextBox2(String _text, Color _c, double _a, Icon _icon) {
    return Container(
      child: Row(
        children: <Widget>[
          _icon,
          Text(
            _text,
            style: TextStyle(
              height: 1.3,
              fontSize: _a,
              color: _c,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 110.0,
          ),
          Text(
            '0/6 đề nghị',
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: Colors.deepOrange,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconTextBox3(String _text, Color _c, double _a, Icon _icon) {
    return Container(
      child: Row(
        children: <Widget>[
          _icon,
          Text(
            _text,
            style: TextStyle(
              height: 1.3,
              fontSize: _a,
              color: _c,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 25.0,
          ),
          RaisedButton(
            padding: EdgeInsets.only(left: 2.0, right: 2.0),
            color: _color,
            onPressed: () {},
            child: Text(
              'Đề nghị dạy',
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconTextBox4(String _text, Color _c, double _a, Icon _icon) {
    return Container(
      child: Row(
        children: <Widget>[
          _icon,
          Text(
            _text,
            style: TextStyle(
              height: 1.3,
              fontSize: _a,
              color: _c,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: _color,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}
