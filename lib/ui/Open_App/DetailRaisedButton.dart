import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class DetailRaisedButton extends StatelessWidget {
  DetailRaisedButton({this.onPressed, this.subject, this.size, this.selected});
  final GestureTapCallback onPressed;
  final String subject;
  final int size;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
        subject,
        style: TextStyle(
          fontSize: ScreenUtil.getInstance().setSp(size),
          fontStyle: FontStyle.normal,
          color: selected ? black : Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: selected ? Colors.white : colorApp,
    );
  }
}
