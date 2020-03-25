import 'package:flutter/material.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetail.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInfor.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class List_Box extends StatelessWidget {
  List<Data_class> box;
  ScrollController controller;

  List_Box({Key key, this.box, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        controller: controller,
        shrinkWrap: true,
        itemCount: box.length,
        itemBuilder: (BuildContext context, int index) {
//          print(box[index].id);
          return Container(
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(10.0),
//                  height: 190,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ClassDetailWithMoreTutorInfor(box[index])));
                    },
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _iconTextBox(
                              box[index].name,
                              colorApp,
                              Icon(Icons.school),
                            ),
                            _iconTextBox(
                              box[index].parent.full_name,
                              Colors.deepOrange,
                              Icon(Icons.account_box),
                            ),
                            _iconTextBox(
                              box[index].address,
                              Colors.grey,
                              Icon(Icons.map),
                            ),
                            _iconTextBox(
                              '${(box[index].tuition_fee / 1000).toInt()},000 vnđ/${box[index].time_per_lesson.toInt()}h - ${box[index].lesson_per_week}/tuần',
                              Colors.grey,
                              Icon(Icons.monetization_on),
                            ),
                            _iconTextBox(
                              'Cách bạn: 2 km',
                              Colors.grey,
                              Icon(Icons.radio_button_checked),
                            ),
                            _iconTextBox(
                              'Phí nhận lớp: ${(box[index].class_fee / 1000).toInt()},000 vnđ',
                              Colors.blue,
                              Icon(Icons.attach_money),
                            ),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: colorApp,
                            size: 30.0,
                          ),
                        ),
                      ],
                    ),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blueAccent, width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                // Positioned(
                //   top: 90,
                //   right: 10,
                //   child: Icon(
                //     Icons.arrow_forward_ios,
                //     color: colorApp,
                //     size: 30.0,
                //   ),
                // ),
                Positioned(
                  bottom: 15,
                  right: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${box[index].recommend_number}/6 đề nghị',
                        style: TextStyle(
                          height: 1.3,
                          fontSize: 13,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      SizedBox(
                        height: 33,
                        child: RaisedButton(
                          padding: EdgeInsets.only(
                            left: 2.0,
                            right: 2.0,
                          ),
                          color: colorApp,
                          onPressed: () {},
                          child: Text(
                            'Đề nghị dạy',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget _iconTextBox(String _text, Color _c, Icon _icon) {
    return Container(
      child: Row(
        children: <Widget>[
          _icon,
          SizedBox(width: 5),
          Container(
            width: 310,
            child: Text(
              _text,
              style: TextStyle(
                fontSize: 16,
                color: _c,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
