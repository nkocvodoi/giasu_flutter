import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetail.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInfor.dart';
import 'package:test_giasu/core/view_model/classModel.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetail.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInfor.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class List_Box extends StatefulWidget {
  List<Data_class> box;
  ScrollController controller;
  bool stateButton;

  List_Box({Key key, this.box, this.controller, this.stateButton})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return List_BoxState();
  }
}

class List_BoxState extends State<List_Box> {
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Position _currentPosition;
  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print(_currentPosition);
      });
    }).catchError((e) {
      print(e);
    });
  }
  // getDistance(double distanceInMeters, String lat, String lng) async {
  //   Position _currentPosition;
  //   final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  //   geolocator
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
  //       .then((Position position) {
  //       setState(() {
  //         _currentPosition = position;
  //       });
  //   }).catchError((e) {
  //     print(e);
  //   });

  //    double distance =  await Geolocator().distanceBetween(_currentPosition.latitude, _currentPosition.longitude, double.parse(lat), double.parse(lng));
  //   setState(() {
  //     distanceInMeters = distance;
  //   });

  //}
  @override
  Widget build(BuildContext context) {
    if(_currentPosition == null) {_getCurrentLocation();};
     print(_currentPosition);
    // TODO: implement build
    return Consumer<ClassModel>(builder: (_, model, __) {
      return ListView.builder(
          controller: widget.controller,
          shrinkWrap: true,
          itemCount: widget.box.length,
          itemBuilder: (BuildContext context, int index) {
//                print('log recommen ${widget.box[index].recommended}');
//                print(widget.box[index].recommended);
            if (widget.stateButton) {
              model.setRecomended(widget.box[index].recommended);
            }
            ;
//              model.setInfor(widget.box[index].recommended);
//                if(widget.box[index].recommended) {
//                  model.setInfor('Hủy đề nghị dạy');
//                }
//                else {
//                  model.setInfor('Đề nghị dạy');
//                }

            return Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(10.0),
//                  height: 190,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: RaisedButton(
                        onPressed: () {},
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _iconTextBox(
                              widget.box[index].name,
                              colorApp,
                              20,
                              Icon(
                                Icons.school,
                                color: colorApp,
                                size: 18,
                              ),
                            ),
                            _iconTextBox(
                              widget.box[index].parent.full_name,
                              orange,
                              20,
                              Icon(
                                Icons.account_box,
                                color: orange,
                                size: 18,
                              ),
                            ),
                            _iconTextBox(
                              widget.box[index].address,
                              black,
                              20,
                              Icon(
                                Icons.map,
                                color: black,
                                size: 18,
                              ),
                            ),
                            _iconTextBox(
                              '${widget.box[index].tuition_fee} vnd/${widget.box[index].time_per_lesson}h - ${widget.box[index].lesson_per_week}/tuần',
                              black,
                              20,
                              Icon(
                                Icons.monetization_on,
                                color: black,
                                size: 18,
                              ),
                            ),
                            _iconTextBox(
                              'Cách bạn: ${calculateDistance(_currentPosition.latitude, _currentPosition.longitude, double.parse(widget.box[index].lat), double.parse(widget.box[index].lng)).roundToDouble()}km',
                              //'Cách bạn: 2km',
                              black,
                              20,
                              Icon(
                                Icons.radio_button_checked,
                                color: black,
                                size: 18,
                              ),
                            ),
                            _iconTextBox(
                              'Phí nhận lớp: ${widget.box[index].class_fee} vnđ',
                              blue,
                              20,
                              Icon(
                                Icons.attach_money,
                                color: blue,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: 10,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: colorApp,
                      size: 30.0,
                    ),
                  ),
                  (widget.stateButton
                      ? Positioned(
                          top: 153,
                          right: 25,
                          child: SizedBox(
                            height: 33,
                            child: RaisedButton(
                              padding: EdgeInsets.only(
                                left: 2.0,
                                right: 2.0,
                              ),
                              color: colorApp,
                              onPressed: () async {
                                model.setIdclass(widget.box[index].id);
//                              await model.setInfor();
//                              print(model.infor);
//                                    print( 'log ${model.recommended}');
//                                    model.setRecomen(model.recommended);
//                                    print('recommended ${model.recommended}' );
//                                    print('recomme ${model.recomended}' );

//                          print('recommended ${box[index].recommended}');
//                          model.setRecomended(box[index].recommended);
                                print(
                                    'recommended ${model.recommended} + ${widget.box[index].id}');

                                if (model.recommended) {
                                  await model.setHuydenghi();
                                  print('Huy');
                                } else {
                                  await model.setDenghi();
                                  print('Denghi');
                                }

//                          model.change();

                                print('=> ${model.recommended}');
//                          print(model.infor);
                              },
                              child: Text(
                                model.infor,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        )
                      : SizedBox()),
                  Positioned(
                    top: 125,
                    right: 40,
                    child: Text(
                      '${widget.box[index].recommend_number}/6 đề nghị',
                      style: TextStyle(
                        height: 1.3,
                        fontSize: 16,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }

  Widget _iconTextBox(String _text, Color _c, double _a, Icon _icon) {
    return Container(
      height: 28,
      child: Row(
        children: <Widget>[
          _icon,
          SizedBox(width: 5,),
          Text(
            "${_text}",
            style: TextStyle(
              fontSize: _a,
              color: _c,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
