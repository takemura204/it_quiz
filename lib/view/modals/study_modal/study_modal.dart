import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';

import '../../../controller/home_quiz/home_quiz_screen_controller.dart';
import '../../../controller/tutorial/tutorial_controller.dart';
import '../../../model/lang/initial_resource.dart';
import '../../../model/quiz/quiz.dart';
import '../../../screen/screen_argument.dart';
import '../../../untils/enums.dart';
import '../../button/defalut_button.dart';
import '../../button/primary_button.dart';
import '../../button_icon/clear_button.dart';
import '../../chart/progress_line_chart.dart';
import '../../icon/quarter_circle_icon.dart';
import '../../quiz_length_tab_bar.dart';

part 'study_modal_status_cards.dart';
part 'study_modal_title.dart';

///クイズモーダル
class StudyModal extends ConsumerWidget {
  const StudyModal({required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalValue = quiz.quizItemList.length;
    final correctValue = quiz.quizItemList
        .where((x) => x.status == QuizStatusType.correct)
        .toList()
        .length;
    final incorrectValue = quiz.quizItemList
        .where((x) => x.status == QuizStatusType.incorrect)
        .toList()
        .length;
    final learnedValue = quiz.quizItemList
        .where((x) => x.status == QuizStatusType.learned)
        .toList()
        .length;
    final unlearnedValue =
        goalValue - (correctValue + incorrectValue + learnedValue);

    final selectedStudyLength = ref.watch(
      homeQuizScreenProvider.select((state) => state.selectedStudyLength),
    );
    final homeTarget2 =
        ref.read(tutorialControllerProvider.notifier).homeTarget2;
    final homeTarget5 =
        ref.read(tutorialControllerProvider.notifier).homeTarget5;

    ///selectedStatusListがない時ボタンを押したくない。
    return SimpleDialog(
      elevation: 0,
      insetPadding: EdgeInsets.all(context.width * 0.01),
      contentPadding: EdgeInsets.all(context.width * 0.02),
      children: [
        Column(
          key: homeTarget2,
          children: [
            const Gap(5),

            ///タイトル
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _Title(quiz)),
                ClearButton(
                  iconSize: 40,
                  onPressed: () {},
                ),
              ],
            ),
            Container(
              width: context.width * 0.9,
              color: Colors.white,
              child: Column(
                children: [
                  const Gap(5),
                  const Divider(height: 1),

                  const Gap(15),

                  ///学習状況
                  _StatusCards(
                    goalValue: goalValue,
                    correctValue: correctValue,
                    incorrectValue: incorrectValue,
                    learnedValue: learnedValue,
                    unlearnedValue: unlearnedValue,
                  ),
                  const Gap(10),
                  const Divider(height: 1),
                  const Gap(10),

                  ///問題数
                  QuizLengthTabBar(
                    selectedLength: selectedStudyLength,
                    onTap: (length) {
                      ref
                          .read(homeQuizScreenProvider.notifier)
                          .setStudyLength(length);
                    },
                  ),
                  const Gap(10),
                  const Divider(height: 1),
                  const Gap(10),

                  ///一問一答
                  Container(
                    key: homeTarget5,
                    child: DefaultButton(
                      width: context.width * 1,
                      height: 50,
                      text: I18n().styleLeanQuiz,
                      onPressed: () {
                        Navigator.of(context).pop();
                        ref
                            .read(quizModelProvider.notifier)
                            .setStudyType(StudyType.learn);
                        ref
                            .read(homeQuizScreenProvider.notifier)
                            .setSelectStudyQuiz();

                        final selectStudyQuiz =
                            ref.read(homeQuizScreenProvider).selectStudyQuiz!;
                        context.showScreen(
                          QuizLearnScreenArguments(
                            quiz: selectStudyQuiz,
                          ).generateRoute(),
                        );
                      },
                    ),
                  ),

                  const Gap(5),

                  ///4択形式クイズ
                  PrimaryButton(
                    width: context.width * 1,
                    height: 50,
                    text: I18n().styleChoiceQuiz,
                    onPressed: () {
                      Navigator.of(context).pop();
                      ref
                          .read(quizModelProvider.notifier)
                          .setStudyType(StudyType.choice);
                      ref
                          .read(homeQuizScreenProvider.notifier)
                          .setSelectStudyQuiz();

                      final selectStudyQuiz =
                          ref.read(homeQuizScreenProvider).selectStudyQuiz!;

                      context.showScreen(
                        QuizChoiceScreenArguments(
                          quiz: selectStudyQuiz,
                        ).generateRoute(),
                      );
                    },
                  ),
                  const Gap(5),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
