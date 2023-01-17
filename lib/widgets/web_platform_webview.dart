import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;

Widget webView()=>WebPlatformWebView();

class WebPlatformWebView extends StatelessWidget {
  const WebPlatformWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id=Random().nextInt.toString();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(id,(int viewId)=>IFrameElement()..src='http://kdrc.ru');
    return HtmlElementView(viewType: id);
  }
}
