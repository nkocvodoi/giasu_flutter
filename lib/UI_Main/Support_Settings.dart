import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Support_Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Support_SettingsState();
  }
}

class _Support_SettingsState extends State<Support_Settings> {
  final Color _color = Color.fromRGBO(47, 101, 174, 1);
  bool value = false;
  void onChangedValue(bool a) {
    setState(() {
      value = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Center(
          child: Text(
            'Trợ giúp & Cài đặt',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            SwitchListTile(
              value: value,
              onChanged: onChangedValue,
              secondary: Icon(
                Icons.notifications,
                color: Colors.blue,
                size: 40.0,
              ),
              title: Text(
                'Thông báo',
                style: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  color: Colors.grey[600],
                ),
              ),
              subtitle: Text(
                'Nhận thông báo từ hệ thống',
                style: TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
            ),
            _buildText('Tham gia cộng đồng HTcon gia sư'),
            Divider(
              height: 0.0,
              thickness: 2,
              indent: 14.0,
              endIndent: 18.0,
            ),
            _buildText('Hướng dẫn xử lí lớp phát sinh'),
            Divider(
              height: 0.0,
              thickness: 2,
              indent: 14.0,
              endIndent: 18.0,
            ),
            _buildText('Hướng dẫn khiếu nại'),
            Divider(
              height: 0.0,
              thickness: 2,
              indent: 14.0,
              endIndent: 18.0,
            ),
            _buildText('Những lưu ý quan trọng'),
            Divider(
              height: 0.0,
              thickness: 2,
              indent: 14.0,
              endIndent: 18.0,
            ),
            _buildText('Liên hệ'),
            Divider(
              height: 0.0,
              thickness: 2,
              indent: 14.0,
              endIndent: 18.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String _text) {
    return ListTile(
      title: Text(
        _text,
        style: TextStyle(
          fontSize: 20.0,
          fontStyle: FontStyle.normal,
          color: Colors.grey[500],
        ),
      ),
      onTap: () {},
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
