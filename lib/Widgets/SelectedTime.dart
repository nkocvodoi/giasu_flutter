import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedTime extends StatefulWidget {
  List<bool> isSelected ;
  String day;
  int space;
  SelectedTime(this.day, this.isSelected, this.space);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectedTimeState(day, isSelected, space);
  }
}

class SelectedTimeState extends State<SelectedTime> {
  List<bool> isSelected ;
  String day;
  int space;
  SelectedTimeState(this.day, this.isSelected, this.space);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Text(
            day,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(30),
              fontStyle: FontStyle.normal,
              color: Colors.black38,
            ),
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(space),
          ),
          ToggleButtons(
            disabledColor: Colors.white,
            selectedColor: Colors.white,
            borderWidth: 0.0,
            borderRadius: BorderRadius.circular(30.0),
            borderColor: Colors.blue,
            selectedBorderColor: Colors.blue,
            fillColor: Colors.orangeAccent,
            highlightColor: Colors.white,
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(140),
                height: ScreenUtil.getInstance().setHeight(60),
                child: Center(
                  child: Text(
                    'Buổi sáng',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(25),
                    ),
                  ),
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(140),
                height: ScreenUtil.getInstance().setHeight(60),
                child: Center(
                  child: Text(
                    'Buổi chiều',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(25),
                    ),
                  ),
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(140),
                height: ScreenUtil.getInstance().setHeight(60),
                child: Center(
                  child: Text(
                    'Buổi tối',
                    style: TextStyle(
                      fontSize: ScreenUtil.getInstance().setSp(25),
                    ),
                  ),
                ),
              ),
            ],
            onPressed: (int index) {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
            isSelected: isSelected,
          ),
        ],
      ),
    );
  }
}
