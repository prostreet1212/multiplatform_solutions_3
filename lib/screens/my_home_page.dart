import 'package:flutter/material.dart';
import '../widgets/multiplatform_webview.dart'
    if (dart.library.io) '../widgets/mobile_webview.dart'
    if (dart.library.html) '../widgets/web_platform_webview.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: webView(),
      ),
    );
  }
}
