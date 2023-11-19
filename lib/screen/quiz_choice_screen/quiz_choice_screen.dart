import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_choice/quiz_choice_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../view/admob.dart';
import '../../view/button_icon/cutom_back_button.dart';
import '../../view/dialog.dart';
import '../quiz_choice_result_screen/quiz_choice_result_screen.dart';

part 'quiz_choice_view.dart';

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
    final isResultScreen = ref.watch(quizChoiceScreenProvider).isResultScreen;
    return isResultScreen

        ///結果画面
        ? QuizChoiceResultScreen(quiz)

        ///クイズ画面
        : Scaffold(
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
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(quiz.category),
      leading: CustomBackButton(onPressed: () async {
        await showDialog(
            context: context,
            builder: (context) {
              return PrimaryDialog(
                onPressed: () {
                  ref.read(quizChoiceScreenProvider.notifier).resetScreen();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                title: "学習を中断しますか？",
                subWidget: Text(
                  "学習を中断すると\nこれまでの内容は保存されません。",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: context.width * 0.04, color: Colors.black87),
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
    return Stack(
      children: [
        Column(
          children: [
            const Spacer(),

            ///問題画面
            Card(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: context.mainColor,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: context.width * 0.85,
                height: context.height * 0.5,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ///問題文
                    _Question(quiz),

                    ///進捗状況
                    _QuizProgress(quiz),
                  ],
                ),
              ),
            ),
            const Spacer(),

            ///選択肢
            _SelectAnswer(quiz),

            ///広告
            AdBanner(),
          ],
        ),
        _JudgeIcon(quiz),
      ],
    );
  }
}
