// ignore: avoid_web_libraries_in_flutter
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 101, 174, 1),
        title: Center(
          child: Text(
            'Hộp thư',
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().setSp(40),
              fontStyle: FontStyle.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(children: <Widget>[
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Mails(
                Icons.bookmark,
                'Nhận tiền thành công',
                'Quý khách đã nhận được số tiền 210.000 đ từ nguyen thi to loan (01239305973), lời nhắn \"Nạp coin id 2279\". Nhấn để xem chi tiết.',
                '09:55 - 07/01/2020'),
            Mails(
                Icons.bookmark,
                'Nhận tiền thành công',
                'Quý khách đã nhận được số tiền 210.000 đ từ nguyen thi to loan (01239305973), lời nhắn \"Nạp coin id 2279\". Nhấn để xem chi tiết.',
                '09:55 - 07/01/2020'),
            Mails(
                Icons.bookmark,
                'Nhận tiền thành công',
                'Quý khách đã nhận được số tiền 210.000 đ từ nguyen thi to loan (01239305973), lời nhắn \"Nạp coin id 2279\". Nhấn để xem chi tiết.',
                '09:55 - 07/01/2020'),
            Mails(
                Icons.bookmark,
                'Nhận tiền thành công',
                'Quý khách đã nhận được số tiền 210.000 đ từ nguyen thi to loan (01239305973), lời nhắn \"Nạp coin id 2279\". Nhấn để xem chi tiết.',
                '09:55 - 07/01/2020'),
          ])
        ],
      )),
    );
  }
}
