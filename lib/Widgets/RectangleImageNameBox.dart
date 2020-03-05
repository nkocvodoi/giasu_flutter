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
      padding: EdgeInsets.only(top: 5),
      width: double.infinity,
      
        child: Column(
      children: <Widget>[
        Container(
          child: Image.network(urlString,height: 100,),
        ),
         Text(
          name,
          style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ));
  }
}
