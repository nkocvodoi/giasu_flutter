import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class TextFieldPass extends StatefulWidget {
  String text;
  TextEditingController pass;
  TextFieldPass(this.text, this.pass);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFieldPassState();
  }
}

class TextFieldPassState extends State<TextFieldPass> {
  String validatePass(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TextFormField(
          //controller: _emailFilter,
          autofocus: true,
          obscureText: true,
          style: TextStyle(fontSize: 18.0),
          decoration: new InputDecoration(
              labelStyle: TextStyle(fontSize: 18.0), labelText: widget.text),
          keyboardType: TextInputType.visiblePassword,
//                            maxLength: 10,
          validator: validatePass,
          onSaved: (String val) {
            widget.pass.text = val;
          }),
    );
  }
}
