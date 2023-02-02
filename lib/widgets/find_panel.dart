import 'package:flutter/material.dart';

class FindPanel extends StatefulWidget {
  const FindPanel({Key? key, required this.load}) : super(key: key);
  final Function(String s) load;

  @override
  State<FindPanel> createState() => _FindPanelState();
}

class _FindPanelState extends State<FindPanel> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = 'http://kdrc.ru';
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      ),
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
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text('LOAD'),
                    onPressed: () {
                      widget.load(textController.text);
                    },
                  )),
              //)
            ],
          ),
        ),
      ),
    );
  }
}
