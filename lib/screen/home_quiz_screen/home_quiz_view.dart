part of 'home_quiz_screen.dart';

class _BottomQuizMenu extends ConsumerWidget {
  const _BottomQuizMenu({required this.weakQuiz, required this.testQuiz});

  final Quiz weakQuiz;
  final Quiz testQuiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      color: context.backgroundColor,
      child: Container(
        alignment: Alignment.center,
        height: context.height * 0.1,
        width: context.width * 1,
        child: Row(
          children: [
            const Spacer(),

            ///苦手克服ボタン
            DefaultButton(
                width: context.width * 0.45,
                height: context.height * 0.06,
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
                            builder: (_) => StudyQuizModal(quiz: weakQuiz));
                      }),
            Gap(context.width * 0.02),

            ///テストボタン
            PrimaryButton(
              width: context.width * 0.45,
              height: context.height * 0.06,
              text: "${testQuiz.title}",
              icon: LineIcons.dumbbell,
              onPressed: () {
                ref.read(quizModelProvider.notifier).setQuizType(QuizType.test);
                showDialog(
                  context: context,
                  builder: (_) {
                    return TestQuizModal(
                      testQuiz: testQuiz,
                    );
                  },
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
