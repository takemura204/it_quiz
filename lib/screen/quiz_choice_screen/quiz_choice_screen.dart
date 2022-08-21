import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_choice/quiz_choice_screen_controller.dart';
import '../../controller/quiz_choice/quiz_choice_screen_state.dart';
import '../../resource/lang/initial_resource.dart';

part 'quiz_choice_appbar.dart';
part 'quiz_choice_body.dart';
part 'quiz_choice_view.dart';

class QuizChoiceScreen extends ConsumerWidget {
  const QuizChoiceScreen(this.arguments);
  final QuizChoiceScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        quizChoiceScreenControllerProvider.overrideWithProvider(
            StateNotifierProvider<QuizChoiceScreenController,
                QuizChoiceScreenState>(
          (ref) => QuizChoiceScreenController(ref: ref, arguments: arguments),
        )),
      ],
      child: Scaffold(
        appBar: _AppBar(arguments),
        body: _Body(arguments),
      ),
    );
  }
}
