import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/Helper/ScreenConfig.dart';

class Mails extends StatelessWidget {
  String title;
  String information;
  IconData icon;
  String time;
  Mails(this.icon, this.title, this.information, this.time);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Container(
      
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: SizeConfig.safeBlockHorizontal * 12,
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/momo.png',
              width: SizeConfig.safeBlockHorizontal * 8,
            ),
          ),
          Container(
            width: SizeConfig.safeBlockHorizontal * 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 1,
                ),
                Text(
                  information,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 1),
                Text(
                  time,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 2.5,
                      fontStyle: FontStyle.normal),
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 3),
              ],
            ),
          )
        ],
      ),
    );
  }
}
