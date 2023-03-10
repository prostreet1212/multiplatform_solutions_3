import "package:universal_html/html.dart";
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../app_platform.dart';
import 'find_panel.dart';

Widget webView() => const WebPlatformWebView();

class WebPlatformWebView extends StatefulWidget {
  const WebPlatformWebView({Key? key}) : super(key: key);

  @override
  State<WebPlatformWebView> createState() => _WebPlatformWebViewState();
}

class _WebPlatformWebViewState extends State<WebPlatformWebView> {
  String id = '';

  void loadUrl(String url) {
    setState(() {
      id = Random().nextInt(1000).toString();
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry
          .registerViewFactory(id, (int viewId) => IFrameElement()..src = url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 12,
          child: HtmlElementView(viewType: id),
        ),
        Container(color: Colors.black45, height: 1),
        FindPanel(load: loadUrl),
        Text(
          'APPLICATION RUNNING ON ${AppPlatform.platform.toUpperCase()}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
