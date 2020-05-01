import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/selectedModel.dart';
import 'package:test_giasu/ui/Widgets/SelectedTime.dart';

class SelectedTimeColumn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectedTimeColumnState();
  }
}

class SelectedTimeColumnState extends State<SelectedTimeColumn> {
  List<bool> isSelected;
//  List<bool> isSelected1 = List.filled(3, false, growable: true);
//  List<bool> isSelected2 = List.filled(3, false, growable: true);
//  List<bool> isSelected3 = List.filled(3, false, growable: true);
//  List<bool> isSelected4 = List.filled(3, false, growable: true);
//  List<bool> isSelected5 = List.filled(3, false, growable: true);
//  List<bool> isSelected6 = List.filled(3, false, growable: true);

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectedTimeModel>(
      builder: (_, model, __) {
        isSelected = model.isSelect;
        return Padding(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SelectedTime('Thứ 2', 100, 0),
              SelectedTime('Thứ 3', 100, 1),
              SelectedTime('Thứ 4', 100, 2),
              SelectedTime('Thứ 5', 100, 3),
              SelectedTime('Thứ 6', 100, 4),
              SelectedTime('Thứ 7', 100, 5),
              SelectedTime('Chủ nhật', 59, 6),
            ],
          ),
        );
      },
    );
  }
}
