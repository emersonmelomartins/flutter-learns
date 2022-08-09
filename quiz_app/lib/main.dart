import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    _questionIndex += 1;
    setState(() {});
  }

  void _resetQuiz() {
    _questionIndex = 0;
    _totalScore = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const questions = <Map<String, dynamic>>[
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {
            'text': 'Black',
            'score': 10,
          },
          {
            'text': 'Red',
            'score': 5,
          },
          {
            'text': 'Green',
            'score': 3,
          },
          {
            'text': 'White',
            'score': 1,
          }
        ]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {
            'text': 'Rabbit',
            'score': 1,
          },
          {
            'text': 'Snake',
            'score': 3,
          },
          {
            'text': 'Elephant',
            'score': 5,
          },
          {
            'text': 'Lion',
            'score': 10,
          },
        ]
      },
      {
        'questionText': 'Who\'s your favorite instructor',
        'answers': [
          {
            'text': 'Max',
            'score': 10,
          },
          {
            'text': 'Max',
            'score': 10,
          },
          {
            'text': 'Max',
            'score': 10,
          },
          {
            'text': 'Max',
            'score': 10,
          },
        ]
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My First App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: questions.length > _questionIndex
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: questions,
                )
              : Result(
                  totalScore: _totalScore,
                  resetHandler: _resetQuiz,
                ),
        ),
      ),
    );
  }
}
