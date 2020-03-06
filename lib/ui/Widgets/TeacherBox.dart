import 'package:flutter/material.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

import 'RectangleImageNameBox.dart';

class TeacherBox extends StatelessWidget {
  String image;
  String name, place, subject, moreInfor;
  int fee;
  double distance;
  TeacherBox(this.image, this.name, this.place, this.subject, this.fee,
      this.distance, this.moreInfor);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RectangleImageNameBox('https://giasu.htcon.vn' + image, name),
            Text(
              '$place | $subject',
              textAlign: TextAlign.left,
              style: TextStyle(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: Text(
                    '$fee vnđ/buổi',
                    style: TextStyle(
                        fontSize: 13,
                        fontStyle: FontStyle.normal,
                        color: Colors.orange),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  child: Icon(
                    Icons.location_on,
                    size: 10,
                    color: colorApp,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '$distance km',
                    style: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                      color: colorApp,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Text(
              '$moreInfor',
              maxLines: 2,
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.normal,
              ),
            ),
            Divider(thickness: 1),
            Expanded(
              child: SizedBox(),
            ),
            Container(
              alignment: Alignment.bottomRight,
              width: SizeConfig.safeBlockHorizontal * 45,
              child: Container(
                //padding: EdgeInsets.only(left: 60),

                height: 30,
                width: 83,

                child: RaisedButton(
                  onPressed: () {},
                  color: colorApp,
                  child: Text(
                    'Mời dạy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
          ]),
    );
  }
}
