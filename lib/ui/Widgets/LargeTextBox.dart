import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class LargeTextBox extends StatelessWidget {
  String _text;
  LargeTextBox(this._text);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 5),
      width: SizeConfig.safeBlockHorizontal * 95,
      height: SizeConfig.safeBlockHorizontal * 25,
      decoration: BoxDecoration(
        border: Border.all(color: blue),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        _text,
        style: TextStyle(
          fontSize: 15,
          fontStyle: FontStyle.normal,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}
