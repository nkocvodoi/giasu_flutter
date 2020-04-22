import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class TextFieldEmail extends StatefulWidget{
  String text;
  TextEditingController email;
  TextFieldEmail(this.text,this.email);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFieldEmailState();
  }
}
class TextFieldEmailState extends State<TextFieldEmail>{
  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    } else if (!regExp.hasMatch(value)) {
      return "Email không đúng định dạng";
    } else {
      return null;
    }
  }
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: new TextFormField(
          //controller: _emailFilter,
          cursorColor: blue,
          autofocus: true,
          style: TextStyle(fontSize: 18.0),
          decoration: new InputDecoration(
            fillColor: blue,
              focusColor: blue,
              hoverColor: blue,
              labelStyle: TextStyle(fontSize: 18.0),
              labelText: widget.text),
          keyboardType: TextInputType.emailAddress,
//                            maxLength: 10,
          validator: validateEmail,
          onSaved: (String val) {
            widget.email.text = val;
            print(widget.email.text);
          }),
    );
  }
}
