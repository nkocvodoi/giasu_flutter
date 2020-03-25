import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
        leading: buildPreviousButton(),
        backgroundColor: _color,
        centerTitle: true,
        title: Text(
          'Trợ giúp & Cài đặt',
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
                size: 30.0,
              ),
              title: Text(
                'Thông báo',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'UTM',
                  color: black,
                ),
              ),
              subtitle: value ? Text(
                'Nhận thông báo từ hệ thống',
                style: TextStyle(
                  fontSize: 13.0,
                  fontStyle: FontStyle.italic,
                  color: black,
                ),
              ) : Text('Tắt thông báo từ hệ thống',
                style: TextStyle(
                  fontSize: 13.0,
                  fontStyle: FontStyle.italic,
                  color: black,
                ),),
            ),
            _buildText('Tham gia cộng đồng HTcon gia sư', 1),
            Divider(
              height: 0.0,
              thickness: 2,
              indent: 14.0,
              endIndent: 18.0,
            ),
            _buildText('Hướng dẫn xử lí lớp phát sinh', 2),
            Divider(
              height: 0.0,
              thickness: 2,
              indent: 14.0,
              endIndent: 18.0,
            ),
            _buildText('Hướng dẫn khiếu nại', 3),
            Divider(
              height: 0.0,
              thickness: 2,
              indent: 14.0,
              endIndent: 18.0,
            ),
            _buildText('Những lưu ý quan trọng', 4),
            Divider(
              height: 0.0,
              thickness: 2,
              indent: 14.0,
              endIndent: 18.0,
            ),
            _buildText('Liên hệ', 5),
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

  Widget _buildText(String _text, int _a) {
    return ListTile(
      title: Text(
        _text,
        style: TextStyle(
          fontSize: 18.0,
          fontFamily: 'UTM',
          color: black,
        ),
      ),
      onTap: () {
        switch (_a) {
          case 1:
            {
              return launch('https://www.facebook.com/Giasubinhminh.club/');
            }
            break;
          case 2:
            {
              return 1;
            }
            break;
          case 3:
            {
              return 1;
            }
            break;
          case 4:
            {
              return 1;
            }
            break;

          default:
            {
              return 1;
            }
            break;
        }
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
