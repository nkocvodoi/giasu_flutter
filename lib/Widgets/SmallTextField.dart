import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallTextField extends StatelessWidget{
  String infor;
  SmallTextField(this.infor);
  @override
  Widget build(BuildContext context) {
     ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: infor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintStyle: TextStyle(
            fontSize: ScreenUtil.getInstance().setSp(30),
            fontStyle: FontStyle.normal,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }

}