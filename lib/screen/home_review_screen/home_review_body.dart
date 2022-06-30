part of 'home_review_screen.dart';

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(homeReviewScreenControllerProvider).reviewQuestions.isEmpty
        ? Column(
            children: [
              GestureDetector(
                onTap: null,
                child: Container(
                  height: context.height * 0.085,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const AutoSizeText(
                    "現在復習する問題はありません",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    minFontSize: 16,
                  ),
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount:
                ref.watch(homeReviewScreenControllerProvider).reviewItem.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.showScreen(QuizRememberScreenArguments(
                    item: ref
                        .watch(homeReviewScreenControllerProvider)
                        .reviewItem[index],
                    quizStyle: I18n().quizReview,
                  ).generateRoute());
                },
                child: Container(
                  height: context.height * 0.085,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: context.colors.onMain50,
                    border: Border.all(
                      color: context.colors.main50.withOpacity(0.7),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: AutoSizeText(
                    ref
                        .watch(homeReviewScreenControllerProvider)
                        .reviewItem[index]
                        .title,
                    style: TextStyle(
                      color: context.colors.main50.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                    ),
                    minFontSize: 16,
                  ),
                ),
              );
            },
          );
  }
}
