import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';

import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../screen/screen_argument.dart';
import '../button/defalut_button.dart';
import '../button/primary_button.dart';
import '../button_icon/clear_button.dart';

///クイズモーダル
class StudyQuizModal extends ConsumerWidget {
  const StudyQuizModal({required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      insetPadding: EdgeInsets.all(context.width * 0.01),
      contentPadding: EdgeInsets.all(context.width * 0.01),
      children: [
        Container(
          width: context.width * 0.8,
          child: Column(
            children: [
              const Gap(5),

              ///タイトル
              Container(
                height: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _Title(quiz),
                    const Spacer(),
                    ClearButton(
                      iconSize: 35,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              ///クイズ挑戦結果
              _QuizResult(quiz),

              const Divider(height: 1),
              const Gap(10),

              ///クイズ形式選択
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.02,
                    vertical: context.width * 0.01),
                child: DefaultButton(
                  width: context.width * 1,
                  height: 50,
                  text: I18n().styleLeanQuiz,
                  onPressed: () {
                    Navigator.of(context).pop();
                    ref
                        .read(quizModelProvider.notifier)
                        .setStudyType(StudyType.learn);
                    context.showScreen(
                      QuizLearnScreenArguments(
                        quiz: quiz,
                      ).generateRoute(),
                    );
                  },
                ),
              ),

              ///4択形式クイズに挑戦する
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.02,
                    vertical: context.width * 0.01),
                child: PrimaryButton(
                  width: context.width * 1,
                  height: 50,
                  text: I18n().styleChoiceQuiz,
                  onPressed: () {
                    ref
                        .read(quizModelProvider.notifier)
                        .setStudyType(StudyType.choice);
                    Navigator.of(context).pop();
                    context.showScreen(
                      QuizChoiceScreenArguments(
                        quiz: quiz,
                      ).generateRoute(),
                    );
                  },
                ),
              ),
              const Gap(5),
            ],
          ),
        ),
      ],
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      alignment: Alignment.centerLeft,
      child: Text(
        quiz.title,
        style: context.texts.titleLarge,
      ),
    );
  }
}

class _QuizResult extends ConsumerWidget {
  const _QuizResult(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.05,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                I18n().lastQuizResult,
                style: context.texts.titleMedium,
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              ///正解数
              Text(
                "${quiz.correctNum}",
                style: context.texts.titleMedium,
              ),

              ///問題数
              Text(
                "/" + quiz.quizItemList.length.toString(),
                style: context.texts.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
