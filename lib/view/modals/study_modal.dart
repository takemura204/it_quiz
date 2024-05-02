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
import '../chart/progress_line_chart.dart';

///クイズモーダル
class StudyQuizModal extends ConsumerWidget {
  const StudyQuizModal({required this.quiz});

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
    return SimpleDialog(
      elevation: 0,
      insetPadding: EdgeInsets.all(context.width * 0.01),
      contentPadding: EdgeInsets.all(context.width * 0.02),
      children: [
        Column(
          children: [
            const Gap(5),

            ///タイトル
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: _Title(quiz)),
                ClearButton(
                  iconSize: 35,
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

                  // ///正答率
                  // _QuizResult(quiz),

                  const Gap(15),

                  ///学習状況
                  _SelectRange(
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
                  const _SelectLength(),
                  const Gap(10),
                  const Divider(height: 1),
                  const Gap(10),

                  ///一問一答
                  DefaultButton(
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

class _Title extends ConsumerWidget {
  const _Title(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      quiz.title,
      style: context.texts.titleLarge,
    );
  }
}

class _SelectRange extends ConsumerWidget {
  const _SelectRange({
    required this.goalValue,
    required this.correctValue,
    required this.incorrectValue,
    required this.learnedValue,
    required this.unlearnedValue,
  });

  final int goalValue;
  final int correctValue;
  final int incorrectValue;
  final int learnedValue;
  final int unlearnedValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '問題範囲を選択してください。',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _SelectRangeCard(
              text: "正解",
              value: correctValue,
              iconColor: context.correctColor,
              unit: "問",
              isSelected: true,
              onTap: () {},
            ),
            _SelectRangeCard(
              text: "不正解",
              value: incorrectValue,
              iconColor: context.incorrectColor,
              unit: "問",
              isSelected: true,
              onTap: () {},
            ),
            _SelectRangeCard(
              text: "学習済み",
              value: learnedValue,
              iconColor: context.backgroundColor,
              unit: "問",
              isSelected: false,
              onTap: () {},
            ),
            _SelectRangeCard(
              text: "未学習",
              value: unlearnedValue,
              iconColor: context.secondColor,
              unit: "問",
              isSelected: true,
              onTap: () {},
            ),
          ],
        ),
        const Gap(15),
        QuizStatusProgressChart(
          width: context.width,
          height: 25,
          borderRadius: 8,
          correctValue: correctValue,
          incorrectValue: incorrectValue,
          learnedValue: learnedValue,
          unlearnedValue: unlearnedValue,
          goalScore: goalValue,
        ),
      ],
    );
  }
}

class _SelectRangeCard extends ConsumerWidget {
  const _SelectRangeCard(
      {required this.value,
      required this.text,
      required this.iconColor,
      required this.unit,
      required this.isSelected,
      required this.onTap});

  final int value;
  final String text;
  final Color iconColor;
  final String unit;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = value == 0
        ? context.secondColor.withOpacity(0.5)
        : isSelected
            ? context.backgroundColor.withOpacity(0.3)
            : Colors.white;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.width * 0.2,
        width: context.width * 0.22,
        child: Card(
          elevation: 0,
          color: color,
          shape: RoundedRectangleBorder(
            side: value == 0
                ? BorderSide(
                    color: context.secondColor.withOpacity(0.3),
                    width: 1.5,
                  )
                : isSelected
                    ? BorderSide(
                        color: context.mainColor,
                        width: 1.5,
                      )
                    : BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(5),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconColor,
                  border: Border.all(
                      width: 0.5,
                      color: iconColor == context.backgroundColor
                          ? context.mainColor
                          : iconColor),
                ),
              ),
              const Gap(5),
              Text(
                "$text",
                style: context.texts.titleSmall,
              ),
              const Gap(3),
              Text(
                "$value$unit",
                style: context.texts.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///問題数指定
class _SelectLength extends ConsumerWidget {
  const _SelectLength();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<int> selectLength = [5, 10, 20];

    final selectedStudyLength = ref.watch(
      homeQuizScreenProvider.select((state) => state.selectedStudyLength),
    );

    final initialIndex = selectLength.indexOf(selectedStudyLength);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '問題数を選択してください。',
          style: TextStyle(fontSize: 14),
        ),
        const Gap(10),
        Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: context.mainColor),
          ),
          child: DefaultTabController(
            length: 3,
            initialIndex: initialIndex,
            child: TabBar(
                onTap: (index) {
                  ref
                      .read(homeQuizScreenProvider.notifier)
                      .setStudyLength(selectLength[index]);
                },
                labelColor: Colors.white,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.normal),
                unselectedLabelColor: context.mainColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: context.mainColor),
                tabs: [
                  Tab(
                    child: Text(
                      "${selectLength[0]}問",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "${selectLength[1]}問",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "${selectLength[2]}問",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
