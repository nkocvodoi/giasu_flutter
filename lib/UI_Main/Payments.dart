import 'package:flutter/material.dart';
import 'package:test_giasu/UI_Main/General_Infor.dart';

class Payments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Payments_State();
  }
}

class _Payments_State extends State<Payments> {
  final Color _color = Color.fromRGBO(47, 101, 174, 1);

  String _selectedvalue = 'Thanh toán đủ phí' ;
  List<String> _menu = ['Thanh toán đủ phí', 'Nợ phí'];
  String infor = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: 80.0,
                child: Text(
                  'Chọn hình thức thanh toán',
                  style: TextStyle(
                      height: 0.0, color: Colors.white, fontSize: 25.0),
                ),
                decoration: BoxDecoration(
                  color: _color,
                ),
              ),
              SizedBox(height: 50,),
              Expanded(
                  child: Container(
                    width: 380,
                    child: Text(infor ,
                      style: TextStyle(color: colorApp, fontSize: 25.0),
                    ),
                  ),
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: 240),
                child: RaisedButton(
                  padding: EdgeInsets.all(10.0),
                  color: _color,
                  onPressed: () {
                    print('tap');
                  },
                  child: Text(
                    'Thanh toán',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 30.0,),
            ],
          ),
          Positioned(
            top: 50,
            child: Container(
              height: 60,
              width: 370,
              child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                child: DropdownButton<String>(
                  underline: Container(color: Colors.transparent,),
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey,),
                  iconSize: 36,
                  value: _selectedvalue,
                  items: _menu.map((_menu){
                    return DropdownMenuItem(
                      value: _menu,
                      child: Row(
                        children: <Widget>[
                          Text(_menu,
                            style: TextStyle( fontSize: 25.0, color: Colors.grey),
                          ),
                          SizedBox(width: 100,),
                          //Icon(Icons.keyboard_arrow_down, size: 10,)
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (v) {
                    setState(() {
                      _selectedvalue = v;
                      if(v == 'Nợ phí') infor = 'Bạn cần nạp đủ 250 Bits và được nợ lạ 240 Bits tối đa 35 ngày (kể từ ngày bắt đầu nhận lớp)';
                      else infor = 'Bạn cần nạp đủ 490 Bits';
                    });
                  },
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
