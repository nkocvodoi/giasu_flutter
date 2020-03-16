import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
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
              fontSize:  15,
              color: Colors.grey,
               fontFamily: 'UTM',
            ),
          ),
          TextSpan(
            text: '(màu',
            style: TextStyle(
               fontFamily: 'UTM',
              color: Colors.grey,
              fontSize:  15,
            ),
          ),
          TextSpan(
            text: ' cam ',
            style: TextStyle(
              fontFamily: 'UTM',
              color: orange,
              fontSize:  15,
            ),
          ),
          TextSpan(
            text: 'hiển thị thời gian có thể dạy)',
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'UTM',
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
