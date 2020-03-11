import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';

class UnchangedSelectedTime extends StatelessWidget {
  bool isSelected1;
  bool isSelected2;
  bool isSelected3;
  List<bool> isSelected;

  String day;
  UnchangedSelectedTime(
      this.day, this.isSelected1, this.isSelected2, this.isSelected3);
  
  

  @override
  Widget build(BuildContext context) {
    isSelected = [isSelected1, isSelected2, isSelected3];
    SizeConfig().init(context);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(
        width: MediaQuery.of(context).size.width.toInt(),
        height: MediaQuery.of(context).size.height.toInt(),
        allowFontScaling: true);
    // TODO: implement build
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
              isSelected: isSelected,
            ),

            Expanded(child: SizedBox(), flex: 1),
          ],
        ),
      ),
    );
  }
}
