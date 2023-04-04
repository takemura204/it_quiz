import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_controller.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../view/button.dart';

part 'quiz_choice_result_appbar.dart';
part "quiz_choice_result_body.dart";
part 'quiz_choice_result_view.dart';

class QuizChoiceResultScreen extends StatelessWidget {
  const QuizChoiceResultScreen(this.arguments);
  final QuizChoiceScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(arguments),
      body: _Body(arguments),
    );
  }
}
