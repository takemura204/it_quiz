part of 'quiz_choice_result_screen.dart';

class _QuizResultView extends ConsumerWidget {
  const _QuizResultView(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizChoiceScreenProvider).quizItemList;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: quizItemList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
                vertical: context.width * 0.01),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: context.mainColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const Gap(5),
                Container(
                  width: context.width * 0.1,
                  height: context.height * 0.1,
                  padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.01,
                      vertical: context.width * 0.02),
                  child: Icon(
                    quizItemList[index].isJudge
                        ? Icons.circle_outlined
                        : Icons.clear,
                    size: context.width * 0.1,
                    color: quizItemList[index].isJudge
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7),
                  ),
                ),
                Expanded(
                  child: _QuizItemCard(index),
                ),
                CheckBoxIconButton(
                    isCheck: quizItemList[index].isWeak,
                    size: context.width * 0.1,
                    onPressed: () {
                      ref
                          .read(quizChoiceScreenProvider.notifier)
                          .tapCheckBox(index);
                    }),
                const Gap(5),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _QuizItemCard extends HookConsumerWidget {
  const _QuizItemCard(this.index);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizChoiceScreenProvider).quizItemList;
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.height * 0.02),
      child: SubstringHighlight(
        text: quizItemList[index].question,
        term: quizItemList[index].ans,
        textStyle: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          fontSize: context.width * 0.04,
        ),
        overflow: TextOverflow.clip,
        textStyleHighlight: TextStyle(
          fontWeight: FontWeight.bold,
          color: quizItemList[index].isJudge
              ? Colors.green.withOpacity(0.7)
              : Colors.red.withOpacity(0.7),
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class _NextActionCard extends HookConsumerWidget {
  const _NextActionCard(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizModelProvider).quizList;
    final weakQuiz = ref.watch(quizModelProvider).weakQuiz;
    final quizIndex = ref.watch(quizModelProvider).selectQuizIndex;
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
                onPressed:
                    (quizType == QuizType.weak && weakQuiz.quizItemList.isEmpty)
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
                onPressed: (quizIndex >= lastIndex)
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
