part of 'quiz_learn_result_screen.dart';

///クイズ一覧
class _QuizResultView extends ConsumerWidget {
  const _QuizResultView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizLearnScreenProvider).quizItemList;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: quizItemList.length,
      itemBuilder: (BuildContext context, int index) {
        return QuizItemCard(
          item: quizItemList[index],
          studyType: StudyType.learn,
          onPressed: () =>
              ref.read(quizLearnScreenProvider.notifier).tapCheckBox(index),
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
    final quizList = ref.watch(quizModelProvider).quizList;
    final quizIndex = ref.watch(quizModelProvider).selectQuizIndex;
    final lastIndex = quizList.length - 1;
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
                onPressed: () {
                  ref
                      .read(quizLearnScreenProvider.notifier)
                      .updateHistoryQuiz();
                  Navigator.of(context).pop();
                  context.showScreen(QuizLearnScreenArguments(
                    quiz: quiz,
                  ).generateRoute());
                }),
            Gap(context.width * 0.02),
            PrimaryButton(
              width: context.width * 0.45,
              height: context.height * 0.06,
              text: "クイズに挑戦",
              onPressed: (quizIndex >= lastIndex)
                  ? null
                  : () {
                      ref
                          .read(quizLearnScreenProvider.notifier)
                          .updateHistoryQuiz();
                      Navigator.of(context).pop();
                      context.showScreen(
                        QuizChoiceScreenArguments(
                          quiz: quiz,
                        ).generateRoute(),
                      );
                      ref
                          .read(quizModelProvider.notifier)
                          .tapQuizItemBar(quizIndex + 1);
                    },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
