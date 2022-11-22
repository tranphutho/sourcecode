import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewScreen extends StatelessWidget {
  final String url;
  const WebViewScreen({Key? key,required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
