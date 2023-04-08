import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/entity/quiz_item.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_choice/quiz_choice_screen_controller.dart';
import '../../controller/quiz_choice/quiz_choice_screen_state.dart';
import '../../resource/lang/initial_resource.dart';
import '../../view/button.dart';
import '../quiz_choice_result_screen/quiz_choice_result_screen.dart';

part 'quiz_choice_appbar.dart';
part 'quiz_choice_body.dart';
part 'quiz_choice_view.dart';

class QuizChoiceScreen extends ConsumerWidget {
  const QuizChoiceScreen(this.item);
  final QuizItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        quizChoiceScreenControllerProvider.overrideWithProvider(
            StateNotifierProvider<QuizChoiceScreenController,
                QuizChoiceScreenState>(
          (ref) => QuizChoiceScreenController(ref: ref, item: item),
        )),
      ],
      child: _Scaffold(item),
    );
  }
}

class _Scaffold extends ConsumerWidget {
  const _Scaffold(this.item);
  final QuizItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen =
        ref.watch(quizChoiceScreenControllerProvider).isResultScreen;
    return isResultScreen

        ///結果画面
        ? QuizChoiceResultScreen(item)

        ///クイズ画面
        : Scaffold(
            appBar: _AppBar(item),
            body: _Body(item),
          );
  }
}
