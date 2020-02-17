import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: ScreenUtil.getInstance().setHeight(300),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: ScreenUtil.getInstance().setHeight(300),
          ),
          child: Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              reverse: true,
              child: SizedBox(
                height: ScreenUtil.getInstance().setHeight(300),
                child: TextField(
                  cursorColor: Colors.grey[400],
                  maxLines: 100,
                  decoration:InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 120.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: text,
                    hintStyle: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(30),
                      fontStyle: FontStyle.normal,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
