import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/view_model/classModel.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetail.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetail4.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWhenAccepted.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithCreator.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithMoreTutorInfor.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
class List_Box extends StatelessWidget {
  List<Data_class> box;
  ScrollController controller;
  bool stateButton;

  List_Box({Key key, this.box, this.controller, this.stateButton})
      : super(key: key);

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
            if (stateButton) {
              model.setRecomended(box[index].recommended);
            }
            ;
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
                  child: RaisedButton(
                        onPressed: () async {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => ClassDetail( box[index].id),
//
//                            ),
//                          );
                          await model.setClassDataId(box[index].id);
//                        print(model.isFetchingClassDataId);
                          if (model.isFetchingClassDataId) {
//                          print(model.data_class.toString());
                            model.checkStateClass(model.data_class);
//                            print(model.StateClass);
                            switch (model.StateClass) {
                              case "De nghi day":
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ClassDetail(box[index].id),
                                    ),
                                  );
                                }
                                break;
                              case 'Huy de nghi':
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ClassDetail(box[index].id),
                                    ),
                                  );
                                }
                                break;

                              case "Xem de nghi day":
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ClassDetailWithCreator(box[index].id),
                                    ),
                                  );
                                }
                                break;
                              case "Thanh toan":
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ClassDetailWhenAcceptedDemo(box[index]),
                                    ),
                                  );
                                }
                                break;
                              case "Lop phat sinh + Change":
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ClassDetail4(box[index]),
                                    ),
                                  );
                                }
                                break;
                              case "Change":
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ClassDetail4(box[index]),
                                    ),
                                  );
                                }
                                break;

                              case "No button":
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ClassDetail4(box[index]),
                                    ),
                                  );
                                }
                                break;
                            }
                          }
                        },
                        padding: EdgeInsets.all(5.0),
                        child:Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // _iconTextBox(
                            //   box[index].name,
                            //   colorApp,
                            //   Icon(Icons.school),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.school,color: blue,),
                                  SizedBox(width: 5),
                                  Container(
                                    width: 310,
                                    child: Text(
                                      "Mã Lớp: ${box[index].id} - ${box[index].subject.name}| Lớp ${box[index].grade}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _iconTextBox(
                              box[index].parent.full_name,
                              //Colors.deepOrange,
                              orange,
                              Icon(Icons.account_box,color: orange,),
                            ),
                            _iconTextBox(
                              box[index].address,
                              black,
                              Icon(Icons.map,color: black,),
                            ),
                            _iconTextBox(
                              //'${(box[index].tuition_fee / 1000).toInt()},000 vnđ/${box[index].time_per_lesson.toInt()}h - ${box[index].lesson_per_week}/tuần',
                              '${box[index].tuition_fee} vnđ/${box[index].time_per_lesson} h - ${box[index].lesson_per_week}/tuần',
                              black,
                              Icon(Icons.monetization_on,color: black),
                            ),
                            _iconTextBox(
                              'Cách bạn: 2 km',
                              black,
                              Icon(Icons.radio_button_checked,color: black,),
                            ),
                            _iconTextBox(
                              // 'Phí nhận lớp: ${(box[index].class_fee / 1000).toInt()},000 vnđ',
                              // Colors.blue,
                              'Phí nhận lớp: ${box[index].class_fee} vnđ',
                              blue,
                              Icon(Icons.attach_money,color: blue,),
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
                (stateButton
                      ? Positioned(
                  bottom: 15,
                  right: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${box[index].recommend_number}/6 đề nghị',
                        style: TextStyle(
                          
                          //color: Colors.deepOrange,
                          color: orange,
                         
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
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                    ],
                  ),
                ): SizedBox()),
              ],
            ),
          );
        });
  }
    );
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
              //_text,
              '${_text}',
              style: TextStyle(
                fontSize: 16,
                color: _c,
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}