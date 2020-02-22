import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_giasu/Helper/ScreenConfig.dart';
class RichTextLine extends StatelessWidget {
  RichTextLine();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: 'Thời gian',
            style: TextStyle(
              fontSize:  SizeConfig.safeBlockHorizontal*3,
              color: Colors.grey,
              fontStyle: FontStyle.normal,
            ),
          ),
          TextSpan(
            text: '(màu',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              color: Colors.grey,
              fontSize:  SizeConfig.safeBlockHorizontal*3,
            ),
          ),
          TextSpan(
            text: ' cam ',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              color: Colors.orange,
              fontSize:  SizeConfig.safeBlockHorizontal*3,
            ),
          ),
          TextSpan(
            text: 'hiển thị thời gian có thể dạy)',
            style: TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.normal,
              fontSize: SizeConfig.safeBlockHorizontal*3,
            ),
          ),
        ],
      ),
    );
  }
}
