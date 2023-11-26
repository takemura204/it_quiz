import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_choice/quiz_choice_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button/primary_button.dart';
import '../../view/button_icon/clear_button.dart';
import '../../view/button_icon/cutom_back_button.dart';
import '../../view/card/quiz_card.dart';
import '../../view/dialog.dart';
import '../screen_argument.dart';

part 'choice_challenge/choice_challenge_body.dart';
part 'choice_challenge/choice_challenge_view.dart';
part 'choice_result/choice_result_body.dart';
part 'choice_result/choice_result_view.dart';

class QuizChoiceScreen extends ConsumerWidget {
  const QuizChoiceScreen(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        quizChoiceScreenProvider.overrideWith(
          (ref) => QuizChoiceScreenController(ref: ref, quiz: quiz),
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
    ///クイズ画面
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
    final isResultScreen = ref.watch(quizChoiceScreenProvider).isResultScreen;
    return isResultScreen
        ? AppBar(
            titleSpacing: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text("結果"),
            actions: [
              ClearButton(
                iconSize: context.width * 0.1,
                onPressed: () {
                  //問題リセット
                  ref.read(quizChoiceScreenProvider.notifier).resetScreen();
                },
              ),
            ],
          )
        : AppBar(
            titleSpacing: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(quiz.title),
            leading: CustomBackButton(onPressed: () async {
              await showDialog(
                  context: context,
                  builder: (context) {
                    return PrimaryDialog(
                      onPressed: () {
                        ref
                            .read(quizChoiceScreenProvider.notifier)
                            .resetScreen();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      title: "学習を中断しますか？",
                      subWidget: Text(
                        "学習を中断すると\nこれまでの内容は保存されません。",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: context.width * 0.04,
                            color: Colors.black87),
                        maxLines: 2,
                      ),
                      cancelText: "続ける",
                      doneText: "中断する",
                    );
                  });
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
    final isResultScreen = ref.watch(quizChoiceScreenProvider).isResultScreen;
    return isResultScreen ? _ChoiceResultBody(quiz) : ChoiceChallengeBody(quiz);
  }
}
