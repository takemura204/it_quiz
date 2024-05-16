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
          elevation: 0,
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
                studyType: StudyType.learn,
                onTap: () {
                  ref
                      .read(quizLearnScreenProvider.notifier)
                      .tapSavedButton(quizItemList[index]);
                });
          },
        ),
      ],
    );
  }
}

class _NextActionCard extends HookConsumerWidget {
  const _NextActionCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizModelProvider).quizList;
    final quizIndex = ref.watch(quizModelProvider).quizIndex;
    final lastIndex = quizList.length - 1;
    final learnQuiz =
        ref.watch(quizLearnScreenProvider.select((s) => s.learnQuiz));
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
            children: [
              DefaultButton(
                  width: context.width * 0.45,
                  height: 55,
                  text: "再挑戦",
                  onPressed: () {
                    ref
                        .read(quizLearnScreenProvider.notifier)
                        .updateHistoryQuiz();
                    Navigator.of(context).pop();
                    context.showScreen(QuizLearnScreenArguments(
                      quiz: learnQuiz!,
                    ).generateRoute());
                  }),
              const Gap(10),
              PrimaryButton(
                width: context.width * 0.45,
                height: 55,
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
                            quiz: learnQuiz!,
                          ).generateRoute(),
                        );

                        Future.delayed(const Duration(milliseconds: 600), () {
                          ref
                              .read(quizModelProvider.notifier)
                              .setStudyType(StudyType.choice);
                        });
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
