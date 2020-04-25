import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class SmallTextFieldInitialValue extends StatefulWidget {
  String infor;
  String initialValue;
  TextEditingController _controller;

  SmallTextFieldInitialValue(this.infor, this._controller, this.initialValue);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SmalltextFieldInitialValueState();
  }
}

class SmalltextFieldInitialValueState
    extends State<SmallTextFieldInitialValue> {
  String validate(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  TextEditingController myController;
  createMyController() {
    myController = TextEditingController()..text = "${widget.initialValue}";
    return myController;
  }

  @override
  Widget build(BuildContext context) {
    if(widget._controller.text == "") widget._controller.text = widget.initialValue;
    return Container(
      width: SizeConfig.safeBlockHorizontal * 85,
      height: 80,
      child: TextFormField(
        controller: widget._controller,
        style: TextStyle(
          fontSize: 18,
          color: black,
        ),
        onChanged: (String val){
          if(val != widget._controller.text){
            setState(() {
              widget._controller.text = val;
            });
          }
        },
        // onEditingComplete: () {
        //   setState(() {
        //     if (widget._controller.text == "")
        //       widget._controller.text = widget.initialValue;
        //   });
        // },
        autofocus: true,
        validator: validate,
        enableSuggestions: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          hintText: widget.infor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: black),
          ),
          hintStyle: TextStyle(
            fontSize: 18,
            color: black,
          ),
        ),
      ),
    );
  }
}
