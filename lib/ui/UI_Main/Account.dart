import 'package:flutter/material.dart';
import 'package:test_giasu/ui/Open_App/Waiting_screen.dart';

import 'package:url_launcher/url_launcher.dart';

import 'Request.dart';
import 'ResetPass.dart';
import 'Support_Settings.dart';
import 'TutorInfor.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Account_State();
  }
}

class _Account_State extends State<Account> {
  final Color _color = Color.fromRGBO(47, 101, 174, 1);

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: new Center(
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(80.0),
                      child: Image.asset(
                        'assets/red.jpg',
                        cacheWidth: 100,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Name',
                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: _color,
            ),
          ),
          Divider(
            thickness: 6,
          ),
          _buildText('Trang cá nhân', 1),
          Divider(
            thickness: 1,
          ),
          _buildText('Cập nhật thông tin', 2),
          Divider(
            thickness: 1,
          ),
          _buildText('Đổi mật khẩu', 3),
          Divider(
            thickness: 6,
          ),
          _buildText('Quản lý lớp', 4),
          _buildExpansionTile1('Giới thiệu lớp', 'Tạo lớp', 'Chính sách', 1),
          _buildExpansionTile1(
              'Giới thiệu gia sư', 'Giới thiệu', 'Chính sách', 2),
          Divider(
            thickness: 6,
          ),
          _buildExpansionTile('Chính sách & điều khoản', 'Chính sách bảo mật',
              'Điều khoản sử dụng', 'Hợp đồng gia sư'),
          _buildText('Câu hỏi thường gặp', 5),
          Divider(
            thickness: 1,
          ),
          _buildText('Trợ giúp & cài đặt', 6),
          Divider(
            thickness: 1,
          ),
          _buildText('Đăng xuất', 7),
        ],
      ),
//      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  Widget _buildText(String _text, int _a) {
    return ListTile(
      leading: Icon(Icons.account_box),
      title: Text(
        _text,
        style: TextStyle(color: Colors.grey[600], fontSize: 25.0),
      ),
      onTap: () {
        switch (_a) {
          case 1: //Trang cá nhân
            {
              return 1;
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => TutorInfor(),
//                  ));
            }
            break;
          case 2: //Cập nhật thông tin
            {
              return 1;
            }
            break;
          case 3: //Đổi mật khẩu
            {
              return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPass(),
                  ));
            }
            break;
          case 4: //Quản lí lớp
            {
              return 1;
            }
            break;
          case 5: //Câu hỏi thường gặp
            {
              return 1;
            }
            break;
          case 6: //Trợ giúp và cài đặt
            {
              return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Support_Settings(),
                  ));
            }
            break;

          default: //Đăng xuất
            {
              return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Waiting_screen(),
                  ));
            }
            break;
        }
      },
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Widget _buildExpansionTile(
    String _title,
    String _title1,
    String _title2,
    String _title3,
  ) {
    return ExpansionTile(
      leading: Icon(Icons.account_box),
      title: Text(
        _title,
        style: TextStyle(color: Colors.grey[600], fontSize: 25.0),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      children: <Widget>[
        ListTile(
          title: Text(
            _title1,
            style: TextStyle(color: Colors.grey[600], fontSize: 25.0),
          ),
          onTap: () {
            launch('https://htcon.vn/chinh-sach-bao-mat-thong-tin/'); //Chính sách
          },
        ),
        ListTile(
          title: Text(
            _title2,
            style: TextStyle(color: Colors.grey[600], fontSize: 25.0),
          ),
          onTap: () {
            launch('https://htcon.vn/quy-dinh-chung/'); //Điều khoản
          },
        ),
        ListTile(
          title: Text(
            _title3,
            style: TextStyle(color: Colors.grey[600], fontSize: 25.0),
          ),
          onTap: () {
            launch('https://htcon.vn/hop-dong-ket-noi-gia-su/'); //Hợp đồng giá sư
          },
        ),
      ],
    );
  }

  Widget _buildExpansionTile1(
      String _title, String _title1, String _title2, int _a) {
    return ExpansionTile(
      leading: Icon(Icons.account_box),

      title: Text(
        _title,
        style: TextStyle(color: Colors.grey[600], fontSize: 25.0),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      children: <Widget>[
        ListTile(
          title: Text(
            _title1,
            style: TextStyle(color: Colors.grey[600], fontSize: 25.0),
          ),
          onTap: () {
            if (_a == 1)
              return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Request(),
                  ));
            else
              return 1;
          },
        ),
        ListTile(
          title: Text(
            _title2,
            style: TextStyle(color: Colors.grey[600], fontSize: 25.0),
          ),
          onTap: () {
            if (_a == 1)
              return 1;
            else
              return 1;
          },
        ),
      ],
      //onExpansionChanged: ,
    );
  }
}
