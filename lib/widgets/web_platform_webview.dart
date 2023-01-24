import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import "package:universal_html/html.dart";

//import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../app_platform.dart';
import 'find_panel.dart';

Widget webView() =>  WebPlatformWebView();
/*
class WebPlatformWebView extends StatelessWidget {
   WebPlatformWebView({Key? key}) : super(key: key);

  String id='';
  void loadUrl(String url) {
    id = Random().nextInt(1000).toString();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        id, (int viewId) => IFrameElement()..src = url);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 12,
          child: HtmlElementView(viewType: id),
          /*child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse('https://kdrc.ru')),),*/
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
*/


class WebPlatformWebView extends StatefulWidget {
  const WebPlatformWebView({Key? key}) : super(key: key);

  @override
  State<WebPlatformWebView> createState() => _WebPlatformWebViewState();
}


class _WebPlatformWebViewState extends State<WebPlatformWebView> {
  String id='';
  void loadUrl(String url) {
    setState(() {
      id = Random().nextInt(1000).toString();
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
          id, (int viewId) => IFrameElement()..src = url);
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

