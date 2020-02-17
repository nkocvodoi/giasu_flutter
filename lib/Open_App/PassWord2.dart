import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_giasu/Open_App/Waiting_screen.dart';

import 'SignIn_Page.dart';

class PassWord2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _PassWord2State();
  }
}

class _PassWord2State extends State<PassWord2> {
  final TextEditingController _Box1 = new TextEditingController();
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();
  final focus5 = FocusNode();
  final focus6 = FocusNode();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
      ),
      body: new Column(
        children: <Widget>[
          new SizedBox(
            height: 35.0,
          ),
          new Container(
            alignment: Alignment.center,
            child: Text(
              'Nhập mã của bạn',
              style: TextStyle(fontSize: 30.0, color: Colors.indigo),
            ),
          ),
          new Padding(
            padding: EdgeInsets.all(10.0),
            child: new Text(
              'Hãy kiểm tra hộp thư SMS/Email của bạn',
              style: TextStyle(
                  fontSize: 18.0, color: Colors.black.withOpacity(0.8)),
            ),
          ),
          new Column(
            children: <Widget>[
              new Wrap(
                children: <Widget>[
                  _buildBox_first(focus1),
                  SizedBox(
                    width: 10.0,
                  ),
                  _buildBox(focus1, focus2),
                  SizedBox(
                    width: 10.0,
                  ),
                  _buildBox(focus2, focus3),
                  SizedBox(
                    width: 10.0,
                  ),
                  _buildBox(focus3, focus4),
                  SizedBox(
                    width: 10.0,
                  ),
                  _buildBox(focus4, focus5),
                  SizedBox(
                    width: 10.0,
                  ),
                  _buildBox_last(focus5),
                ],
              ),
              new Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  //color: Colors.deepOrange,
                  child: ListTile(
                    title: new Center(
                      child: Text(
                        'Tiếp tục',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignIn_Page()),
                      );
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange[300],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBox(FocusNode _a, FocusNode _b) {
    final TextEditingController _Box1 = new TextEditingController();
    return new Container(
      color: Colors.deepOrange[300],
      width: 52.0,
      height: 52.0,
      child: new TextFormField(
        //keyboardType: TextInputType.emailAddress,
        controller: _Box1,
        style: TextStyle(fontSize: 25.0),
        maxLength: 1,
        autofocus: true,
        focusNode: _a,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(_b);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.fromLTRB(21.0, 10.0, 10.0, 10.0),
          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }

  Widget _buildBox_first(FocusNode _a) {
    final TextEditingController _Box1 = new TextEditingController();
    return new Container(
      color: Colors.deepOrange[300],
      width: 52.0,
      height: 52.0,
      child: new TextFormField(
        //keyboardType: TextInputType.emailAddress,
        controller: _Box1,
        style: TextStyle(fontSize: 25.0),
        maxLength: 1,
        autofocus: true,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(_a);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.fromLTRB(21.0, 10.0, 10.0, 10.0),
          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }

  Widget _buildBox_last(FocusNode _a) {
    final TextEditingController _Box1 = new TextEditingController();
    return new Container(
      color: Colors.deepOrange[300],
      width: 52.0,
      height: 52.0,
      child: new TextFormField(
        //keyboardType: TextInputType.emailAddress,
        controller: _Box1,
        style: TextStyle(fontSize: 25.0),
        maxLength: 1,
        autofocus: true,
        focusNode: _a,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.fromLTRB(21.0, 10.0, 10.0, 10.0),
          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }
}
