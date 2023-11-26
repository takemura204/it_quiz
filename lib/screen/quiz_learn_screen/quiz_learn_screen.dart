import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/lang/initial_resource.dart';
import 'package:kentei_quiz/view/card/learn_result_card.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_learn/quiz_learn_screen_controller.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/admob/admob_native_advance.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button/primary_button.dart';
import '../../view/button_icon/clear_button.dart';
import '../../view/button_icon/cutom_back_button.dart';
import '../../view/button_icon/cutom_cirlcle_button.dart';
import '../../view/card/quiz_item_card.dart';
import '../../view/card/result_dashboard_card.dart';
import '../screen_argument.dart';

part 'learn_challenge/learn_challenge_body.dart';

part 'learn_challenge/learn_challenge_view.dart';

part 'learn_result/learn_result_body.dart';

part 'learn_result/learn_result_view.dart';

class QuizLearnScreen extends ConsumerWidget {
  const QuizLearnScreen(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        quizLearnScreenProvider.overrideWith(
          (ref) => QuizLearnScreenController(ref: ref, quiz: quiz),
        ),
      ],
      child: _Scaffold(quiz),
    );
  }
}

class _Scaffold extends ConsumerWidget {
  const _Scaffold(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _AppBar(quiz),
      body: _Body(quiz),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen = ref.watch(quizLearnScreenProvider).isResultScreen;
    return isResultScreen
        ? AppBar(
            titleSpacing: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text("結果"),
            actions: [
              ClearButton(
                  iconSize: 30,
                  onPressed: () {
                    ref
                        .read(quizLearnScreenProvider.notifier)
                        .updateHistoryQuiz();
                    Navigator.of(context).pop();
                    ref.read(quizLearnScreenProvider.notifier).tapClearButton();
                  }),
            ],
          )
        : AppBar(
            titleSpacing: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(quiz.title),
            leading: CustomBackButton(onPressed: () {
              ref.read(quizLearnScreenProvider.notifier).tapClearButton();
              Navigator.pop(context);
            }),
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends ConsumerWidget {
  const _Body(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen = ref.watch(quizLearnScreenProvider).isResultScreen;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        if (isResultScreen)
          _LearnResultBody(quiz)
        else
          _LearnChallengeBody(quiz),
      ],
    );
  }
}
