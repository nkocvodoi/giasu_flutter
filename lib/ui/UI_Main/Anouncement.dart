// ignore: avoid_web_libraries_in_flutter
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/anouncementData.dart';
import 'package:test_giasu/core/view_model/anouncementModel.dart';
import 'package:test_giasu/core/view_model/classModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'ClassDetail.dart';
import 'ClassDetail4.dart';
import 'ClassDetailWhenAccepted.dart';
import 'ClassDetailWithCreator.dart';
import 'Mails.dart';

class Anouncement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnouncementState();
  }
}

class _AnouncementState extends State<Anouncement> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    ScreenUtil.instance = ScreenUtil(
        width: MediaQuery.of(context).size.width.toInt(),
        height: MediaQuery.of(context).size.height.toInt(),
        allowFontScaling: true);
    SizeConfig().init(context);
    // TODO: implement build
    return Consumer2<AnouncementModel, ClassModel>(builder: (_, model,model2, __) {
      return Center(
        child: FutureBuilder<List<AnouncementData>>(
            future: model.fetchNotifications(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<AnouncementData> notifications = snapshot.data;
                return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    backgroundColor: colorApp,
                    title: Text(
                      'Hộp thư',
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.done_all,
                            color: Colors.white,
                          ),
                          onPressed: null),
                    ],
                  ),
                  body: ((notifications.length != null)
                      ? ListView.builder(
                          itemCount: notifications.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap:() async {
                                if(notifications[index].course_id != null) {
                                  print(notifications[index].course_id);

                                  await model2.setClassDataId(notifications[index].course_id);
//                        print(model.isFetchingClassDataId);
                                  if (model2.isFetchingClassDataId) {
//                          print(model.data_class.toString());
                                    model2.checkStateClass(model2.data_class);
//                                    print(model2.StateClass);
                                    switch (model2.StateClass) {
                                      case "De nghi day":
                                        {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ClassDetail(model2.data_class.id),
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
                                                  ClassDetail(model2.data_class.id),
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
                                                  ClassDetailWithCreator(model2.data_class.id),
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
                                                  ClassDetailWhenAcceptedDemo(model2.data_class),
                                            ),
                                          );
                                        }
                                        break;
                                      case "Lop phat sinh + Change":
                                        {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ClassDetail4(model2.data_class),
                                            ),
                                          );
                                        }
                                        break;
                                      case "Change":
                                        {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ClassDetail4(model2.data_class),
                                            ),
                                          );
                                        }
                                        break;

                                      case "No button":
                                        {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ClassDetail4(model2.data_class),
                                            ),
                                          );
                                        }
                                        break;
                                    }
                                  }
                                }
                                else{
                                  print('null');
                                }

                              },
                              child: Mails('${notifications[index].content}',
                                  '${notifications[index].created_at}'),
                            );
                          })
                      : Center(
                    child: Text('Hộp thư trống !',
                      style: TextStyle(fontSize: 30, color: Colors.grey),),
                  ) ),
                );
              }
              return CircularProgressIndicator();
            }),
      );
    });
  }
}
