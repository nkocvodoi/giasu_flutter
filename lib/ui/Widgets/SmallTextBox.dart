import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallTextBox extends StatelessWidget {
  String infor;
  SmallTextBox(this.infor);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(3.0),
      child: Text(
        infor,
        style: TextStyle(
          fontSize: 15,
           fontFamily: 'UTM',
        ),
      ),
    );
  }
}
