import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/selectedModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class SelectedTime extends StatefulWidget {
//  List<bool> isSelected;
  String day;
  int space;
  int n;
  SelectedTime(this.day, this.space, this.n);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SelectedTimeState(day, space, n);
  }
}

class SelectedTimeState extends State<SelectedTime> {
//  List<bool> isSelected;
  String day;
  int space;
  int n;
  SelectedTimeState(this.day, this.space, this.n);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Consumer<SelectedTimeModel>(builder: (_, model, __) {
      return SafeArea(
        child: Container(
          width: 350,
          padding: EdgeInsets.only(top:10, bottom: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(),
                flex: 1,
              ),
              Text(
                day,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'UTM',
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
              ToggleButtons(
                disabledColor: black,
                selectedColor: Colors.white,
                borderWidth: 0.0,
                borderRadius: BorderRadius.circular(30.0),
                borderColor: Colors.blue,
                selectedBorderColor: Colors.blue,
                fillColor: orange,
                highlightColor: black,
                textStyle: TextStyle(
                  fontSize: 12,
                ),
                color: black,
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 30,
                    child: Center(
                      child: Text(
                        'Buổi sáng',
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 30,
                    child: Center(
                      child: Text(
                        'Buổi chiều',
                      ),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 30,
                    child: Center(
                      child: Text(
                        'Buổi tối',
                      ),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  model.setCount(!model.cout(n)[index], index, n);
                },
                isSelected: model.cout(n),
              ),
              Expanded(child: SizedBox(), flex: 1)
            ],
          ),
        ),
      );
    });
  }
}
