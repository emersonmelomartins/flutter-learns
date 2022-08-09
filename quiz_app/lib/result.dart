import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetHandler;

  const Result({Key? key, required this.totalScore, required this.resetHandler})
      : super(key: key);

  String get resultPhrase {
    var resultText = 'You did it!';

    if (totalScore <= 8) {
      resultText = 'You are awesome!';
    } else if (totalScore <= 12) {
      resultText = 'Pretty likeable';
    } else if (totalScore <= 16) {
      resultText = 'You are ... strange?';
    } else {
      resultText = 'You are so bad!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(resultPhrase),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              color: Colors.black,
            ),
            children: [
              const TextSpan(text: "The final result is"),
              const WidgetSpan(
                child: SizedBox(
                  width: 5,
                ),
              ),
              TextSpan(
                text: totalScore.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
            onPressed: resetHandler, child: const Text("Restart Quiz!"))
      ],
    ));
  }
}
