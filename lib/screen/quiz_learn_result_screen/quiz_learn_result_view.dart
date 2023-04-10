part of 'quiz_learn_result_screen.dart';

///クイズ一覧
class _QuizResultView extends ConsumerWidget {
  const _QuizResultView(this.item);

  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizLearnScreenControllerProvider).quizList;

    return Column(
      children: quizList.isEmpty
          ? []
          : [
              Card(
                elevation: 1,
                margin: const EdgeInsets.all(0),
                child: Container(
                  height: context.height * 0.05,
                  color: context.colors.main10,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          item.title,
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
                itemCount: quizList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: context.height * 0.15,
                      child: Card(
                        elevation: 1,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 1.0),
                        color: context.colors.background,
                        child: Row(
                          children: [
                            const Gap(5),
                            Container(
                              width: context.width * 0.1,
                              child: Icon(
                                Icons.circle_outlined,
                                size: context.width * 0.1,
                                color: Colors.greenAccent.shade200,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              width: context.width * 0.65,
                              child: SubstringHighlight(
                                text: quizList[index].question,
                                term: quizList[index].ans,
                                textStyle: TextStyle(
                                  color: context.colors.dark54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: context.width * 0.04,
                                ),
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
                                  .read(quizLearnScreenControllerProvider
                                      .notifier)
                                  .switchKnowCheckBox(),
                              child: Container(
                                alignment: Alignment.center,
                                width: context.width * 0.1,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    quizList[index].isWeak
                                        ? Icons.check_box_outlined
                                        : Icons.check_box_outline_blank,
                                    size: context.width * 0.08,
                                    color: quizList[index].isWeak
                                        ? context.colors.main50.withOpacity(0.6)
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
