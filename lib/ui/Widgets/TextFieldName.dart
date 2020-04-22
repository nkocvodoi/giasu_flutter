import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class TextFieldName extends StatefulWidget{
  String text;
  TextEditingController name;
  TextFieldName(this.text,this.name);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFieldNameState();
  }
}
class TextFieldNameState extends State<TextFieldName>{
  String validateName(String value) {
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
          keyboardType: TextInputType.text,
//                            maxLength: 10,
          validator: validateName,
          onSaved: (String val) {
            widget.name.text = val;
            
          }),
    );
  }
}