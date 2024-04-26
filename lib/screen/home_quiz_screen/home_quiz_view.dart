part of 'home_quiz_screen.dart';

class _BottomQuizMenu extends ConsumerWidget {
  const _BottomQuizMenu({required this.weakQuiz, required this.randomQuiz});

  final Quiz weakQuiz;
  final Quiz randomQuiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 1,
      color: context.backgroundColor,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: context.width * 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///苦手克服ボタン
            DefaultButton(
                width: context.width * 0.46,
                height: 50,
                text: weakQuiz.title,
                icon: LineIcons.checkSquareAlt,
                onPressed: weakQuiz.quizItemList.isEmpty
                    ? null
                    : () {
                        ref
                            .read(quizModelProvider.notifier)
                            .setQuizType(QuizType.weak);
                        showDialog(
                            context: context,
                            builder: (_) => WeakQuizModal(quiz: weakQuiz));
                      }),
            const Gap(10),

            ///テストボタン
            PrimaryButton(
              width: context.width * 0.46,
              height: 50,
              text: "${randomQuiz.title}",
              icon: LineIcons.edit,
              onPressed: () {
                ref
                    .read(quizModelProvider.notifier)
                    .setQuizType(QuizType.random);
                showDialog(
                  context: context,
                  builder: (_) {
                    return RandomQuizModal(
                      randomQuiz: randomQuiz,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
