import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/color_resource.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/initial_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_learn/quiz_learn_screen_controller.dart';

part 'quiz_learn_appbar.dart';
part 'quiz_learn_body.dart';
part 'view/quiz_learn_confirm_button.dart';
part 'view/quiz_learn_question.dart';

class QuizLearnScreen extends StatelessWidget {
  const QuizLearnScreen(this.arguments);
  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(arguments),
      body: _Body(arguments),
    );
  }
}
