import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'UnchangedSelectTime.dart';

class UnChangeddSelectTimeColumn extends StatelessWidget {
  List<int> day;
  List<int> session;


  List<bool> isSelected = List.filled(21, false, growable: true);
  
  @override
  Widget build(BuildContext context) {
    
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        UnchangedSelectedTime('Thứ 2', isSelected[0],isSelected[1],isSelected[2]),
        UnchangedSelectedTime('Thứ 3', isSelected[3] ,isSelected[4],isSelected[5]),
        UnchangedSelectedTime('Thứ 4', isSelected[6],isSelected[7],isSelected[8]),
        UnchangedSelectedTime('Thứ 5', isSelected[9],isSelected[10],isSelected[11]),
        UnchangedSelectedTime('Thứ 6', isSelected[12],isSelected[13],isSelected[14]),
        UnchangedSelectedTime('Thứ 7', isSelected[15],isSelected[16],isSelected[17]),
        UnchangedSelectedTime('Chủ nhật', isSelected[18],isSelected[19],isSelected[20]),
        
      ],
    );
  }
}
