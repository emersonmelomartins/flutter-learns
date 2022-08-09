import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final Function(int score) answerQuestion;
  final int questionIndex;

  const Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionText: questions[questionIndex]['questionText'].toString(),
        ),
        ...questions[questionIndex]['answers']
            .map((Map<String, dynamic> answer) {
          return Answer(
            selectHandler: () => answerQuestion(answer['score']),
            answerText: answer['text'],
          );
        })
      ],
    );
  }
}
