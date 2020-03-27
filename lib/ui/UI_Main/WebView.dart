import 'dart:async';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:flutter/material.dart';
import 'package:test_giasu/ui/UI_Main/Bits_Manager.dart';
import 'package:test_giasu/ui/UI_Main/General_Infor.dart';
//Webview in flutter


class MyWebView extends StatefulWidget {
  final String websiteUrl;

  MyWebView({Key key, this.websiteUrl}) : super(key: key);

  @override
  _WebViewFlutterState createState() => _WebViewFlutterState();
}

class _WebViewFlutterState extends State<MyWebView> {

  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: colorApp,),
      body:
//      WebView(
////        key: _key,
//        initialUrl: widget.websiteUrl,
////        javascriptMode: JavascriptMode.unrestricted,
//        onWebViewCreated: (WebViewController webViewController) {
//          _controller.complete(webViewController);
//
//        },
//      ),
      InAppWebView(
        initialUrl: widget.websiteUrl,
        initialHeaders: {},
        initialOptions: InAppWebViewWidgetOptions(
            crossPlatform: InAppWebViewOptions(
//              useShouldOverrideUrlLoading: true,
              debuggingEnabled: true,
            ),
//            android: AndroidInAppWebViewOptions(
////                dropDownWorkaroudEnabled: true
//
//
//            ),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          webView = controller;
        },
//         shouldOverrideUrlLoading: getEvent(webView, 'fhjbjhsf'),
//      onLoadError: (controller, url, code, message) {
//        print("\n\nCan't load $url.. Error: $message\n\n");
//      },
//        shouldOverrideUrlLoading: ,
      ),
    );
  }
//  Future<ShouldOverrideUrlLoadingAction> getEvent(InAppWebViewController controller, String _url) {
//    if(controller.) {
//      setState(() {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => Bits_Manager(),
//          ),
//        );
//      });
//    }
//
//  }
}