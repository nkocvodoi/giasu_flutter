import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/Helper/ScreenConfig.dart';
 
class SelectedTime extends StatefulWidget {
  List<bool> isSelected;
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
  List<bool> isSelected;
  String day;
  int space;
  SelectedTimeState(this.day, this.isSelected, this.space);

  @override
  Widget build(BuildContext context) {
    
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
            ChangeNotifierProvider<Counter>(
              create: (_) => Counter(isSelected),
              child: Consumer<Counter>(
                builder: (_, counter, __) => ToggleButtons(
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
                   counter.change(index);
                  },
                  isSelected: isSelected,
                ),
              ),
            ),
            Expanded(child: SizedBox(), flex: 1),
          ],
        ),
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  List<bool> isSelected ;
  // bool _count = true;
  Counter(this.isSelected);
  void change(int index) {
    isSelected[index] = !isSelected[index];
    notifyListeners();
  }
}

