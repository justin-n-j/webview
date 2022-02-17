import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({required this.url, Key? key}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late InAppWebViewController webViewController;
  bool status = true;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  Future<bool> _onBackPressed() async {
    var value = await webViewController.canGoBack();
    if (value) {
      webViewController.goBack();
      return false;
    } else {
      webViewController.goBack();
      return true;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          body: SafeArea(
              child: Column(children: <Widget>[
        Expanded(
          child: InAppWebView(
          /*  gestureRecognizers: Set()
              ..add(
                Factory<TapGestureRecognizer>(
                  () => TapGestureRecognizer(),
                ),
              ),*/
            gestureRecognizers: {
              Factory<TapGestureRecognizer>(
                    () => TapGestureRecognizer(),
              ),
            },
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            initialOptions: options,
            onWebViewCreated: (controller) {
              webViewController = controller;
              print("status is $status");
            },
            onConsoleMessage: (controller, consoleMessage) {
              print(consoleMessage);
            },
          ),
        ),
      ]))),
    );
  }
}
