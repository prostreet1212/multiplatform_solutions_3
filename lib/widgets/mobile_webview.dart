import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


Widget webView()=>MobileWebView();

class MobileWebView extends StatefulWidget {
   MobileWebView({Key? key}) : super(key: key);

  @override
  State<MobileWebView> createState() => _MobileWebViewState();
}

class _MobileWebViewState extends State<MobileWebView> {
  bool isLoading = false;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
     controller=WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() => isLoading = true);
          },
          onPageStarted: (String url) {
            setState(() => isLoading = true);
          },
          onPageFinished: (String url) {
            setState(() => isLoading = false);
          },
          onWebResourceError: (WebResourceError error) {
            setState(() => isLoading = false);
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );
     controller.loadRequest(Uri.parse('http://kdrc.ru'));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(
          controller: controller,
        ),
        isLoading
            ? Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )
            : Container(),
      ],
    );
  }
}
