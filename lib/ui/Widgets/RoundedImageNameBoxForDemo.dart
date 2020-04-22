import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_giasu/core/model/List_TeacherData.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/TutorInfor.dart';

class RoundedImageNameBoxForDemo extends StatelessWidget {
  String urlString;
  String name;

  RoundedImageNameBoxForDemo(this.urlString, this.name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.network(
                'https://giasu.htcon.vn${urlString}',
                height: 90,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                 fontFamily: 'UTM',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
    );
  }
}
