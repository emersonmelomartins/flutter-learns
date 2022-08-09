import 'package:flutter/material.dart';

class TextControl extends StatelessWidget {
  final VoidCallback handleText;
  const TextControl({Key? key, required this.handleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: handleText, child: const Text("Change Text")),
    );
  }
}
