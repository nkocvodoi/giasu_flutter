import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/UI_Main/Filter.dart';
import 'Post.dart';
import 'UI_Main/ClassDetail.dart';

// ignore: camel_case_types
class TestLists_Class extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Lists_Class_State();
  }
}

class _Lists_Class_State extends State<TestLists_Class> {
  final Color _color = Color.fromRGBO(47, 101, 174, 1);
  Future<Post> post;

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width.toInt();
    var height = MediaQuery.of(context).size.height.toInt();
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: width, height: height, allowFontScaling: true);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Center(
          child: Text(
            'Danh sách lớp gia sư',
            style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(30),
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
                  height: ScreenUtil.getInstance().setHeight(40),
                  decoration: BoxDecoration(
                    color: _color,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(50),
                ),
                _buildBox(),
              ],
            ),
            Positioned(
              top: ScreenUtil.getInstance().setHeight(10),
              child: Row(
                children: <Widget>[
                  Container(
                    height: ScreenUtil.getInstance().setHeight(55),
                    width: ScreenUtil.getInstance().setWidth(150),
                    child: Center(
                      child: Text(
                        'N kết quả',
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(25),
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
                    height: ScreenUtil.getInstance().setHeight(55),
                    width: ScreenUtil.getInstance().setWidth(150),
                    child: ListTile(
                      title: Text(
                        'Bộ lọc',
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().setSp(25),
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
    return FutureBuilder<Post>(
      future: post,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RaisedButton(
            padding: EdgeInsets.all(0.0),
            child: Container(
              alignment: Alignment.center,
              height: ScreenUtil.getInstance().setHeight(190),
              width: ScreenUtil.getInstance().setWidth(380),
              child: Padding(
                padding: EdgeInsets.only(left: 5.0, top: 7.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _iconTextBox(
                          'snapshot.data.title',
                          _color,
                          20,
                          Icon(Icons.account_box),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.blueAccent,
                    width: ScreenUtil.getInstance().setWidth(2)),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClassDetail(),
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }

  Widget _iconTextBox(String _text, Color _c, int _a, Icon _icon) {
    return Container(
      child: Row(
        children: <Widget>[
          _icon,
          Text(
            _text,
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(_a),
              color: _c,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
