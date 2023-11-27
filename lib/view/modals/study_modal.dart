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
              Gap(context.height * 0.005),

              ///タイトル
              Container(
                height: context.height * 0.05,
                child: Row(
                  children: [
                    _Title(quiz),
                    const Spacer(),
                    ClearButton(
                      iconSize: context.height * 0.04,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              ///クイズ挑戦結果
              _QuizResult(quiz),

              const Divider(height: 1),

              ///クイズ形式選択
              Container(
                height: context.height * 0.15,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Spacer(),

                    ///一問一答
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.02,
                          vertical: context.width * 0.01),
                      child: DefaultButton(
                        width: context.width * 1,
                        height: context.height * 0.06,
                        text: I18n().styleLeanQuiz,
                        onPressed: () {
                          context.showScreen(
                            QuizLearnScreenArguments(
                              quiz: quiz,
                            ).generateRoute(),
                          );
                          ref
                              .read(quizModelProvider.notifier)
                              .setStudyType(StudyType.learn);
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
                        height: context.height * 0.06,
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
                  ],
                ),
              ),
              Gap(context.height * 0.005),
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
      height: context.height * 0.045,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      alignment: Alignment.centerLeft,
      child: Text(
        quiz.title,
        style: TextStyle(
            fontSize: context.width * 0.05, fontWeight: FontWeight.bold),
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
                style: TextStyle(
                    fontSize: context.width * 0.045,
                    fontWeight: FontWeight.bold),
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
                style: TextStyle(
                  fontSize: context.width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ///問題数
              Text(
                "/" + quiz.quizItemList.length.toString(),
                style: TextStyle(
                  fontSize: context.width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
