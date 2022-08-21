import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/resource/lang/initial_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';
import 'package:kentei_quiz/screen/quiz_learn_result/quiz_learn_result_screen.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_learn/quiz_learn_screen_controller.dart';

part 'quiz_learn_appbar.dart';
part 'quiz_learn_body.dart';
part 'quiz_learn_view.dart';

class QuizLearnScreen extends ConsumerWidget {
  const QuizLearnScreen(this.arguments);
  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen =
        ref.watch(quizLearnScreenControllerProvider).isResultScreen;

    return isResultScreen
        ? QuizLearnResultScreen(arguments)
        : QuizLearnContent(arguments);
  }
}

class QuizLearnContent extends StatelessWidget {
  const QuizLearnContent(this.arguments);
  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(arguments),
      body: _Body(arguments),
    );
  }
}
