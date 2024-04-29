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
    return SimpleDialog(
      elevation: 0,
      insetPadding: EdgeInsets.all(context.width * 0.01),
      contentPadding: EdgeInsets.all(context.width * 0.01),
      children: [
        Container(
          color: Colors.white,
          // width: context.width * 0.8,
          child: Column(
            children: [
              const Gap(5),

              ///タイトル
              Container(
                child: Row(
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
              ),

              const Divider(height: 1),

              ///クイズ挑戦結果
              _QuizResult(quiz),

              CustomProgressIndicator(
                width: 200,
                height: 20,
                borderRadius: 8,
                value1: 3,
                value2: 10,
                goalScore: 10,
              ),

              const Divider(height: 1),

              const _SelectLength(),
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04, vertical: context.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '問題数を選択してください。',
            style: TextStyle(fontSize: 14),
          ),
          const Gap(5),
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
                        .selectStudyLength(selectLength[index]);
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
      ),
    );
  }
}
