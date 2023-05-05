import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_true_false/quiz_true_false_controller.dart';
import '../../view/button.dart';
import '../quiz_true_false_result_screen/quiz_choice_result_screen/quiz_true_false_result_screen.dart';

part 'quiz_true_false_body.dart';
part 'quiz_true_false_view.dart';
part 'quiz_ture_false_appbar.dart';

class QuizTureFalseScreen extends ConsumerWidget {
  const QuizTureFalseScreen(this.arguments);
  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        quizTureFalseScreenControllerProvider.overrideWith(
          (ref) =>
              QuizTrueFalseScreenController(ref: ref, arguments: arguments),
        ),
      ],
      child: _Scaffold(arguments),
    );
  }
}

class _Scaffold extends ConsumerWidget {
  const _Scaffold(this.arguments);
  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen =
        ref.watch(quizTureFalseScreenControllerProvider).isResultScreen;
    return isResultScreen

        ///結果画面
        ? QuizTrueFalseResultScreen(arguments)

        ///クイズ画面
        : Scaffold(
            appBar: _AppBar(arguments),
            body: _Body(arguments),
          );
  }
}
