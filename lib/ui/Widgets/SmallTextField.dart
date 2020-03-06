import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';

class SmallTextField extends StatelessWidget{
  String infor;
  SmallTextField(this.infor);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
      width: SizeConfig.safeBlockHorizontal * 90,
      height: 60,
      child: TextField(
        enableSuggestions: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          hintText: infor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }

}