import 'package:flutter/material.dart';
import 'package:flutter_assignment/custom_text.dart';
import 'package:flutter_assignment/text_control.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _text = "Click on button bellow to change this text.";

  void _changeText() {
    setState(() {
      _text = "This is another text";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Assignment App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: _text),
              TextControl(handleText: _changeText),
            ],
          ),
        ),
      ),
    );
  }
}
