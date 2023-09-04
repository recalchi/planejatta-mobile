import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView App',
      home: WebViewPage(),
      debugShowCheckedModeBanner: false, // Remove a faixa de "debug"
    );
  }
}

class WebViewPage extends StatelessWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      // AppBar removido
      body: _buildWebView(),
    );
  }

  Widget _buildWebView() {
    return InAppWebView(
      initialUrlRequest:
          URLRequest(url: Uri.parse('http://planejattainvest.com:5000/')),
    );
  }
}
