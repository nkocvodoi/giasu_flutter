import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';

class LargeTextField extends StatefulWidget {
  String text;
  TextEditingController _controller;
  LargeTextField(this.text,this._controller);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LargeTextFieldState(text,_controller);
  }
}

class LargeTextFieldState extends State<LargeTextField> {
  String text;
  TextEditingController _controller;
  LargeTextFieldState(this.text,this._controller);
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
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 3,bottom: 3),
//      height: SizeConfig.blockSizeHorizontal * 20,
      width: SizeConfig.blockSizeHorizontal * 90,
      
        height: 120,
        child: TextFormField(
          validator: validate,
          onSaved: (String val){
            _controller.text = val;
          },
          controller: _controller,
          maxLines: 5,
          style: TextStyle(fontSize: 19.0),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: text,
              hintStyle: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.normal,
            color: Colors.grey[400],
          ),
              ),
        ),
      
   
      
    );
  }
}