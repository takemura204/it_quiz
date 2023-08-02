part of 'quiz_choice_result_screen.dart';

class _QuizResultView extends ConsumerWidget {
  const _QuizResultView(this.item);
  final Quiz item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizChoiceScreenProvider).quizList;
    return Column(
      children: quizList.isEmpty
          ? []
          : [
              QuizStyleTitle(item),
              const Gap(10),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: quizList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: context.height * 0.15,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: context.width * 0.01,
                                vertical: context.width * 0.02),
                            child: Icon(
                              quizList[index].isJudge
                                  ? Icons.circle_outlined
                                  : Icons.clear,
                              size: context.width * 0.1,
                              color: quizList[index].isJudge
                                  ? Colors.green.withOpacity(0.7)
                                  : Colors.red.withOpacity(0.7),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            width: context.width * 0.745,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(
                                horizontal: context.width * 0.02,
                                vertical: context.width * 0.02),
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
                                color: quizList[index].isJudge
                                    ? Colors.green.withOpacity(0.7)
                                    : Colors.red.withOpacity(0.7),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => ref
                                .read(quizChoiceScreenProvider.notifier)
                                .tapCheckBox(index),
                            child: Container(
                              alignment: Alignment.center,
                              width: context.width * 0.1,
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      "苦手",
                                      style: TextStyle(
                                        fontSize: context.width * 0.025,
                                        fontWeight: FontWeight.bold,
                                        color: quizList[index].isWeak
                                            ? context.mainColor
                                            : Colors.black26,
                                      ),
                                    ),
                                    Icon(
                                      quizList[index].isWeak
                                          ? Icons.check_box_outlined
                                          : Icons.check_box_outline_blank,
                                      size: context.width * 0.08,
                                      color: quizList[index].isWeak
                                          ? context.mainColor
                                          : Colors.black26,
                                    ),
                                    Gap(context.height * 0.01),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
    );
  }
}
