import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/currentUser.dart';
import 'package:test_giasu/core/view_model/bitsmanagerModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/Account.dart';
import 'package:test_giasu/ui/UI_Main/Nap_Bits.dart';
import 'package:test_giasu/ui/Widgets/SliverAppBarDeelegate.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';
import 'BottomNavigationBar.dart';
import 'General_Infor.dart';

class Bits_Manager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Bits_Manager_State();
  }
}

class _Bits_Manager_State extends State<Bits_Manager> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: colorApp,
              expandedHeight: 40,
              automaticallyImplyLeading: false,
//              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Quản lý Bits',
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                child: PreferredSize(
                  preferredSize: Size.fromHeight(110),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: colorApp,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(),
                            ),
                            _header_box(
                                Icon(
                                  Icons.account_box,
                                  size: 40.0,
                                ),
                                'Nạp Bits',
                                1),
                            SizedBox(
                              width: 15.0,
                            ),
                            _header_box(
                                Icon(
                                  Icons.account_box,
                                  size: 40.0,
                                ),
                                'Chuyển Bits',
                                2),
                            SizedBox(
                              width: 15.0,
                            ),
                            _header_box(
                                Icon(
                                  Icons.account_box,
                                  size: 40.0,
                                ),
                                'Rút Bits',
                                3),
                            Expanded(
                              child: SizedBox(),
                            ),
                          ],
                        ),
                        //child: _header_box(Icon(Icons.account_box, size: 40.0,), 'Nạp Bits')
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Consumer<BitsManagerModel>(builder: (_, model, __) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                _Infor_Box(
                    'Bits khả dụng',
                    model.authenticationService.currentUser.available_coin
                        .toString()),
                SizedBox(
                  height: 7,
                ),
                _Infor_Box('Bits nợ',
                    model.authenticationService.currentUser.debt.toString()),
                SizedBox(
                  height: 7,
                ),
                _Infor_Box('Bits chờ rút',
                    model.authenticationService.currentUser.booking.toString()),
                SizedBox(
                  height: 7,
                ),
                _infor_text(),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(7),
                  width: 310,
                  height: 35,
                  color: blue,
                  child: Text(
                    'LỊCH SỬ GIAO DỊCH BITS',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
                _textField('Chọn giao dịch'),
                _textField('Ngày giao dịch'),
                _textField('Trạng thái'),
                SizedBox(height: 20),
                _button(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _Infor_Box(String _s, String _a) {
    return Container(
      height: 45.0,
      width: 300,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                _s,
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Text(
              _a,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: blue),
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }

  Widget _textField(String _text) {
    return Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _text,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 40,
              child: TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  hintStyle: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            
          ],
        ));
  }

  Widget _infor_text() {
    return Container(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            Infor_Bits_Manager,
            style: TextStyle(color: Colors.grey[700], fontSize: 15),
          ),
          RichText(
            text: TextSpan(
              text: 'Xem hướng dẫn,',
              style: TextStyle(color: Colors.grey[700], fontSize: 15),
              children: <TextSpan>[
                TextSpan(
                  text: ' tại đây!',
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      print('Log1');
                    },
                  style: TextStyle(
                    color: colorApp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _button() {
    return RaisedButton(
      onPressed: () {},
      color: colorApp,
      child: new Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: Text(
          'Tìm kiếm',
          style: TextStyle(color: Colors.white),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _header_box(
    Icon _icon,
    String _s,
    var _a,
  ) {
    return RaisedButton(
      padding: EdgeInsets.all(0.0),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              print(_a);
              switch (_a) {
                case 1:
                  {
                    return Nap_Bits(null);
                  }
                  break;
                default:
                  {
                    return MyBottomNavigationBar();
                  }
                  break;
              }
            },
          ),
        );
      },
      color: Colors.white,
      child: Container(
        height: 90,
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _icon,
            SizedBox(
              height: 10,
            ),
            Text(
              _s,
              style: TextStyle(
                  fontSize: 20.0, color: colorApp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
