import 'package:flutter/material.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

class QuizOneQuestionScreen extends StatelessWidget {
  const QuizOneQuestionScreen(this.arguments);
  final QuizOneQuestionScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(arguments.item.title)),
      body: Column(
        children: [
          Container(),
          Text(arguments.quizStyle),
          Text(arguments.item.id.toString()),
        ],
      ),
    );
  }
}
