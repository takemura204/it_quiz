part of 'quiz_true_false_result_screen.dart';

///正答率
class _AnsRateView extends ConsumerWidget {
  const _AnsRateView(this.arguments);

  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correctList =
        ref.watch(quizTureFalseScreenControllerProvider).correctList;
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
                    style: context.texts.titleMedium,
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
                correctList.length.toString(),
                style: context.texts.titleMedium,
                minFontSize: 20,
              ),
              const Text("/"),
              AutoSizeText(
                arguments.item.quizList.length.toString(),
                style: context.texts.bodyLarge,
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

  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incorrectList =
        ref.watch(quizTureFalseScreenControllerProvider).incorrectList;
    return Column(
      children: incorrectList.isEmpty
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
                          style: context.texts.titleMedium,
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
                itemCount: incorrectList.length,
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
                                text: incorrectList[index].question,
                                term: arguments.item.quizList[index].ans,
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
                              onTap: () => ref
                                  .read(quizTureFalseScreenControllerProvider
                                      .notifier)
                                  .tapIncorrectCheckBox(index),
                              child: Container(
                                alignment: Alignment.center,
                                width: context.width * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    incorrectList[index].isWeak
                                        ? Icons.check_box_outlined
                                        : Icons.check_box_outline_blank,
                                    size: 30,
                                    color: incorrectList[index].isWeak
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

  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correctList =
        ref.watch(quizTureFalseScreenControllerProvider).correctList;
    return Column(
      children: correctList.isEmpty
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
                          style: context.texts.titleMedium,
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
                itemCount: correctList.length,
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
                                text: correctList[index].question,
                                term: correctList[index].ans,
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
                              onTap: () => ref
                                  .read(quizTureFalseScreenControllerProvider
                                      .notifier)
                                  .tapCorrectCheckBox(index),
                              child: Container(
                                alignment: Alignment.center,
                                width: context.width * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    correctList[index].isWeak
                                        ? Icons.check_box_outlined
                                        : Icons.check_box_outline_blank,
                                    size: 30,
                                    color: correctList[index].isWeak
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
