import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';

class Mails extends StatelessWidget {
//  String title;
  String information;
//  IconData icon;
  String time;
  Mails( this.information, this.time);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: SizeConfig.safeBlockHorizontal * 12,
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/momo.png',
              width:30,
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: SizeConfig.safeBlockHorizontal * 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  information,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'UTM',
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 1),
                Text(
                  time,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.blue,
                      fontSize: 12,
                       fontFamily: 'UTM',),
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height:10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
