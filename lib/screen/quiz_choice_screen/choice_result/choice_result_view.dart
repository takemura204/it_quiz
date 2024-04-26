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
                horizontal: context.width * 0.02,
                vertical: context.width * 0.02),
            child: const Text(
              'クイズ一覧',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: quizItemList.length,
          itemBuilder: (BuildContext context, int index) {
            return QuizItemCard(
              quizItem: quizItemList[index],
              studyType: StudyType.choice,
              onPressed: () => ref
                  .read(quizChoiceScreenProvider.notifier)
                  .tapCheckBox(index),
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
    final quizList = ref
        .watch(quizModelProvider)
        .quizList
        .where((x) => x.category == quiz.category)
        .toList();
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
                  onPressed: (quizType == QuizType.weak &&
                          weakQuiz!.quizItemList.isEmpty)
                      ? null
                      : () {
                          Navigator.of(context).pop();
                          context.showScreen(QuizChoiceScreenArguments(
                            quiz: quiz,
                          ).generateRoute());
                        }),
              const Gap(20),
              if (quizType == QuizType.weak || quizType == QuizType.random) ...[
                PrimaryButton(
                  width: context.width * 0.45,
                  height: 55,
                  text: "完了",
                  onPressed: (quizIndex >= lastIndex)
                      ? null
                      : () {
                          Navigator.of(context).pop();
                        },
                ),
              ] else
                PrimaryButton(
                  width: context.width * 0.45,
                  height: 55,
                  text: "次のクイズに挑戦",
                  onPressed: (quizIndex >= lastIndex)
                      ? null
                      : () {
                          Navigator.of(context).pop();
                          context.showScreen(
                            QuizChoiceScreenArguments(
                              quiz: quizList[quizIndex + 1],
                            ).generateRoute(),
                          );
                          ref
                              .read(quizModelProvider.notifier)
                              .tapQuizIndex(quizIndex + 1);
                          ref
                              .read(quizModelProvider.notifier)
                              .tapQuizCard(quizList[quizIndex + 1].id);
                          ref
                              .read(quizModelProvider.notifier)
                              .setStudyType(StudyType.choice);
                        },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
