import 'package:flutter/material.dart';
import 'package:html/parser.dart' show parse;
import 'package:dio/dio.dart';
import '../app_platform.dart';
import '../widgets/multiplatform_webview.dart'
if(dart.library.io) '../widgets/mobile_webview.dart'
if(dart.library.html) '../widgets/web_platform_webview.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  Future<String>? htmlText = null;


  @override
  void initState() {
    super.initState();
    textController.text = 'https://flutter.dev';

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 12,
              child: webView(),
              //child: WebPlatformWebView()
          ),
          //Divider(thickness: 2,color: Colors.black45,),
          Container(color: Colors.black45, height: 1),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    //width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    height: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        //minimumSize: Size(100, 100),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      child: const Text('LOAD'),
                      onPressed: () {
                        setState(() {
                          //m.controller.loadRequest(Uri.parse(textController.text));
                        });
                        /*setState(() {
                          isLoading = true;
                          htmlText = getHtmlCode(textController.text);
                          controller
                              .loadRequest(Uri.parse(textController.text));
                          //htmlText = getHtmlCode('https://flutter.dev');
                        });*/
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            'APPLICATION RUNNING ON ${AppPlatform.platform.toUpperCase()}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    ));
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}

Future<String> getHtmlCode(String text) async {
  try {
    Dio dio = Dio();
    var response = await dio.get(text);
    if (response.statusCode == 200) {
      String htmlToParse = response.headers.toString();
      return htmlToParse;
    } else {
      return 'Не удалось загрузить данные';
    }
  } on DioError catch (e) {
    throw e.error.message.toString();
  }
}

String getHtmlTitle(String htmlCode) {
  var doc = parse(htmlCode);
  print(htmlCode);
  String title = doc.getElementsByTagName('title')[0].innerHtml;
  return title;
}
