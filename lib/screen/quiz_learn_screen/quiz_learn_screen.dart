import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/lang/initial_resource.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_learn/quiz_learn_screen_controller.dart';
import '../../model/quiz/quiz.dart';
import '../../view/admob.dart';
import '../../view/icon_button.dart';
import '../quiz_learn_result_screen/quiz_learn_result_screen.dart';

part 'quiz_learn_view.dart';

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
    final isResultScreen = ref.watch(quizLearnScreenProvider).isResultScreen;
    return isResultScreen

        ///結果画面
        ? QuizLearnResultScreen(quiz)

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
    return Column(
      children: [
        const Spacer(),

        ///問題
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
            alignment: Alignment.center,
            child: Column(
              children: [
                Column(
                  children: [
                    ///問題文
                    _Question(quiz),

                    ///問題進捗状況
                    _QuizProgress(quiz),
                  ],
                ),
                Divider(thickness: 1.5, height: 1, color: context.mainColor),

                ///確認ボタン
                _ConfirmButton(quiz),
              ],
            ),
          ),
        ),
        const Spacer(),

        ///何周目か確認
        _LapInfoBar(quiz),

        ///広告
        AdBanner(),
      ],
    );
  }
}
