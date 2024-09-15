import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';

import '../../controller/home_quiz/home_quiz_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../screen/screen_argument.dart';
import '../../untils/enums.dart';
import '../button/defalut_button.dart';
import '../button/primary_button.dart';
import '../button_icon/clear_button.dart';
import '../quiz_length_tab.dart';

///クイズモーダル
class WeakQuizModal extends ConsumerWidget {
  const WeakQuizModal({required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWeakLength =
        ref.watch(homeQuizScreenProvider.select((state) => state.selectedWeakLength));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(10),

          ///タイトル
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Title(quiz),
              ClearButton(
                iconSize: 35,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          const Gap(5),
          const Divider(height: 1),
          const Gap(10),

          ///クイズ挑戦結果
          _QuizWeakResult(quiz),
          const Gap(10),
          const Divider(height: 1),
          const Gap(15),

          ///問題数
          QuizLengthMenu(
            selectedLength: selectedWeakLength,
            onTap: (length) {
              ref.read(homeQuizScreenProvider.notifier).setWeakLength(length);
            },
          ),
          const Gap(10),
          const Divider(height: 1),
          const Gap(10),

          ///一問一答
          DefaultButton(
            width: context.width * 1,
            height: 55,
            title: I18n().styleLeanQuiz,
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(quizModelProvider.notifier).setStudyType(StudyType.learn);
              ref.read(homeQuizScreenProvider.notifier).setSelectWeakQuiz();

              final weakQuiz = ref.read(homeQuizScreenProvider).selectWeakQuiz!;

              context.showScreen(
                QuizLearnScreenArguments(
                  quiz: weakQuiz,
                ).generateRoute(),
              );
            },
          ),
          const Gap(5),

          ///4択形式クイズに挑戦する
          PrimaryButton(
            width: context.width * 1,
            height: 55,
            title: I18n().styleChoiceQuiz,
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(quizModelProvider.notifier).setStudyType(StudyType.choice);
              ref.read(homeQuizScreenProvider.notifier).setSelectWeakQuiz();

              final weakQuiz = ref.read(homeQuizScreenProvider).selectWeakQuiz!;

              print({'weakQuiz', weakQuiz.quizItemList.length});
              context.showScreen(
                QuizChoiceScreenArguments(
                  quiz: weakQuiz,
                ).generateRoute(),
              );
            },
          ),
          Gap(context.height * 0.03),
        ],
      ),
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        quiz.title,
        style: context.texts.titleLarge,
      ),
    );
  }
}

class _QuizWeakResult extends ConsumerWidget {
  const _QuizWeakResult(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              I18n().lastWeakResult,
              style: context.texts.titleMedium,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              quiz.quizItemList.length.toString() + "問",
              style: context.texts.titleMedium,
            ),
            Gap(context.width * 0.02),
          ],
        ),
      ],
    );
  }
}
