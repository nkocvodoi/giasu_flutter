import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/recommendation.dart';
import 'package:test_giasu/core/view_model/classDetailModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/ClassDetailWithCreator.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

import 'RectangleImageNameBox.dart';

class TeacherBox extends StatelessWidget {
  Recommendation recommendation;
  String status;
  String image;
  String name, place, subject, moreInfor;
  int fee;
  double distance;
  TeacherBox(this.recommendation, this.status, this.image, this.name,
      this.place, this.subject, this.fee, this.distance, this.moreInfor);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RectangleImageNameBox(image, name),
            Text(
              '${place} | $subject',
              maxLines: 2,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'UTM',
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: Text(
                    '$fee vnđ/buổi',
                    style: TextStyle(
                        fontSize: 13, fontFamily: 'UTM', color: Colors.orange),
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  child: Icon(
                    Icons.location_on,
                    size: 10,
                    color: colorApp,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '$distance km',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'UTM',
                      color: colorApp,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Text(
              '$moreInfor',
              maxLines: 2,
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'UTM',
              ),
            ),
            Divider(thickness: 1),
            Expanded(
              child: SizedBox(),
            ),
            Consumer<ClassDetailModel>(builder: (_, model, __) {
              return (status == 'accepted')
                  ? Container(
                      alignment: Alignment.bottomRight,
//              width: SizeConfig.safeBlockHorizontal * 45,
                      child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 75,
                          color: Colors.indigo[400],
                          child: Text(
                            'Đã mời dạy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'UTM',
                            ),
                          )),
                    )
                  : (status == 'rejected'
                      ? Container(
                          alignment: Alignment.bottomRight,
//              width: SizeConfig.safeBlockHorizontal * 45,
                          child: Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 75,
                              color: Colors.indigo[400],
                              child: Text(
                                'Đã từ chối',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontFamily: 'UTM',
                                ),
                              )),
                        )
                      : Container(
//              alignment: Alignment.bottomRight,
//              width: SizeConfig.safeBlockHorizontal * 45,
                          child: Row(
                            children: <Widget>[
                              Container(
                                //padding: EdgeInsets.only(left: 60),

                                height: 30,
                                width: 65,

                                child: RaisedButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () async {
                                    await model.tuchoidenghi(
                                        recommendation.course_id,
                                        recommendation.user_id);
                                    Navigator.pop(
                                      context,
                                    );
                                  },
                                  color: colorApp,
                                  child: Text(
                                    'Hủy',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'UTM',
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 40,
                                ),
                                height: 30,
                                width: 65,
                                child: RaisedButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () async {
                                    await model.chapnhandenghi(
                                        recommendation.course_id,
                                        recommendation.user_id);
                                    Navigator.pop(
                                      context,
                                    );
                                  },
                                  color: colorApp,
                                  child: Text(
                                    'Mời dạy',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'UTM',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ));
            }),
            Expanded(
              child: SizedBox(),
            ),
          ]),
    );
  }
}
