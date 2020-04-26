import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class LargeTextFieldInitialValue extends StatefulWidget {
  String text;
  TextEditingController _controller;
  String initialValue;
  LargeTextFieldInitialValue(this.text,this._controller,this.initialValue);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LargeTextFieldState();
  }
}

class LargeTextFieldState extends State<LargeTextFieldInitialValue> {
  
  String validate(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Trường này không được để trống";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if(widget._controller.text == "") widget._controller.text = widget.initialValue;
    return Container(
      padding: EdgeInsets.only(top: 3,bottom: 3),
//      height: SizeConfig.blockSizeHorizontal * 20,
      width: SizeConfig.blockSizeHorizontal * 85,
      
        height: 150,
        child: TextFormField(
          validator: validate,
          
          onSaved: (String val){
            widget._controller.text = val;
          },
          controller: widget._controller,
          maxLines: 5,
          style: TextStyle(
          fontSize: 18,
          color: black,
        ),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: black),
              ),
              
              hintText: widget.text,
              hintStyle: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.normal,
            color: black,
          ),
              ),
        ),
      
   
      
    );
  }
}