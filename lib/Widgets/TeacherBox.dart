import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherBox extends StatelessWidget {
  Image image;
  String name, place, subject, fee, moreInfor;
  double distance;
  TeacherBox(this.image, this.name, this.place, this.subject, this.fee,
      this.distance, this.moreInfor);
  @override
  Widget build(BuildContext context) {
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
      child: Column(children: <Widget>[
        Icon(
          Icons.portrait,
          size: 50,
        ),
        Text(
          name,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            fontSize: ScreenUtil.getInstance().setSp(30),
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
              child: Text('$fee vnđ/buổi'),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: Icon(Icons.location_on),
            ),
            Expanded(
              flex: 2,
              child: Text('$distance km'),
            ),
          ],
        ),
        Divider(
          thickness: 1,
        ),
        Text(
          '$moreInfor',
          maxLines: 2,
        ),
        Container(
          //padding: EdgeInsets.only(left: 60),
          child: RaisedButton(
            onPressed: () {},
            color: Colors.blue[400],
            child: Text(
              'Mời dạy',
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil.getInstance().setSp(20),
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
