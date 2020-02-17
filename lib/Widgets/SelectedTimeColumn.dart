import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/Widgets/SelectedTime.dart';

class SelectedTimeColumn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectedTimeColumnState();
  }
}

class SelectedTimeColumnState extends State<SelectedTimeColumn> {
  List<bool> isSelected = List.filled(3, false, growable: true);
  List<bool> isSelected1 = List.filled(3, false, growable: true);
  List<bool> isSelected2 = List.filled(3, false, growable: true);
  List<bool> isSelected3 = List.filled(3, false, growable: true);
  List<bool> isSelected4 = List.filled(3, false, growable: true);
  List<bool> isSelected5 = List.filled(3, false, growable: true);
  List<bool> isSelected6 = List.filled(3, false, growable: true);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SelectedTime('Thứ 2', isSelected, 100),
        SelectedTime('Thứ 3', isSelected1, 100),
        SelectedTime('Thứ 4', isSelected2, 100),
        SelectedTime('Thứ 5', isSelected3, 100),
        SelectedTime('Thứ 6', isSelected4, 100),
        SelectedTime('Thứ 7', isSelected5, 100),
        SelectedTime('Chủ nhật', isSelected6, 59),
      ],
    );
  }
}
