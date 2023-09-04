import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/button.dart';

import '../../controller/home_quiz/home_quiz_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../screen/screen_argument.dart';
import '../icon_button.dart';

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
          height: context.height * 0.26,
          width: context.width * 0.8,
          child: Column(
            children: [
              ///タイトル
              Row(
                children: [
                  _Title(quiz),
                  const Spacer(),
                  ClearButton(
                    iconSize: context.height * 0.04,
                    onPressed: () {},
                  ),
                ],
              ),

              const Divider(height: 1),

              ///クイズ挑戦結果
              _QuizResult(quiz),

              const Divider(height: 1),

              ///クイズ形式選択
              Container(
                // color: Colors.redAccent,
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
            ],
          ),
        ),
      ],
    );
  }
}

///テストモーダル
class TestQuizModal extends ConsumerWidget {
  const TestQuizModal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testQuiz = ref.watch(quizModelProvider).testQuiz;
    final isGroup = ref.watch(homeQuizScreenProvider).testGroup.isNotEmpty;
    return SimpleDialog(
      insetPadding: EdgeInsets.all(context.width * 0.01),
      contentPadding: EdgeInsets.all(context.width * 0.01),
      children: [
        Container(
          height: context.height * 0.5,
          width: context.width * 0.8,
          child: Column(
            children: [
              ///タイトル
              Row(
                children: [
                  _Title(testQuiz),
                  const Spacer(),
                  ClearButton(
                    iconSize: context.height * 0.04,
                    onPressed: () {},
                  ),
                ],
              ),

              const Divider(height: 1),
              const Spacer(),

              ///選択範囲
              const _QuizRange(),

              const Gap(5),

              ///問題数
              const _SelectLength(),
              const Spacer(),
              const Divider(height: 1),
              const Spacer(),

              ///クイズに挑戦する
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
                child: isGroup
                    ? PrimaryButton(
                        width: context.width * 1,
                        height: context.height * 0.06,
                        text: I18n().styleTestQuiz,
                        onPressed: () {
                          ref
                              .read(homeQuizScreenProvider.notifier)
                              .tapStartTestQuizButton();
                          final testQuiz = ref.read(quizModelProvider).testQuiz;
                          context.showScreen(
                            QuizChoiceScreenArguments(
                              quiz: testQuiz,
                            ).generateRoute(),
                          );
                        },
                      )
                    : DisabledButton(
                        width: context.width * 1,
                        height: context.height * 0.06,
                        text: I18n().styleTestQuiz,
                      ),
              ),
              const Spacer(),
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
                "前回のクイズ挑戦結果",
                style: TextStyle(
                    fontSize: context.width * 0.04,
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
                  fontSize: context.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ///問題数
              Text(
                "/" + quiz.quizItemList.length.toString(),
                style: TextStyle(
                  fontSize: context.width * 0.04,
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

class _QuizRange extends ConsumerWidget {
  const _QuizRange();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref
        .read(quizModelProvider)
        .quizList
        .map((quizItem) => quizItem.category)
        .toSet()
        .toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '問題範囲を選択してください。',
            style: TextStyle(
              fontSize: context.width * 0.03,
            ),
          ),
          const Gap(5),
          _SelectRange(category[0]),
          _SelectRange(category[1]),
          _SelectRange(category[2]),
          _SelectRange(category[3]),
        ],
      ),
    );
  }
}

///出題数
class _SelectRange extends ConsumerWidget {
  const _SelectRange(this.text);

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected =
        ref.watch(homeQuizScreenProvider).testGroup.contains(text);
    return GestureDetector(
      onTap: () {
        ref.read(homeQuizScreenProvider.notifier).selectGroup(text);
      },
      child: Container(
        width: context.width * 0.8,
        height: context.height * 0.05,
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            width: isSelected ? 1 : 0.5,
            color: isSelected ? context.mainColor : Colors.black45,
          ),
          color: isSelected
              ? context.backgroundColor.withOpacity(0.2)
              : Colors.grey.shade400.withOpacity(0.1),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.task_alt : Icons.circle_outlined,
              color: isSelected ? context.mainColor : Colors.grey,
            ),
            const Gap(5),
            Text(
              text,
              style: TextStyle(
                fontSize: context.width * 0.04,
                color: isSelected ? context.mainColor : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
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
    final List<int> testLength = [10, 20, 50];
    final selectedTestLength = ref.watch(
      homeQuizScreenProvider.select((state) => state.selectedTestLength),
    );
    final initialIndex = testLength.indexOf(selectedTestLength);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04, vertical: context.width * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '問題数を選択してください。',
            style: TextStyle(fontSize: context.width * 0.03),
          ),
          const Gap(5),
          Container(
            height: context.height * 0.05,
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
                        .selectTestLength(testLength[index]);
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
                        "${testLength[0]}問",
                        style: TextStyle(fontSize: context.width * 0.04),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("${testLength[1]}問",
                            style: TextStyle(fontSize: context.width * 0.04)),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("${testLength[2]}問",
                            style: TextStyle(fontSize: context.width * 0.04)),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
