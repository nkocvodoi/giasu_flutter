import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/filterModel.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/ui/UI_Main/Lists_Class.dart';

import '../../route.dart';

class Filter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FilterState();
  }
}

class _FilterState extends State<Filter> {
  var _slidervalue = 0.0;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        leading: buildPreviousButton(),
        centerTitle: true,
        backgroundColor: colorApp,
        title: Text(
            'BỘ LỌC',
            textAlign: TextAlign.center,
          ),
        
      ),
      body: Consumer<FilterModel>(builder: (_, model, __) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil.getInstance().setWidth(28),
                  right: ScreenUtil.getInstance().setWidth(28),
                  top: ScreenUtil.getInstance().setHeight(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      padding: EdgeInsets.only(left: 20),
                      height: 50,
                      width: 320,
                      child: DropdownButton<int>(
                        underline: Container(
                          color: Colors.transparent,
                        ),
                        isExpanded: true,
                        value: model.idCity,
                        items: [
                          DropdownMenuItem(
                            child: Text('Địa điểm',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.grey)),
                            value: null,
                          ),
                          ...List.generate(model.city.length, (index) {
                            return DropdownMenuItem(
                              child: Text('${model.city[index].name}',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.grey)),
                              value: model.city[index].id,
                            );
                          }),
                        ],
                        onChanged: (int value) {
                          if (value != model.idCity) {
                            model.setIdCity(value);
                          }
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.blueAccent, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      padding: EdgeInsets.only(left: 20),
                      height: 50,
                      width: 320,
                      child: DropdownButton<int>(
                        underline: Container(
                          color: Colors.transparent,
                        ),
                        isExpanded: true,
                        value: model.idSubject,
                        items: [
                          DropdownMenuItem(
                            child: Text('Môn học',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.grey)),
                            value: null,
                          ),
                          ...List.generate(model.subject.length, (index) {
                            return DropdownMenuItem(
                              child: Text('${model.subject[index].name}',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.grey)),
                              value: model.subject[index].id,
                            );
                          }),
                        ],
                        onChanged: (int value) {
                          if (value != model.idSubject) {
                            model.setIdSubject(value);
                          }
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.blueAccent, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      padding: EdgeInsets.only(left: 20),
                      height: 50,
                      width: 320,
                      child: DropdownButton<int>(
                        isExpanded: true,
                        underline: Container(
                          color: Colors.transparent,
                        ),
                        value: model.topic,
                        items: [
                          DropdownMenuItem(
                            child: Text('Chủ đề',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.grey)),
                            value: null,
                          ),
//                          ...List.generate(topic.length, (index) {
//                            return DropdownMenuItem(
//                              child: Text(
//                                '${topic[index].value}',
//                                style: TextStyle(
//                                    fontSize: 23.0, color: Colors.grey),
//                              ),
//                              value: topic[index].key,
//                            );
//                          }),
                        ],
                        onChanged: (int value) {
                          if (value != model.topic) {
                            model.setTopic(value);
                          }
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.blueAccent, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      padding: EdgeInsets.only(left: 20),
                      height: 50,
                      width: 320,
                      child: DropdownButton<int>(
                        isExpanded: true,
                        underline: Container(
                          color: Colors.transparent,
                        ),
                        value: model.form_teaching,
                        items: [
                          DropdownMenuItem(
                            child: Text('Hình thức dạy',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.grey)),
                            value: null,
                          ),
                          ...List.generate(form_teachings.length, (index) {
                            return DropdownMenuItem(
                              child: Text(
                                '${form_teachings[index].value}',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.grey),
                              ),
                              value: form_teachings[index].key,
                            );
                          }),
                        ],
                        onChanged: (int value) {
                          if (value != model.form_teaching) {
                            model.setForm_teaching(value);
                          }
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.blueAccent, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      padding: EdgeInsets.only(left: 20),
                      height: 50,
                      width: 320,
                      child: DropdownButton<int>(
                        isExpanded: true,
                        underline: Container(
                          color: Colors.transparent,
                        ),
                        value: model.education,
                        items: [
                          DropdownMenuItem(
                            child: Text('Đối tượng dạy',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.grey)),
                            value: null,
                          ),
                          ...List.generate(education.length, (index) {
                            return DropdownMenuItem(
                              child: Text(
                                '${education[index].value}',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.grey),
                              ),
                              value: education[index].key,
                            );
                          }),
                        ],
                        onChanged: (int value) {
                          if (value != model.education) {
                            model.setEducation(value);
                          }
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.blueAccent, width: 1.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Text(
                      'Khoảng cách',
                      style: TextStyle(
                        fontSize: 18,
                        color: colorApp,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: colorApp,
                        //inactiveTrackColor: Colors.red[100],
                        trackShape: RectangularSliderTrackShape(),
                        trackHeight: 8.0,
                        thumbColor: colorApp,
                        //thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        // valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                        valueIndicatorColor: Colors.indigo,
                        valueIndicatorTextStyle: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                      child: Slider(
                        value: _slidervalue,
                        min: 0,
                        max: 20,
                        divisions: 20,
                        label: '$_slidervalue' + 'Km',
                        onChanged: (newvalue) {
                          setState(() {
                            _slidervalue = newvalue;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20,),
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyBottomNavigationBar(
                              currentIndex: 1,
                            ),
                          ),
                        );
                      },
                      color: colorApp,
                      child: Container(
                        padding: EdgeInsets.all(5),
                          
                        child: Text(
                          'Tìm kiếm',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
