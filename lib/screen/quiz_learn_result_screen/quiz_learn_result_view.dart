part of 'quiz_learn_result_screen.dart';

///クイズ一覧
class _QuizResultView extends ConsumerWidget {
  const _QuizResultView(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizLearnScreenProvider).quizList;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: quizList.length,
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
                    Icons.circle_outlined,
                    size: context.width * 0.1,
                    color: Colors.green.withOpacity(0.7),
                  ),
                ),
                Expanded(
                  child: _QuizItemCard(index),
                ),
                CheckBoxIconButton(
                    isCheck: quizList[index].isWeak,
                    size: context.width * 0.1,
                    onPressed: () {
                      ref
                          .read(quizLearnScreenProvider.notifier)
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
    final quizList = ref.watch(quizLearnScreenProvider).quizList;
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.height * 0.02),
      child: SubstringHighlight(
        text: quizList[index].question,
        term: quizList[index].ans,
        textStyle: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          fontSize: context.width * 0.04,
        ),
        overflow: TextOverflow.clip,
        textStyleHighlight: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.green.withOpacity(0.7),
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
                      print({"quizList.length", quizList.length});
                      print({"lastIndex", lastIndex});
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
