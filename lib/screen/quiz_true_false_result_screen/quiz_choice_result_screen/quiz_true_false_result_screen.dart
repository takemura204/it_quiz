import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../../controller/quiz_true_false/quiz_true_false_controller.dart';
import '../../../view/button.dart';

part 'quiz_true_false_result_appbar.dart';
part "quiz_true_false_result_body.dart";
part 'quiz_true_false_result_view.dart';

class QuizTrueFalseResultScreen extends StatelessWidget {
  const QuizTrueFalseResultScreen(this.arguments);
  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(arguments),
      body: _Body(arguments),
    );
  }
}
