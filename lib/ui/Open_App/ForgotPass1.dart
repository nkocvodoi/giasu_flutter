import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/forgotPassModel.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';

import 'ForgotPass2.dart';

class ForgotPass1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ForgotPass1State();
  }
}

class _ForgotPass1State extends State<ForgotPass1> {
  String _email_phone = 'Email/ Số điện thoại',
      _newPass = 'Mật khẩu mới',
      _newPass2 = 'Nhập lại mật khẩu mới';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorApp,
        title: new Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
          child: Text(
            'Quên mật khẩu',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
          ),
        ),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: colorApp,
                  ),
                ),
                new SizedBox(
                  height: 70.0,
                ),
                _buildBox(_newPass, true),
                new SizedBox(
                  height: 20.0,
                ),
                _buildBox(_newPass2, true),
                new SizedBox(
                  height: 20.0,
                ),
                new Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 60.0, right: 60.0),
                    child: Text(
                      '*Mật khẩu bắt buộc từ 6 -32 ký tự, bao gồm chữ và số',
                      style: TextStyle(
                          fontSize: 15.0, fontStyle: FontStyle.italic),
                    ),
                  ),
                ),

                new SizedBox(
                  height: 10.0,
                ),

                new Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPass2(),
                            ));
                      },
                      color: Colors.blue[800],
                      child: new Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Khôi phục mật khẩu',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 35.0,
              child: new Container(
                child: TextField(
                  autofocus: true,
                  style: TextStyle(fontSize: 20.0),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    hintText: _email_phone,
                  ),
                ),
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildBox(String _a, bool _b) {
    return Consumer<ForgotPassModel>(
      builder: (_, model, __) {
        return Container(
          width: 300,
          child: TextField(
            obscureText: model.count,
            style: TextStyle(fontSize: 20.0),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                hintText: _a,
                suffixIcon: IconButton(
                    icon: model.count
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      model.change();
                    })),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(16.0),
          ),
        );
      },
    );
  }

}