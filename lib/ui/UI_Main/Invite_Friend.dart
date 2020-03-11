import 'package:flutter/material.dart';

import 'General_Infor.dart';

class Invite_Friend extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Invite_Friend_State();
  }
}

class _Invite_Friend_State extends State<Invite_Friend> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorApp,
        title: Center(
          child: Text(
            'Mời bạn bè làm gia sư',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _Store_Image(app_store),
                    _Store_Image(ch_play),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _Image('assets/Copy.png'),
                    _Image('assets/fb_share.png'),
                  ],
                ),
                Text(
                  'Copy link hoặc chia sẻ qua Facebook',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          Container(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _text_infor(infor_invite1),
                _text_infor(infor_invite2),
                _text_infor(infor_invite3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _Store_Image(String _s) {
    return InkWell(
      onTap: () {
        print('Tap');
      },
      child: Container(
        height: 60.0,
        width: 130.0,
        child: Image.network(_s),
      ),
    );
  }

  Widget _Image(String _s) {
    return InkWell(
      onTap: () {
        print('Tap2');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
        height: 30.0,
        width: 100.0,
        child: Image.asset(_s),
      ),
    );
  }

  Widget _text_infor(String _s) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 19.0, color: Colors.grey[600]),
        children: [
          WidgetSpan(
            child: Icon(
              Icons.done,
              color: Colors.green,
            ),
          ),
          TextSpan(text: _s),
        ],
      ),
    );
  }
}
