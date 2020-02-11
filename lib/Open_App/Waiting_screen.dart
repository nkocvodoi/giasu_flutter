import 'package:flutter/material.dart';

class Waiting_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _Waiting_screenState();
  }
}

class _Waiting_screenState extends State<Waiting_screen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Stack(
        children: <Widget>[
          new Positioned(
            left: 60,
            width: 300,
            height: 500,
            child: new Image.asset('assets/Logo_HTcon_ok-01-6-1.png'),
          ),
          new Positioned(
            bottom: 200.0,
            left: 15.0,
            child: new Text('Nền tảng kết nối gia sư, lớp hoc, khóa hoc',
              style: TextStyle(decoration: TextDecoration.none,color: Colors.white,fontStyle: FontStyle.normal,
                  fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),



    );
  }
//  Widget _image_Logo() {
//    return Image.asset('assets/Logo_HTcon_ok-01-6-1.png');
//  }
}