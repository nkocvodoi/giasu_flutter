import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetail.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInfor.dart';
import 'package:test_giasu/core/view_model/classModel.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetail.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInfor.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

class List_Box extends StatelessWidget {
  List<Data_class> box;
  ScrollController controller;
  bool stateButton;

  List_Box({Key key, this.box, this.controller, this.stateButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<ClassModel>(builder: (_, model, __) {
      return ListView.builder(
          controller: controller,
          shrinkWrap: true,
          itemCount: box.length,
          itemBuilder: (BuildContext context, int index) {
//                print('log recommen ${box[index].recommended}');
//                print(box[index].recommended);
//            model.setRecomended(box[index].recommended);
//              model.setInfor(box[index].recommended);
//                if(box[index].recommended) {
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
                              box[index].name,
                              colorApp,
                              20,
                              Icon(Icons.account_box),
                            ),
                            _iconTextBox(
                              box[index].parent.full_name,
                              Colors.deepOrange,
                              20,
                              Icon(Icons.account_box),
                            ),
                            _iconTextBox(
                              box[index].address,
                              Colors.grey,
                              20,
                              Icon(Icons.account_box),
                            ),
                            _iconTextBox(
                              '${box[index].tuition_fee} vnd/${box[index].time_per_lesson}h - ${box[index].lesson_per_week}/tuần',
                              Colors.grey,
                              21,
                              Icon(Icons.account_box),
                            ),
                            _iconTextBox(
                              'Cách bạn: 2 km',
                              Colors.grey,
                              20,
                              Icon(Icons.account_box),
                            ),
                            _iconTextBox(
                              'Phí nhận lớp: ${box[index].class_fee} vnđ',
                              Colors.blue,
                              20,
                              Icon(Icons.account_box),
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
                  (stateButton ? Positioned(
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
                          model.setIdclass(box[index].id);
//                              await model.setInfor();
//                              print(model.infor);
//                                    print( 'log ${model.recommended}');
//                                    model.setRecomen(model.recommended);
//                                    print('recommended ${model.recommended}' );
//                                    print('recomme ${model.recomended}' );

//                          print('recommended ${box[index].recommended}');
//                          model.setRecomended(box[index].recommended);
                          print(
                              'recommended ${model.recommended} + ${box[index].id}');

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
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  )
                  :
                      SizedBox()
                  ),
                  Positioned(
                    top: 125,
                    right: 40,
                    child: Text(
                      '${box[index].recommend_number}/6 đề nghị',
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
