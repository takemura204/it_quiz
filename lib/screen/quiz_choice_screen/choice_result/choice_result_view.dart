part of '../quiz_choice_screen.dart';

class _QuizResultView extends ConsumerWidget {
  const _QuizResultView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizChoiceScreenProvider).quizItemList;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: quizItemList.length,
      itemBuilder: (BuildContext context, int index) {
        return QuizItemCard(
          quizItem: quizItemList[index],
          studyType: StudyType.choice,
          onPressed: () =>
              ref.read(quizChoiceScreenProvider.notifier).tapCheckBox(index),
        );
      },
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
    final selectQuizId = ref.watch(quizModelProvider).selectQuizId;
    final quizIndex = ref.watch(quizModelProvider).quizIndex;
    final lastIndex = quizList.length - 1;
    final quizType = ref.watch(quizModelProvider).quizType;
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        height: context.height * 0.1,
        width: context.width * 1,
        child: Row(
          children: [
            const Spacer(),
            DefaultButton(
                width: context.width * 0.45,
                height: context.height * 0.06,
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
            Gap(context.width * 0.02),
            if (quizType == QuizType.weak || quizType == QuizType.test) ...[
              PrimaryButton(
                width: context.width * 0.45,
                height: context.height * 0.06,
                text: "完了",
                onPressed: (selectQuizId >= lastIndex)
                    ? null
                    : () {
                        Navigator.of(context).pop();
                      },
              ),
            ] else
              PrimaryButton(
                width: context.width * 0.45,
                height: context.height * 0.06,
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
                      },
              ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
