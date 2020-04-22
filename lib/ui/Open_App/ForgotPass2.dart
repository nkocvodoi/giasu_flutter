import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

import 'SignIn_Page.dart';

class ForgotPass2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ForgotPass2State();
  }
}

class _ForgotPass2State extends State<ForgotPass2> {
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
        leading: buildPreviousButton(),
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
              style: TextStyle(fontSize: 25, color: blue),
            ),
          ),
          new Padding(
            padding: EdgeInsets.all(10.0),
            child: new Text(
              'Hãy kiểm tra hộp thư SMS/Email của bạn',
              style: TextStyle(
                  fontSize: 15.0, color: Colors.black.withOpacity(0.8)),
            ),
          ),
          SizedBox(height: 10),
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
              SizedBox(height: 30),
              Container(
                width: 300,
                  //color: Colors.deepOrange,
                  child: ListTile(
                    title: new Center(
                      child: Text(
                        'Tiếp tục',
                        style: TextStyle(
                          fontSize: 25,
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
                    color: orange,
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
      color: orange,
      width: 40,
      height:  40,
      child: new TextFormField(
        //keyboardType: TextInputType.emailAddress,
        controller: _Box1,
        style: TextStyle(fontSize: 20,),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.phone,
        maxLength: 1,
        autofocus: true,
        focusNode: _a,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(_b);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counterText: '',
          // contentPadding: EdgeInsets.fromLTRB(21.0, 10.0, 10.0, 10.0),
          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }

  Widget _buildBox_first(FocusNode _a) {
    final TextEditingController _Box1 = new TextEditingController();
    return new Container(
      color: orange,
      width: 40,
      height:  40,
      child: new TextFormField(
        //keyboardType: TextInputType.emailAddress,
        controller: _Box1,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.phone,
        autofocus: true,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(_a);
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counterText: '',
          // contentPadding: EdgeInsets.fromLTRB(21.0, 10.0, 10.0, 10.0),
          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }

  Widget _buildBox_last(FocusNode _a) {
    final TextEditingController _Box1 = new TextEditingController();
    return new Container(
      color: orange,
      width: 40,
      height: 40,
      child: new TextFormField(
        //keyboardType: TextInputType.emailAddress,
        controller: _Box1,
        style: TextStyle(fontSize: 20),
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        maxLength: 1,
        autofocus: true,
        focusNode: _a,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          counterText: '',
          // contentPadding: EdgeInsets.fromLTRB(21.0, 10.0, 10.0, 10.0),
          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      ),
    );
  }
}