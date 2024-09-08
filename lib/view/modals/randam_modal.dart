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
import '../../untils/enums.dart';
import '../button/defalut_button.dart';
import '../button/primary_button.dart';
import '../button_icon/clear_button.dart';
import '../quiz_length_tab.dart';

///ランダムモーダル
class RandomQuizModal extends ConsumerWidget {
  const RandomQuizModal({required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isGroup = ref.watch(homeQuizScreenProvider).randomCategoryList.isNotEmpty;
    final selectedTestLength = ref.watch(
      homeQuizScreenProvider.select((state) => state.selectedTestLength),
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(10),

          ///タイトル
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _Title(quiz),
              const Spacer(),
              ClearButton(
                iconSize: 35,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),

          const Divider(height: 1),
          const Gap(5),

          ///選択範囲
          const _QuizRange(),

          const Gap(15),

          ///問題数
          QuizLengthMenu(
            selectedLength: selectedTestLength,
            onTap: (length) {
              ref.read(homeQuizScreenProvider.notifier).setRandomQuizLength(length);
            },
          ),

          const Gap(15),

          const Divider(height: 1),
          const Gap(15),

          ///一問一答
          DefaultButton(
            width: context.width * 1,
            height: 55,
            text: I18n().styleLeanQuiz,
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(quizModelProvider.notifier).setStudyType(StudyType.choice);
              ref.read(homeQuizScreenProvider.notifier).tapStartRandomQuizButton();

              final randomQuiz = ref.read(quizModelProvider).randomQuiz!;
              context.showScreen(
                QuizLearnScreenArguments(
                  quiz: randomQuiz,
                ).generateRoute(),
              );
            },
          ),
          const Gap(10),

          ///クイズに挑戦する
          PrimaryButton(
            width: context.width,
            height: 55,
            title: 'クイズに挑戦する',
            onPressed: isGroup
                ? () {
                    ref.read(quizModelProvider.notifier).setStudyType(StudyType.choice);
                    ref.read(homeQuizScreenProvider.notifier).tapStartRandomQuizButton();

                    final randomQuiz = ref.read(quizModelProvider).randomQuiz!;
                    context.showScreen(
                      QuizChoiceScreenArguments(
                        quiz: randomQuiz,
                      ).generateRoute(),
                    );
                  }
                : null,
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
    final selectedRandomCategoryList = ref.watch(homeQuizScreenProvider).randomCategoryList;
    if (categoryList.isEmpty) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.1,
        ),
      );
    }
    return Container(
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
          ...categoryList
              .map((category) => _SelectRange(
                    text: category,
                    isSelected: selectedRandomCategoryList.contains(category),
                  ))
              .toList(),
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
        ref.read(homeQuizScreenProvider.notifier).setRandomCategory(text);
      },
      child: Container(
        width: context.width,
        height: 45,
        padding:
            EdgeInsets.symmetric(horizontal: context.width * 0.02, vertical: context.width * 0.01),
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
