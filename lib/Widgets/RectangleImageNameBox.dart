import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_giasu/Helper/ScreenConfig.dart';

class RectangleImageNameBox extends StatelessWidget {
  String urlString;
  String name;
  RectangleImageNameBox(this.urlString, this.name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              child: Image.asset(
                urlString,
                height: SizeConfig.safeBlockVertical * 10,
                width: double.infinity,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: SizeConfig.safeBlockHorizontal * 3,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
