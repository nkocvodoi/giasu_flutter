import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/UI_Main/ClassDetail.dart';
import 'package:test_giasu/UI_Main/Filter.dart';

import 'package:test_giasu/fetchData/List_ClassData.dart';



final Color _color = Color.fromRGBO(47, 101, 174, 1);

class List_Box extends StatelessWidget {
  List<list_classData> box;

  List_Box({Key key, this.box}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: box.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10.0),
                  height: 190,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: RaisedButton(
                      onPressed: () {
                        print(MediaQuery.of(context).size);
                      },
                      padding: EdgeInsets.all(5.0),
                      child: Transform.scale(
                        scale: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _iconTextBox(
                              box[index].name,
                              _color,
                              20,
                              Icon(Icons.account_box),
                            ),
                            _iconTextBox(
                              'Gia sư Bình Minh',
                              Colors.deepOrange,
                              20,
                              Icon(Icons.account_box),
                            ),
                            _iconTextBox(
                              box[index].address,
                              Colors.grey,
                              20,
                              Icon(Icons.account_box),
                            ),
                            _iconTextBox(
                              '150.000 vnd/2h - 2 buổi/tuần',
                              Colors.grey,
                              21,
                              Icon(Icons.account_box),
                            ),
                            _iconTextBox2(
                              //2
                              'Cách bạn: 2 km',
                              Colors.grey,
                              20,
                              Icon(Icons.account_box),
                            ),
                            _iconTextBox3(
                              //3
                              'Phí nhận lớp: 480,000 vnđ',
                              Colors.blue,
                              20,
                              Icon(Icons.account_box),
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.blueAccent,
                        width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Positioned(
                  top: 90,
                  right: 10,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: _color,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _iconTextBox(String _text, Color _c,  _a, Icon _icon) {
    return Transform.scale(
      scale: 0.94,
      child: Container(
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
      ),
    );
  }

  Widget _iconTextBox2(String _text, Color _c, double _a, Icon _icon) {
    return Transform.scale(
      scale: 0.94,
      child: Container(
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
              width: 110,
            ),
            Center(
              child: Text(
                '0/6 đề nghị',
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconTextBox3(String _text, Color _c, double _a, Icon _icon) {
    return Transform.scale(
      scale: 0.94,
      child: Container(
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
              width: 25,
            ),
            RaisedButton(
              padding: EdgeInsets.only(left: 2.0, right: 2.0),
              color: _color,
              onPressed: () {},
              child: Text(
                'Đề nghị dạy',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TestList_Class extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Lists_Class_State();
  }
}

class _Lists_Class_State extends State<TestList_Class> {
  Future<List<list_classData>> list_class;

  @override
  void initState() {
    super.initState();
    list_class = fetchList_ClassData();
  }

  @override
  Widget build(BuildContext context) {
//    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
//    ScreenUtil.instance = ScreenUtil(
//        width: MediaQuery.of(context).size.width.toInt(),
//        height: MediaQuery.of(context).size.height.toInt(),
//        allowFontScaling: true);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Center(
          child: Text(
            'Danh sách lớp gia sư',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400),
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
                  height: 50,
                ),
                FutureBuilder<List<list_classData>>(
                  future: list_class,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return List_Box(
                        box: snapshot.data,
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

// By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                )
              ],
            ),
            Positioned(
              top: 10,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 55,
                    width: 150,
                    child: Center(
                      child: Text(
                        'N kết quả',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
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
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () {
                        print('Tap');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Filter(),
                          ),
                        );
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: _color,
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      ),
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
}
