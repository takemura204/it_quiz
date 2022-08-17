import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/quiz_learn/quiz_learn_screen_controller.dart';

part 'quiz_choice_appbar.dart';
part 'quiz_choice_body.dart';

class QuizChoiceScreen extends StatelessWidget {
  const QuizChoiceScreen(this.arguments);
  final QuizChoiceScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(arguments),
      body: _Body(arguments),
    );
  }
}
