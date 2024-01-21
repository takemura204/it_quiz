import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../controller/home_quiz/home_quiz_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../screen/screen_argument.dart';
import '../button/disabled_button.dart';
import '../button/primary_button.dart';
import '../button_icon/clear_button.dart';

///テストモーダル
class TestQuizModal extends ConsumerWidget {
  const TestQuizModal({required this.testQuiz});

  final Quiz testQuiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGroup =
        ref.watch(homeQuizScreenProvider).selectedTestCategory.isNotEmpty;
    return SimpleDialog(
      insetPadding: EdgeInsets.all(context.width * 0.01),
      contentPadding: EdgeInsets.all(context.width * 0.01),
      children: [
        Container(
          width: context.width * 0.8,
          child: Column(
            children: [
              ///タイトル
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _Title(testQuiz),
                  const Spacer(),
                  ClearButton(
                    iconSize: 35,
                    onPressed: () {},
                  ),
                ],
              ),

              const Divider(height: 1),
              const Gap(5),

              ///選択範囲
              const _QuizRange(),

              const Gap(5),

              ///問題数
              const _SelectLength(),
              const Gap(5),

              const Divider(height: 1),
              const Gap(5),

              ///クイズに挑戦する
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
                child: isGroup
                    ? PrimaryButton(
                        width: context.width * 1,
                        height: 50,
                        text: I18n().challengeQuiz(testQuiz.title),
                        onPressed: () {
                          ref
                              .read(quizModelProvider.notifier)
                              .setStudyType(StudyType.choice);
                          ref
                              .read(homeQuizScreenProvider.notifier)
                              .tapStartTestQuizButton();
                          final testQuiz =
                              ref.read(quizModelProvider).testQuiz!;
                          context.showScreen(
                            QuizChoiceScreenArguments(
                              quiz: testQuiz,
                            ).generateRoute(),
                          );
                        },
                      )
                    : DisabledButton(
                        width: context.width * 1,
                        height: 50,
                        text: I18n().challengeQuiz(testQuiz.title),
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
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      alignment: Alignment.centerLeft,
      child: Text(
        quiz.title,
        style: context.texts.titleLarge,
      ),
    );
  }
}

class _QuizRange extends ConsumerWidget {
  const _QuizRange();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ref.watch(homeQuizScreenProvider).categoryList;
    final selectedTestCategory =
        ref.watch(homeQuizScreenProvider).selectedTestCategory;
    if (categoryList.isEmpty) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.1,
        ),
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '問題範囲を選択してください。',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const Gap(5),
          _SelectRange(
              text: categoryList[0],
              isSelected: selectedTestCategory.contains(categoryList[0])),
          _SelectRange(
              text: categoryList[1],
              isSelected: selectedTestCategory.contains(categoryList[1])),
          _SelectRange(
              text: categoryList[2],
              isSelected: selectedTestCategory.contains(categoryList[2])),
          _SelectRange(
              text: categoryList[3],
              isSelected: selectedTestCategory.contains(categoryList[3])),
        ],
      ),
    );
  }
}

///出題数
class _SelectRange extends ConsumerWidget {
  const _SelectRange({required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(homeQuizScreenProvider.notifier).selectTestCategory(text);
      },
      child: Container(
        width: context.width * 0.8,
        height: 45,
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
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
                fontSize: 16,
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
          const Text(
            '問題数を選択してください。',
            style: TextStyle(fontSize: 14),
          ),
          const Gap(5),
          Container(
            height: 40,
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
