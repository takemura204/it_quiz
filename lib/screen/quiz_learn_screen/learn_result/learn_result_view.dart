part of '../quiz_learn_screen.dart';

///クイズ一覧
class _QuizResultView extends ConsumerWidget {
  const _QuizResultView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizLearnScreenProvider).quizItemList;
    return Column(
      children: [
        Card(
          elevation: 1,
          color: Colors.white,
          child: Container(
            width: context.width * 1,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.0, // ここで線の太さを設定
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
                vertical: context.width * 0.02),
            child: Text(
              'クイズ一覧',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: context.width * 0.05,
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
              studyType: StudyType.learn,
              onPressed: () =>
                  ref.read(quizLearnScreenProvider.notifier).tapCheckBox(index),
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
    final quizList = ref.watch(quizModelProvider).quizList;
    final selectQuizId = ref.watch(quizModelProvider).selectQuizId;
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
              onPressed: (selectQuizId >= lastIndex)
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
                          .tapQuizCard(selectQuizId + 1);
                    },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
