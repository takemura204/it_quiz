import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/lang/initial_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_learn/quiz_learn_screen_controller.dart';
import '../../controller/quiz_learn/quiz_learn_screen_state.dart';
import '../../view/button.dart';
import '../quiz_learn_result_screen/quiz_learn_result_screen.dart';

part 'quiz_learn_appbar.dart';
part 'quiz_learn_body.dart';
part 'quiz_learn_view.dart';

class QuizLearnScreen extends ConsumerWidget {
  const QuizLearnScreen(this.arguments);
  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        quizLearnScreenControllerProvider.overrideWithProvider(
            StateNotifierProvider<QuizLearnScreenController,
                QuizLearnScreenState>(
          (ref) => QuizLearnScreenController(ref: ref, arguments: arguments),
        )),
      ],
      child: _Scaffold(arguments),
    );
  }
}

class _Scaffold extends ConsumerWidget {
  const _Scaffold(this.arguments);
  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen =
        ref.watch(quizLearnScreenControllerProvider).isResultScreen;

    return isResultScreen

        ///結果画面
        ? QuizLearnResultScreen(arguments)

        ///クイズ画面
        : Scaffold(
            appBar: _AppBar(arguments),
            body: _Body(arguments),
          );
  }
}
