import 'package:flutter/material.dart';

import '../app_platform.dart';

class FindPanel extends StatefulWidget {
  FindPanel({Key? key, required this.load}) : super(key: key);
  Function(String s) load;

  @override
  State<FindPanel> createState() => _FindPanelState();
}

class _FindPanelState extends State<FindPanel> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = 'https://flutter.dev';
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    widget.load(textController.text);
                    //loadUrl(textController.text);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
