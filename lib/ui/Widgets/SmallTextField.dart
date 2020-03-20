import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';

class SmallTextField extends StatelessWidget {
  String infor;
  TextEditingController _controller;
  SmallTextField(this.infor, this._controller);
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
    return Container(
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
      width: SizeConfig.safeBlockHorizontal * 90,
      height: 60,
      child: TextFormField(
        autofocus: true,
        validator: validate,
        onSaved: (String val) {
          _controller.text = val;
        },
        controller: _controller,
        enableSuggestions: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          hintText: infor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: TextStyle(
            fontSize: 20,
            fontFamily: 'UTM',
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
