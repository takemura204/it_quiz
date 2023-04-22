part of 'home_review_screen.dart';

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          ///今日のクイズ
          _DailyQuiz(),

          ///苦手学習
          _WeakQuiz(),

          ///力試し
          _TestQuiz(),
        ],
      ),
    );
  }
}

///毎日学習するためのボタン
class _DailyQuiz extends ConsumerWidget {
  const _DailyQuiz();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizItemProvider);
    return Column(
      children: [
        // if (quizItemList.isEmpty)
        if (quizItemList.isNotEmpty)
          const _NullQuizButton(
            title: "今日のクイズは完了しました",
          )
        else
          _QuizButton(
            title: "今日のクイズ",
            subTitle: "◯日連続継続中！",
            icon: Icons.abc,
            onTap: () {
              ref.read(quizItemProvider.notifier).setQuizType(QuizType.daily);
              context.showScreen(QuizChoiceScreenArguments(
                item: ref.watch(homeReviewScreenProvider).reviewItem[0],
              ).generateRoute());
            },
          ),
      ],
    );
  }
}

///苦手克服クイズ
class _WeakQuiz extends ConsumerWidget {
  const _WeakQuiz();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weakQuiz = ref.watch(homeReviewScreenProvider).weakQuiz;
    final weakList = weakQuiz.quizList;
    return Column(
      children: [
        if (weakList.isEmpty)
          const _NullQuizButton(
            title: "苦手なクイズはありません!",
          )
        else
          _QuizButton(
              title: "苦手克服",
              subTitle: "あなたの苦手問題数:${weakList.length}問",
              icon: Icons.abc,
              onTap: () {
                ref
                    .read(quizItemProvider.notifier)
                    .setQuizType(QuizType.review);
                context.showScreen(QuizChoiceScreenArguments(
                  item: weakQuiz,
                ).generateRoute());
              }),
      ],
    );
  }
}

///総合テストクイズ
class _TestQuiz extends ConsumerWidget {
  const _TestQuiz();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizItemProvider);
    return Column(
      children: [
        if (quizItemList.isEmpty)
          const _NullQuizButton(
            title: 'まだテストできません',
          )
        else
          _QuizButton(
            title: "力だめし",
            subTitle: "前回の結果:〇〇点",
            icon: Icons.abc,
            onTap: () {
              ref.read(quizItemProvider.notifier).setQuizType(QuizType.test);
              context.showScreen(QuizChoiceScreenArguments(
                item: ref.watch(homeReviewScreenProvider).reviewItem[0],
              ).generateRoute());
            },
          ),
      ],
    );
  }
}
