import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/Helper/ScreenConfig.dart';

class TeacherBox extends StatelessWidget {
  Image image;
  String name, place, subject, fee, moreInfor;
  double distance;
  TeacherBox(this.image, this.name, this.place, this.subject, this.fee,
      this.distance, this.moreInfor);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Container(
      height: SizeConfig.safeBlockVertical * 30,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Column(children: <Widget>[
        Icon(
          Icons.portrait,
          size: SizeConfig.safeBlockHorizontal * 5,
        ),
        Text(
          name,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            fontSize: SizeConfig.safeBlockHorizontal * 3,
          ),
        ),
        Text(
          '$place | $subject',
          textAlign: TextAlign.left,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Text(
                '$fee vnđ/buổi',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 2,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: Icon(
                Icons.location_on,
                size: SizeConfig.safeBlockHorizontal * 2,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                '$distance km',
                style: TextStyle(
                  fontSize: SizeConfig.safeBlockHorizontal * 2,
                  fontStyle: FontStyle.normal,
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
            fontSize: SizeConfig.safeBlockHorizontal * 2,
            fontStyle: FontStyle.normal,
          ),
        ),
        Container(
          //padding: EdgeInsets.only(left: 60),
          height: SizeConfig.safeBlockVertical * 3,
          width: SizeConfig.blockSizeHorizontal * 17,
          child: RaisedButton(
            onPressed: () {},
            color: Colors.blue[400],
            child: Text(
              'Mời dạy',
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.safeBlockHorizontal * 2,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
