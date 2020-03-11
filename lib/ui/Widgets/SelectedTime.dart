import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/selectedModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';

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
        child: Padding(
          padding: EdgeInsets.all(10.0),
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
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                  fontStyle: FontStyle.normal,
                  color: Colors.black38,
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
                    width: SizeConfig.blockSizeHorizontal * (25),
                    height: SizeConfig.blockSizeVertical * (3),
                    child: Center(
                      child: Text(
                        'Buổi sáng',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 3,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * (25),
                    height: SizeConfig.blockSizeVertical * (3),
                    child: Center(
                      child: Text(
                        'Buổi chiều',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 3,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockSizeHorizontal * (23),
                    height: SizeConfig.blockSizeVertical * (3),
                    child: Center(
                      child: Text(
                        'Buổi tối',
                        style: TextStyle(
                          fontSize: SizeConfig.safeBlockHorizontal * 3,
                        ),
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
