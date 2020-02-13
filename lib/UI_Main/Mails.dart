import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Mails extends StatelessWidget {
  String title;
  String information;
  IconData icon;
  String time;
  Mails(this.icon, this.title, this.information, this.time);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil.getInstance().setWidth(700),
      
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          
          Container(
            width: ScreenUtil.getInstance().setWidth(100),
            height: ScreenUtil.getInstance().setHeight(300),
            alignment: Alignment.topCenter,
            child: Image.asset('lib/assets/momo.png',width: ScreenUtil.getInstance().setWidth(60),),
          ),
          Container(
            
            width: ScreenUtil.getInstance().setWidth(600),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: <Widget>[
                
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontSize: ScreenUtil.getInstance().setSp(30),
                  ),
                ),
                SizedBox(height:ScreenUtil.getInstance().setHeight(10)),
                Text(
                  information,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(25),
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(height:ScreenUtil.getInstance().setHeight(10)),
                Text(
                  time,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      
                      fontSize: ScreenUtil.getInstance().setSp(20),
                      fontStyle: FontStyle.normal),
                ),
                Divider(thickness: 1,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
