part of '../home_quiz_screen.dart';

class _Footer extends ConsumerWidget {
  const _Footer({required this.weakQuiz, required this.randomQuiz});

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
                title: '${weakQuiz.title} ${weakQuiz.quizItemList.length}問',
                icon: LineIcons.checkSquareAlt,
                onPressed: weakQuiz.quizItemList.isEmpty
                    ? null
                    : () {
                        ref.read(quizModelProvider.notifier).setQuizType(QuizStyleType.weak);
                        ref.read(homeQuizScreenProvider.notifier).setSelectQuiz(weakQuiz);
                        showQuizModal(context, weakQuiz);
                      }),
            const Gap(10),

            ///テストボタン
            PrimaryButton(
              width: context.width * 0.46,
              height: 50,
              title: '${randomQuiz.title}',
              icon: LineIcons.random,
              onPressed: () {
                ref.read(quizModelProvider.notifier).setQuizType(QuizStyleType.random);
                ref.read(homeQuizScreenProvider.notifier).setSelectQuiz(randomQuiz);
                showQuizModal(context, randomQuiz);
              },
            ),
          ],
        ),
      ),
    );
  }
}
