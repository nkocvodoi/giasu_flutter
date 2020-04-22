import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:provider/provider.dart';
import 'package:test_giasu/core/view_model/forgotPassModel.dart';
import 'package:test_giasu/ui/Helper/ScreenConfig.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

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

  bool isSelected1 = true;
  bool isSelected2 = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: buildPreviousButton(),
        backgroundColor: colorApp,
        title: Text(
          'Quên mật khẩu',
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
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: colorApp,
                  ),
                ),
                new SizedBox(
                  height: 50.0,
                ),
                _buildBox(_newPass, isSelected1),
                new SizedBox(
                  height: 5.0,
                ),
                _buildBox(_newPass2, isSelected2),
                new SizedBox(
                  height: 5.0,
                ),
                new Container(
                  padding: EdgeInsets.only(left: 60.0, right: 60.0),
                  child: Text(
                    '*Mật khẩu bắt buộc từ 6 -32 ký tự, bao gồm chữ và số',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey),
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
                      color: colorApp,
                      child: new Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Text(
                          'Khôi phục mật khẩu',
                          style: TextStyle(
                              color: Colors.white),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 25.0,
              child: new Container(
                child: TextField(
                  
                  autofocus: true,
                  style: TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: _email_phone,
                  ),
                ),
                height: 60,
                width: SizeConfig.safeBlockHorizontal * 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  //   border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(10),
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
          height: 60,
          width: SizeConfig.safeBlockHorizontal* 70,
          child: TextField(
            obscureText: model.count,
            style: TextStyle(fontSize: 18.0),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: _a,
                suffixIcon: IconButton(
                    icon: _b
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      model.change();
                      _b = !_b;
                    })),
          ),
         
        );
      },
    );
  }
}
