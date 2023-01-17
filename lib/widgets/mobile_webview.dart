import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget webView(String link) => MobileWebView(link: link);

class MobileWebView extends StatefulWidget {
  MobileWebView({Key? key, required this.link}) : super(key: key);
  String link;

  var state;
  void loadUrl(){
    if(state!=null){
      _MobileWebViewState().loadUrl();
    }else{

    }

  }

  @override
  State<MobileWebView> createState() {
    state = _MobileWebViewState();
    return state;
  }


}

class _MobileWebViewState extends State<MobileWebView> {
  bool isLoading = false;
  late WebViewController controller;

  void loadUrl(){
    controller.loadRequest(Uri.parse('http://kdrc.ru'));
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
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
