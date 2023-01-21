import 'package:flutter/material.dart';
import 'package:multiplatform_solutions_3/widgets/find_panel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../app_platform.dart';

Widget webView() => const MobileWebView();

class MobileWebView extends StatefulWidget {
  const MobileWebView({Key? key}) : super(key: key);

  @override
  State<MobileWebView> createState() {
    return _MobileWebViewState();
  }
}

class _MobileWebViewState extends State<MobileWebView> {
  bool isLoading = false;
  late WebViewController controller;


  void loadUrl(String url) {
    controller.loadRequest(Uri.parse(url));
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
    return Column(
      children: [
        Expanded(
          flex: 12,
          child: Stack(
            children: [
              WebViewWidget(
                controller: controller,
              ),
              isLoading
                  ? Container(
                      color: Colors.white,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(),
            ],
          ),
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

  @override
  void dispose() {
    //textController.dispose();
    super.dispose();
  }
}
