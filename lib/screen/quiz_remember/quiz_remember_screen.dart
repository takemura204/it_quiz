import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_one_question/quiz_one_question_screen_controller.dart';
import 'package:kentei_quiz/resource/color_resource.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/initial_resource.dart';
import 'package:kentei_quiz/resource/quiz_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

part 'quiz_remember_appbar.dart';
part 'quiz_remember_body.dart';

class QuizRememberScreen extends StatelessWidget {
  const QuizRememberScreen(this.arguments);
  final QuizRememberScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(arguments),
      body: _Body(arguments),
    );
  }
}
