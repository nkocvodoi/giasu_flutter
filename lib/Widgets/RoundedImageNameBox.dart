import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_giasu/Helper/ScreenConfig.dart';

class RoundedImageNameBox extends StatelessWidget {
  String urlString;
  String name;
  RoundedImageNameBox(this.urlString, this.name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
        child: Column(
      children: <Widget>[
        ClipRRect(
         borderRadius: BorderRadius.circular(90),
          
         
          child: Image.asset(urlString,height:SizeConfig.safeBlockVertical* 13,),
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
