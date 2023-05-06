import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_choice/quiz_choice_screen_controller.dart';
import '../../resource/lang/initial_resource.dart';
import '../../view/button.dart';
import '../../view/quiz_widget.dart';
import '../quiz_choice_result_screen/quiz_choice_result_screen.dart';

part 'quiz_choice_view.dart';

class QuizChoiceScreen extends ConsumerWidget {
  const QuizChoiceScreen(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        quizChoiceScreenProvider.overrideWith(
          (ref) => QuizChoiceScreenController(ref: ref, item: item),
        ),
      ],
      child: _Scaffold(item),
    );
  }
}

class _Scaffold extends ConsumerWidget {
  const _Scaffold(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultScreen = ref.watch(quizChoiceScreenProvider).isResultScreen;
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

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.item);

  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(item.group),
      leading: CustomBackButton(
        onPressed: () =>
            ref.read(quizChoiceScreenProvider.notifier).tapClearButton(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends ConsumerWidget {
  const _Body(this.item);

  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Column(
          children: [
            ///問題形式タイトル
            QuizStyleTitle(item),
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
                    _Question(item),

                    ///進捗状況
                    _QuizProgress(item),
                  ],
                ),
              ),
            ),
            const Spacer(),

            ///選択肢
            _SelectAnswer(item),

            ///広告
            Container(
              height: context.height * 0.07,
              color: Colors.cyan,
              child: Row(
                children: const [
                  Spacer(),
                  Text(
                    "広告入れたい",
                    style: TextStyle(fontSize: 30),
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
        _JudgeIcon(item),
      ],
    );
  }
}
