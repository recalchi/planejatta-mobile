import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Isso é necessário quando você chama funções assíncronas antes do runApp
  await requestPermissions();
  runApp(MyApp());
}

Future<void> requestPermissions() async {
  final status = await Permission.photos.status;
  print("Permissão de fotos: $status");
  if (status.isDenied) {
    // O usuário negou a permissão. Você pode mostrar um aviso ou algo similar aqui.
  }
}

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
