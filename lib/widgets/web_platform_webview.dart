import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;

Widget webView(String link) => WebPlatformWebView(link: link);

class WebPlatformWebView extends StatelessWidget {

  WebPlatformWebView({Key? key, required this.link}) : super(key: key);
  String link;


  @override
  Widget build(BuildContext context) {
    final id = Random().nextInt(1000).toString();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        id, (int viewId) => IFrameElement()..src = link);
    return HtmlElementView(viewType: id);
  }
}
