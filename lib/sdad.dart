import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Radio Button Example"),
          ),
          body: SafeArea(
              child: Center(
            child: Radiobutton(),
          ))),
    );
  }
}

class Radiobutton extends StatefulWidget {
  @override
  RadioButtonWidget createState() => RadioButtonWidget();
}

class RadioButtonWidget extends State {
  String radioItem = '';
  int _b = 1;
  String _s = 'dsjkndsjn';

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile(
          groupValue: radioItem,
          title: Text('Radio Button Item 1'),
          value: 'Item 1',
          onChanged: (val) {
            setState(() {
              radioItem = val;
            });
          },
        ),
        RadioListTile(
          groupValue: radioItem,
          title: Text('Radio Button Item 2'),
          value: 'Item 2',
          onChanged: (T) {
            setState(() {
              radioItem = T;
            });
          },
        ),
        Text(
          '$radioItem',
          style: TextStyle(fontSize: 23),
        ),
        Row(
          children: <Widget>[
            Radio(
                value: 1,
                groupValue: _b,
                onChanged: (T) {
                  setState(() {
                    _b = T;
                  });
                }),
            Text(
              _s,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(
                value: 2,
                groupValue: _b,
                onChanged: (T) {
                  setState(() {
                    _b = T;
                  });
                }),
            Text(
              _s,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
