part of 'home_review_screen.dart';

class _NullQuizButton extends ConsumerWidget {
  const _NullQuizButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: null,
          child: Container(
            height: context.height * 0.08,
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
    );
  }
}

class _LearnQuizButton extends ConsumerWidget {
  const _LearnQuizButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.showScreen(QuizLearnScreenArguments(
          item: ref.watch(homeReviewScreenControllerProvider).reviewItem[0],
          quizStyle: I18n().reviewLearnQuiz,
        ).generateRoute());
      },
      child: Container(
        height: context.height * 0.08,
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
          "一問一答から復習する",
          style: TextStyle(
            color: context.colors.main50.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
          minFontSize: 16,
        ),
      ),
    );
  }
}

class _ChoiceQuizButton extends ConsumerWidget {
  const _ChoiceQuizButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.showScreen(QuizChoiceScreenArguments(
          item: ref.watch(homeReviewScreenControllerProvider).reviewItem[1],
          quizStyle: I18n().reviewChoiceQuiz,
        ).generateRoute());
      },
      child: Container(
        height: context.height * 0.08,
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
          "選択問題から復習する",
          style: TextStyle(
            color: context.colors.main50.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
          minFontSize: 16,
        ),
      ),
    );
  }
}
