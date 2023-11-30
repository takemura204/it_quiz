import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';

import '../../controller/home_quiz/home_quiz_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../screen/screen_argument.dart';
import '../button/defalut_button.dart';
import '../button/primary_button.dart';
import '../button_icon/clear_button.dart';

///クイズモーダル
class WeakQuizModal extends ConsumerWidget {
  const WeakQuizModal({required this.quiz});

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
              _QuizWeakResult(quiz),

              const Divider(height: 1),

              const _SelectLength(),

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
                          Navigator.of(context).pop();
                          ref
                              .read(quizModelProvider.notifier)
                              .setStudyType(StudyType.learn);
                          ref
                              .read(homeQuizScreenProvider.notifier)
                              .tapStartWeakQuizButton();

                          final weakQuiz =
                              ref.read(homeQuizScreenProvider).selectWeakQuiz!;

                          context.showScreen(
                            QuizLearnScreenArguments(
                              quiz: weakQuiz,
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
                          ref
                              .read(quizModelProvider.notifier)
                              .setStudyType(StudyType.choice);

                          ref
                              .read(homeQuizScreenProvider.notifier)
                              .tapStartWeakQuizButton();
                          final weakQuiz =
                              ref.read(quizModelProvider).weakQuiz!;
                          context.showScreen(
                            QuizChoiceScreenArguments(
                              quiz: weakQuiz,
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

class _QuizWeakResult extends ConsumerWidget {
  const _QuizWeakResult(this.quiz);

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
                I18n().lastWeakResult,
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

              ///問題数
              Text(
                quiz.quizItemList.length.toString() + "問",
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

///問題数指定
class _SelectLength extends ConsumerWidget {
  const _SelectLength();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<int> selectWeakLength = [10, 20, 50];

    final selectedWeakLength = ref.watch(
      homeQuizScreenProvider.select((state) => state.selectedWeakLength),
    );

    final initialIndex = selectWeakLength.indexOf(selectedWeakLength);
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
                        .selectWeakLength(selectWeakLength[index]);
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
                        "${selectWeakLength[0]}問",
                        style: TextStyle(fontSize: context.width * 0.04),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("${selectWeakLength[1]}問",
                            style: TextStyle(fontSize: context.width * 0.04)),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("${selectWeakLength[2]}問",
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
