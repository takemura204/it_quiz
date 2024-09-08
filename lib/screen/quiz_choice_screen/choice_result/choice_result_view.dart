part of '../quiz_choice_screen.dart';

class _QuizResultView extends ConsumerWidget {
  const _QuizResultView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizChoiceScreenProvider).quizItemList;
    return Column(
      children: [
        Card(
          elevation: 0,
          color: Colors.white,
          child: Container(
            width: context.width * 1,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.02, vertical: context.width * 0.02),
            child: const Text(
              'クイズ一覧',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: quizItemList.length,
          itemBuilder: (BuildContext context, int index) {
            return ResultItemCard(
              index: index,
              quizItem: quizItemList[index],
              studyType: StudyType.choice,
              onTapCheckButton: () {
                ref.read(quizChoiceScreenProvider.notifier).tapWeakButton(index);
              },
              onTapSaveButton: () {
                ref.read(quizChoiceScreenProvider.notifier).tapSavedButton(index);
              },
            );
          },
        ),
      ],
    );
  }
}

class _NextActionCard extends HookConsumerWidget {
  const _NextActionCard(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final choiceQuiz = ref.watch(quizChoiceScreenProvider.select((s) => s.choiceQuiz));
    final quizList =
        ref.watch(quizModelProvider).quizList.where((x) => x.category == quiz.category).toList();
    final weakQuiz = ref.watch(quizModelProvider).weakQuiz;
    final quizIndex = ref.watch(quizModelProvider).quizIndex;
    final lastIndex = quizList.length - 1;
    final quizType = ref.watch(quizModelProvider).quizType;

    return Card(
      elevation: 0,
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        height: 100,
        width: context.width * 1,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultButton(
                  width: context.width * 0.45,
                  height: 55,
                  text: "再挑戦",
                  onPressed: (quizType == QuizStyleType.weak && weakQuiz!.quizItemList.isEmpty)
                      ? null
                      : () {
                          Navigator.of(context).pop();
                          context.showScreen(QuizChoiceScreenArguments(
                            quiz: choiceQuiz!,
                          ).generateRoute());
                        }),
              const Gap(20),
              if (quizType == QuizStyleType.weak || quizType == QuizStyleType.random) ...[
                PrimaryButton(
                  width: context.width * 0.45,
                  height: 55,
                  title: "完了",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ] else
                PrimaryButton(
                  width: context.width * 0.45,
                  height: 55,
                  title: "次のクイズに挑戦",
                  onPressed: (quizIndex >= lastIndex)
                      ? null
                      : () {
                          Navigator.of(context).pop();
                          ref.read(quizModelProvider.notifier).setStudyType(StudyType.choice);
                          ref.read(homeQuizScreenProvider.notifier).setSelectStudyQuiz();
                          final selectStudyQuiz = ref.read(homeQuizScreenProvider).selectStudyQuiz;
                          if (selectStudyQuiz!.quizItemList.isNotEmpty) {
                            context.showScreen(
                              QuizChoiceScreenArguments(
                                quiz: selectStudyQuiz,
                              ).generateRoute(),
                            );
                          }
                        },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
