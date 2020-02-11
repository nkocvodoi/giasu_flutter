import 'package:flutter/material.dart';
import 'package:test_giasu/UI_Main/BottomNavigationBar.dart';

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
                  padding: EdgeInsets.only(top: 40.0, ),
                  child: new Center(
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(80.0),
                      child: Image.asset('assets/red.jpg',
                        cacheWidth: 100,
                      ),
                    ),
                  ),
                ),
                Text('Name',
                  style: TextStyle(color: Colors.white,fontSize: 25.0),

                ),
              ],
            ),
            decoration: BoxDecoration(
              color: _color,
            ),

          ),
          Divider(thickness: 6,),
          _buildText('Trang cá nhân'),
          Divider(thickness: 1,),
          _buildText('Cập nhật thông tin'),
          Divider(thickness: 1,),
          _buildText('Đổi mật khẩu'),
          Divider(thickness: 6,),
          _buildText('Quản lý lớp'),
          _buildExpansionTile1('Giới thiệu lớp', 'Tạo lớp', 'Chính sách'),
          _buildExpansionTile1('Giới thiệu gia sư', 'Giới thiệu', 'Chính sách'),
          Divider(thickness: 6,),
          _buildExpansionTile('Chính sách & điều khoản', 'Chính sách bảo mật', 'Điều khoản sử dụng', 'Hợp đồng gia sư'),
          _buildText('Câu hỏi thường gặp'),
          Divider(thickness: 1,),
          _buildText('Trợ giúp & cài đặt'),
          Divider(thickness: 1,),
          _buildText('Đăng xuất'),


        ],
      ),
//      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
  Widget _buildText(String _text) {
    return ListTile(
      title: Text(_text,
        style: TextStyle(color: Colors.grey[600],fontSize: 25.0),
      ),
      onTap: () {},
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
  Widget _buildExpansionTile (String _title,String _title1,String _title2,String _title3, ) {
    return ExpansionTile(
      title: Text(_title,
        style: TextStyle(color: Colors.grey[600],fontSize: 25.0),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      children: <Widget>[
        ListTile(
          title: Text(_title1,
            style: TextStyle(color: Colors.grey[600],fontSize: 25.0),
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(_title2,
            style: TextStyle(color: Colors.grey[600],fontSize: 25.0),
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(_title3,
            style: TextStyle(color: Colors.grey[600],fontSize: 25.0),
          ),
          onTap: () {},
        ),


      ],
    );
  }
  Widget _buildExpansionTile1 (String _title,String _title1,String _title2 ) {
    bool _a = true;
    void _change (bool _a) {
     _a = !_a;
    }
    return ExpansionTile(
      title: Text(_title,
        style: TextStyle(color: Colors.grey[600],fontSize: 25.0),
      ),
      trailing: _a ? Icon(Icons.arrow_forward_ios) : Icon(Icons.keyboard_arrow_down) ,
      children: <Widget>[
        ListTile(
          title: Text(_title1,
            style: TextStyle(color: Colors.grey[600],fontSize: 25.0),
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(_title2,
            style: TextStyle(color: Colors.grey[600],fontSize: 25.0),
          ),
          onTap: () {
          },
        ),
      ],
      //onExpansionChanged: ,
    );
  }
}