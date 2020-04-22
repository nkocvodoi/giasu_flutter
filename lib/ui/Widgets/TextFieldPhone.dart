import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class TextFieldPhone extends StatefulWidget{
  String text;
  TextEditingController phone;
  TextFieldPhone(this.text,this.phone);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFieldPhoneState();
  }
}
class TextFieldPhoneState extends State<TextFieldPhone>{
  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
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
          keyboardType: TextInputType.phone,
//                            maxLength: 10,
          validator: validateMobile,
          onSaved: (String val) {
            widget.phone.text = val;
            print(widget.phone.text);
          }),
    );
  }
}