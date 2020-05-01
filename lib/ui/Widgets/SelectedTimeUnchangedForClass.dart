import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/view_model/selectedModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class SelectedTimeUnchangedForClass extends StatelessWidget {
  List<Schedule> schedules;
  SelectedTimeUnchangedForClass({this.schedules});

  Widget _timeBox(String day, bool selected1, bool selected2, bool selected3) {
    return Container(
      width: 350,
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(children: <Widget>[
        Expanded(
          child: SizedBox(),
          flex: 1,
        ),
        Text(
          day,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 15,
            color: black,
          ),
        ),
        // SizedBox(
        //   width: ScreenUtil.getInstance().setWidth(space),
        // ),

        Expanded(
          child: SizedBox(),
          flex: 2,
        ),
        Container(
          width: 80,
          height: 45,
          alignment: Alignment.center,
          child: Text(
            'Buổi sáng',
            style: TextStyle(color: selected1 ? Colors.white : black),
          ),
          decoration: BoxDecoration(
            color: selected1 ? orange : Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0)),
          ),
        ),
        Container(
          width: 80,
          height: 45,
          alignment: Alignment.center,
          child: Text(
            'Buổi trưa',
            style: TextStyle(color: selected2 ? Colors.white : black),
          ),
          decoration: BoxDecoration(
              color: selected2 ? orange : Colors.white,
              border: Border(
                bottom: BorderSide(color: Colors.blue),
                top: BorderSide(color: Colors.blue),
              )),
        ),
        Container(
          width: 80,
          height: 45,
          alignment: Alignment.center,
          child: Text(
            'Buổi tối',
            style: TextStyle(color: selected3 ? Colors.white : black),
          ),
          decoration: BoxDecoration(
            color: selected3 ? orange : Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0)),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<bool> scheduleBool = List<bool>();
    int i = 0;
    int a = 0;
  
    while (a < 22) {
      if (a == schedules[i].id) {
        scheduleBool.add(true);
        i++;
      } else
        scheduleBool.add(false);
      a++;
    }
    if(schedules == null) scheduleBool = List.filled(22, false, growable: true );
    return Padding(
      padding: EdgeInsets.zero,
      child: Column(
        children: <Widget>[
          _timeBox('Thứ 2', scheduleBool[1], scheduleBool[2], scheduleBool[3]),
          _timeBox('Thứ 3', scheduleBool[4], scheduleBool[5], scheduleBool[6]),
          _timeBox('Thứ 4', scheduleBool[7], scheduleBool[8], scheduleBool[9]),
          _timeBox(
              'Thứ 5', scheduleBool[10], scheduleBool[11], scheduleBool[12]),
          _timeBox(
              'Thứ 6', scheduleBool[13], scheduleBool[14], scheduleBool[15]),
          _timeBox(
              'Thứ 7', scheduleBool[16], scheduleBool[17], scheduleBool[18]),
          _timeBox(
              'Chủ nhật', scheduleBool[19], scheduleBool[20], scheduleBool[21]),
        ],
      ),
    );
  }
}
