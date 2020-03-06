import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';

class LargeTextField extends StatefulWidget {
  String text;

  LargeTextField(this.text);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LargeTextFieldState(text);
  }
}

class LargeTextFieldState extends State<LargeTextField> {
  String text;

  LargeTextFieldState(this.text);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Container(
//      height: SizeConfig.blockSizeHorizontal * 20,
      width: SizeConfig.blockSizeHorizontal * 90,
      child: SizedBox(
        height: 120,
        child: TextField(
          maxLines: 5,
          style: TextStyle(fontSize: 19.0),
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: text),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}