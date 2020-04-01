import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:provider/provider.dart';
import 'package:test_giasu/ui/Open_App/ForgotPass2.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
import 'package:test_giasu/ui/Widgets/previous_widget.dart';

class ResetPass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ResetPassState();
  }
}

class _ResetPassState extends State<ResetPass> {
  String _oldPass = 'Mật khẩu cũ',
      _newPass = 'Mật khẩu mới',
      _newPass2 = 'Nhập lại mật khẩu mới';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bool _isSelected1 = true;
    bool _isSelected2 = true;
    return Scaffold(
      appBar: AppBar(
        leading: buildPreviousButton(),
        backgroundColor: colorApp,
        title: Text(
          'Đổi mật khẩu',
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
                  height: 40.0,
                ),
                _buildBox(_newPass, _isSelected1),
                new SizedBox(
                  height: 20.0,
                ),
                _buildBox(_newPass2, _isSelected2),
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
                        Navigator.pop(context);
                      },
                      color: Colors.blue[800],
                      child: new Padding(
                        padding: EdgeInsets.only(left: 3, right:3),
                        child: Text(
                          'Đổi mật khẩu',
                          style: TextStyle(
                              
                              fontWeight: FontWeight.w400,
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
              top: 35.0,
              child: new Container(
                child: TextField(
                  autofocus: true,
                  style: TextStyle(fontSize: 18.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left:5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    hintText: _oldPass,
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
    return ChangeNotifierProvider<Counter>(
      create: (_) => Counter(),
      child: Consumer<Counter>(
        builder: (_, counter, __) => _change_obscure(_a, counter, _b),
      ),
    );
  }

  Widget _change_obscure(String _a, Counter counter, bool _isSelected) {
    return new Container(
      width: 300,
      child: TextField(
        obscureText: counter.count,
        style: TextStyle(fontSize: 18.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintText: _a,
            suffixIcon: IconButton(
                icon: _isSelected
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
                onPressed: () {
                  counter.change();
                  _isSelected = !_isSelected;
                })),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  bool _count = true;

  bool get count => _count;
  void setCount(bool val) {
    if (val != _count) {
      _count = val;
      notifyListeners();
    }
  }

  change() {
    setCount(!_count);
  }
}
