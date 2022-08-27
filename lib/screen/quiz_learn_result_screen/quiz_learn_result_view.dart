part of 'quiz_learn_result_screen.dart';

///正答率
class _AnsRateView extends ConsumerWidget {
  const _AnsRateView(this.arguments);

  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Card(
          elevation: 1,
          margin: const EdgeInsets.all(0),
          child: Container(
            height: context.height * 0.05,
            color: context.colors.main10,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "正解数",
                    style: context.texts.subtitle1,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Spacer(),
              AutoSizeText(
                ref
                    .watch(quizLearnScreenControllerProvider)
                    .knowRememberQuestions
                    .length
                    .toString(),
                style: context.texts.subtitle1,
                minFontSize: 20,
              ),
              const Text("/"),
              AutoSizeText(
                arguments.item.learnQuiz.length.toString(),
                style: context.texts.bodyText1,
                minFontSize: 16,
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}

///知らない問題リスト
class _UnKnowQuestionsView extends ConsumerWidget {
  const _UnKnowQuestionsView(this.arguments);

  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unKnowRememberQuestions =
        ref.watch(quizLearnScreenControllerProvider).unKnowRememberQuestions;
    return Column(
      children: unKnowRememberQuestions.isEmpty
          ? []
          : [
              Card(
                elevation: 1,
                margin: const EdgeInsets.all(0),
                child: Container(
                  height: context.height * 0.05,
                  color: context.colors.dark12,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "間違えた問題",
                          style: context.texts.subtitle1,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              const Gap(10),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: unKnowRememberQuestions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: context.height * 0.1,
                      child: Card(
                        elevation: 1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 1.0),
                        color: context.colors.background,
                        child: Row(
                          children: [
                            const Gap(5),
                            Container(
                              width: context.width * 0.08,
                              child: Icon(
                                Icons.clear,
                                size: 40,
                                color: Colors.redAccent.shade200,
                              ),
                            ),
                            const Gap(20),
                            Container(
                              width: context.width * 0.65,
                              child: SubstringHighlight(
                                text: ref
                                    .watch(quizLearnScreenControllerProvider)
                                    .knowRememberQuestions[index]
                                    .question,
                                term: arguments.item.learnQuiz[index].ans,
                                textStyle: TextStyle(
                                  color: context.colors.dark54,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.clip,
                                textStyleHighlight: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: context.colors.main50.withOpacity(0.5),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(quizLearnScreenControllerProvider
                                        .notifier)
                                    .switchUnKnowCheckBox(index);
                                //復習リスト追加
                                ref
                                    .read(homeReviewScreenControllerProvider
                                        .notifier)
                                    .addRememberQuestions(
                                        unKnowRememberQuestions[index]);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: context.width * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    unKnowRememberQuestions[index].isWeak
                                        ? Icons.check_box_outlined
                                        : Icons.check_box_outline_blank,
                                    size: 30,
                                    color: unKnowRememberQuestions[index].isWeak
                                        ? context.colors.main50
                                        : context.colors.dark26,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
    );
  }
}

class _KnowQuestionsView extends ConsumerWidget {
  const _KnowQuestionsView(this.arguments);

  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final knowRememberQuestions =
        ref.watch(quizLearnScreenControllerProvider).knowRememberQuestions;
    return Column(
      children: knowRememberQuestions.isEmpty
          ? []
          : [
              Card(
                elevation: 1,
                margin: const EdgeInsets.all(0),
                child: Container(
                  height: context.height * 0.05,
                  color: context.colors.dark12,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "正解した問題",
                          style: context.texts.subtitle1,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              const Gap(10),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: knowRememberQuestions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: context.height * 0.1,
                      child: Card(
                        elevation: 1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 1.0),
                        color: context.colors.background,
                        child: Row(
                          children: [
                            const Gap(5),
                            Container(
                              width: context.width * 0.08,
                              child: Icon(
                                Icons.trip_origin_outlined,
                                size: 40,
                                color: Colors.greenAccent.shade200,
                              ),
                            ),
                            const Gap(20),
                            Container(
                              width: context.width * 0.65,
                              child: SubstringHighlight(
                                text: knowRememberQuestions[index].question,
                                term: arguments.item.learnQuiz[index].ans,
                                textStyle: TextStyle(
                                  color: context.colors.dark54,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.clip,
                                textStyleHighlight: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: context.colors.main50.withOpacity(0.5),
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(quizLearnScreenControllerProvider
                                        .notifier)
                                    .switchKnowCheckBox(index);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: context.width * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    knowRememberQuestions[index].isWeak
                                        ? Icons.check_box_outlined
                                        : Icons.check_box_outline_blank,
                                    size: 30,
                                    color: knowRememberQuestions[index].isWeak
                                        ? context.colors.main50
                                        : context.colors.dark26,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
    );
  }
}
