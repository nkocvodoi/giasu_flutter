
//Thanh toán

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/List_ClassData.dart';
import 'package:test_giasu/core/view_model/paymentModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/BottomNavigationBar.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/UI_Main/Payments.dart';
import 'package:test_giasu/ui/Widgets/ARichTextLine.dart';
import 'package:test_giasu/ui/Widgets/LargeTextBox.dart';
import 'package:test_giasu/ui/Widgets/RoundedImageNameBox.dart';
import 'package:test_giasu/ui/Widgets/SelectedTimeColumn.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ClassDetailWhenAcceptedDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ClassDetailRequestDemoState();
  }
}

class _ClassDetailRequestDemoState extends State<ClassDetailWhenAcceptedDemo> {
  Widget _iconTextBox(Text text, Icon icon) {
    return Row(
      children: <Widget>[
        Expanded(child: icon),
        Expanded(
          child: SizedBox(
            width: ScreenUtil.getInstance().setWidth(20),
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            child: text,
          ),
        ),
        Expanded(
          child: SizedBox(width: 10),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    // TODO: implement build
    return Consumer<PaymentModel>(
        builder:(_ ,model, __){
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: buildPreviousButton(),
              backgroundColor: Color.fromRGBO(47, 101, 174, 1),
              title: Text(
                'Chi tiết lớp học',
                textAlign: TextAlign.start,
              ),
            ),
            body: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: SizeConfig.safeBlockVertical * 22.5,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: SizeConfig.safeBlockVertical * 20,
                              alignment: Alignment.center,
                              color: Color.fromRGBO(47, 101, 174, 1),
                              child: RoundedImageNameBox(
                                '/avatar/1466/14963324_211293059282131_333912323949534667_n_56fea2079cd3f8a1f771.jpg',
                                'Gia Sư Bách Khoa',
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: SizeConfig.safeBlockHorizontal * 80,
                                height: SizeConfig.safeBlockVertical * 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: black),
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    'TANH 5 XUÂN PHƯƠNG, TỪ LIÊM',
                                    style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 13,
                                        color: black
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(30),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        // alignment: Alignment.center,
                        width: SizeConfig.safeBlockHorizontal * 95,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            _iconTextBox(
                              Text(
                                'Trạng thái: Đang tìm gia sư',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(
                                Icons.portrait,
                                color: black,
                                size: 15,
                              ),
                            ),
                            _iconTextBox(
                              Text(
                                'Mã lớp: 1222 - Tiếng Anh | Lớp: 5',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(
                                Icons.home,
                                color: black,
                                size: 15,
                              ),
                            ),
                            _iconTextBox(
                              Text(
                                'Hình thức học: Gia sư Offline ( tại nhà )',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(
                                Icons.school,
                                color: black,
                                size: 15,
                              ),
                            ),
                            _iconTextBox(
                              Text(
                                'Số buổi/tuần:  1 buổi (2h/buổi)',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(
                                Icons.timelapse,
                                color: black,
                                size: 15,
                              ),
                            ),
                            _iconTextBox(
                              Text(
                                'Số học viên: 1',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(
                                Icons.person_outline,
                                color: black,
                                size: 15,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Icon(
                                    Icons.map,
                                    color: Colors.grey,
                                    size: 15,
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    width: ScreenUtil.getInstance().setWidth(20),
                                  ),
                                ),
                                Expanded(
                                  flex: 20,
                                  child: Container(
                                    child: RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                            'Địa chỉ: Chung Cư Athena Complex Xuân Phương, Phương Canh, Từ Liêm, Hà Nội, Việt Nam | Hà Nội',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontFamily: 'UTM',
                                            ),
                                          ),
                                          TextSpan(
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                launch(
                                                    'https://www.google.com/maps/place/38+Tr%E1%BA%A7n+Qu%C3%BD+Ki%C3%AAn,+D%E1%BB%8Bch+V%E1%BB%8Dng,+C%E1%BA%A7u+Gi%E1%BA%A5y,+H%C3%A0+N%E1%BB%99i,+Vi%E1%BB%87t+Nam/@21.0373781,105.7920155,17z/data=!3m1!4b1!4m5!3m4!1s0x3135ab37c1376ff7:0x245ac013cbc4304e!8m2!3d21.0373781!4d105.7920155?hl=vi-VNv');
                                              },
                                            text: ' ( Xem bản đồ )',
                                            style: TextStyle(
                                              fontFamily: 'UTM',
                                              color: orange,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            _iconTextBox(
                              Text(
                                'Cách bạn: 2km',
                                style: TextStyle(
                                  color: black,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(
                                Icons.radio_button_checked,
                                color: black,
                                size: 15,
                              ),
                            ),
                            _iconTextBox(
                              Text(
                                'Học phí/buổi: 130,000 vnđ/2h',
                                style: TextStyle(
                                  color: orange,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(
                                Icons.monetization_on,
                                color: black,
                                size: 15,
                              ),
                            ),
                            _iconTextBox(
                              Text(
                                'Phí nhận lớp: 260,000 vnđ',
                                style: TextStyle(
                                  color: blue,
                                  fontSize: 15,
                                ),
                              ),
                              Icon(
                                Icons.attach_money,
                                color: black,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(20),
                      ),
                      LargeTextBox('Chi tiết nội dung yêu cầu'),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(10),
                      ),
                      RichTextLine(),
                      SelectedTimeColumn(),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(50),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              alignment: Alignment.center,
              width: ScreenUtil.getInstance().setWidth(700),
              height: ScreenUtil.getInstance().setHeight(100),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(),
                    flex: 6,
                  ),
                  Container(
                    height: SizeConfig.safeBlockHorizontal * 10,
                    width: SizeConfig.safeBlockHorizontal *25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: colorApp,
                      onPressed: () {
//                        model.setMethod('Tài khoản coin');
                        int phinhanlop = model.phi_nhanlop(null, 3243, 4);
                        int nophi = model.no_phi(phinhanlop);
                        model.setMess_thanhtoan(phinhanlop, nophi);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Payments(phinhanlop, nophi)));
                      },
                      textColor: Colors.white,
                      child: Text('Thanh toán',style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal * 3)),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                    flex: 1,
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
