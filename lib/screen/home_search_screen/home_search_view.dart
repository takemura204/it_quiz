part of 'home_search_screen.dart';

class _QuizResultView extends ConsumerWidget {
  final String searchText;

  const _QuizResultView(this.searchText);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizModelProvider).quizList;
    final quizItemList = quizList.expand((x) => x.quizItemList).toList();
    final filteredQuizzes = quizList
        .where(
          (quiz) => quiz.quizItemList.any(
            (item) => item.question.contains(searchText),
          ),
        )
        .toList();

    return Column(
      children: quizList.isEmpty
          ? []
          : [
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
                            width: context.width * 0.745,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(
                                horizontal: context.width * 0.02,
                                vertical: context.width * 0.02),
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
                          ),
                          GestureDetector(
                            onTap: () {},
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
                                        color: quizItemList[index].isWeak
                                            ? context.mainColor
                                            : Colors.black26,
                                      ),
                                    ),
                                    Icon(
                                      quizItemList[index].isWeak
                                          ? Icons.check_box_outlined
                                          : Icons.check_box_outline_blank,
                                      size: context.width * 0.08,
                                      color: quizItemList[index].isWeak
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
