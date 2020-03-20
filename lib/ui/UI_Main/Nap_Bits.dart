import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_giasu/core/model/currentUser.dart';
import 'package:test_giasu/core/service/authentication_service.dart';
import 'package:test_giasu/core/view_model/napbitsModel.dart';

class Nap_Bits extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Nap_Bits_State();
  }
}

class _Nap_Bits_State extends State<Nap_Bits> {
  final Color _color = Color.fromRGBO(47, 101, 174, 1);
  final String _a = 'Họ Tên:',
      _b = 'Mã số(ID):',
      _c = 'Email:',
      _d = 'Số điện thoại:';
  int group1 = 0;
  int group2 = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: Center(
          child: Text(
            'Nạp Bits vào tài khoản của bạn',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: <Widget>[
            _Box1(),
            _Box2(),
            _Box3(),
            SizedBox(
              height: 40.0,
            ),
            Divider(
              thickness: 3,
            ),
            Padding(
              padding: EdgeInsets.only(left: 240),
              child: RaisedButton(
                color: _color,
                onPressed: () {
                  print('tap');
                },
                child: Text(
                  'Nạp Bits',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _Box1() {
    CurrentUser _user = Provider.of<AuthenticationService>(context).currentUser;
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 165,
      width: 380,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Thông tin tài khoản của bạn',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w500, color: _color),
            ),
            Row(
              children: <Widget>[
                _Infor(_a, _b, _c, _d),
                SizedBox(
                  width: 40.0,
                ),
                _Infor(
                  _user.full_name,
                  _user.id.toString(),
                  _user.email,
                  _user.identification_number,
                ),
              ],
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueAccent, width: 2),
      ),
    );
  }

  Widget _Infor(
    String _a,
    String _b,
    String _c,
    String _d,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildText(_a),
        _buildText(_b),
        _buildText(_c),
        _buildText(_d),
      ],
    );
  }

  Widget _buildText(String _s) {
    return Text(
      _s,
      style: TextStyle(
        height: 1.7,
        fontSize: 18,
      ),
    );
  }

  Widget _Box2() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 320,
      width: 380,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _richText('Bước 1: Chọn số tiền muốn nạp '),
            Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Row(
                //mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildBoxMoney('50 Bits = 50,000 VNĐ', 0,),
                  SizedBox(
                    width: 20.0,
                  ),
                  _buildBoxMoney('100 Bits = 100,000 VNĐ', 1,),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildBoxMoney('200 Bits = 200,000 VNĐ', 2, ),
                  SizedBox(
                    width: 20.0,
                  ),
                  _buildBoxMoney('500 Bits = 500,000 VNĐ', 3,),
                ],
              ),
            ),
            _buildBoxMoney('Số tiền khác', 4,),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueAccent, width: 2),
      ),
    );
  }

  Widget _buildBoxMoney(
    String _s,
    int _a,
  ) {
    return Consumer<NapBitsModel>(
        builder: (_ ,model, __) {
          return Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: 155.0,
                  height: 40.0,
                  child: Center(
                    child: Text(
                      _s,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Radio(
                    value: _a,
                    groupValue: model.group1,
                    onChanged: (T) {
//                      setState(() {
//                        group1 = T;
//                      });
//                    print(model.group1);
//                    print(T);
                    model.setGroup1(T);
                    print(model.group1);

                    },
                    ),
              ],
            ),
          );
        }
    );
  }

  Widget _richText(String _s) {
    return Expanded(
      child: new RichText(
        text: TextSpan(
          text: _s,
          style: TextStyle(color: _color, fontSize: 20.0),
          children: <TextSpan>[
            TextSpan(
              text: '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _Box3() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 230,
      width: 380,
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _richText('Bước 2: Chọn phương thức thanh toán '),
            _LineBox3('Nạp tiền bằng Internet-Banking', 0,),
            _LineBox3(
                'Thanh toán online bằng thẻ ngân hàng nội địa', 1,),
            _LineBox3('Chuyển khoản ngân hàng', 2,),
            _LineBox3('Nạp Coin tại văn phòng đại diện HTcon', 3,),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueAccent, width: 2),
      ),
    );
  }

  Widget _LineBox3(String _s, int _a) {
    return Consumer<NapBitsModel>(
        builder: (_ ,model, __) {
          return Row(
            children: <Widget>[
              Radio(
                  value: _a,
                  groupValue: model.group2,
                  onChanged: (value) {
//                    setState(() {
//                      group2 = value;
//                    });
                  model.setGroup2(value);
                  }),
              Text(
                _s,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
            ],
          );
        }
    );
  }
}
