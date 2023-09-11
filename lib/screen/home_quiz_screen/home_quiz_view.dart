part of 'home_quiz_screen.dart';

///問題一覧
class _QuizCard extends ConsumerWidget {
  const _QuizCard({required this.quiz, required this.index});

  final Quiz quiz;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(quizModelProvider.notifier).setQuizType(QuizType.study);
        ref.read(quizModelProvider.notifier).tapQuizItemBar(index);
        showDialog(
            context: context, builder: (_) => StudyQuizModal(quiz: quiz));
      },
      child: Card(
        elevation: 2,
        child: ListTile(
          contentPadding: EdgeInsets.only(
              left: context.width * 0.02,
              top: 1.0,
              bottom: 1.0,
              right: context.width * 0.02),
          title: Container(
            child: Text(
              quiz.title,
              style: TextStyle(
                fontSize: context.width * 0.04,
                fontWeight: FontWeight.bold,
                // color: Colors.black87,
              ),
            ),
          ),
          leading: Container(
            width: context.width * 0.08,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  quiz.isCompleted ? "good!" : "",
                  style: TextStyle(
                    fontSize: context.width * 0.025,
                    fontWeight: FontWeight.bold,
                    color:
                        quiz.isCompleted ? context.mainColor : Colors.black26,
                  ),
                ),
                Icon(
                  Icons.pets,
                  color: quiz.isCompleted ? context.mainColor : Colors.black26,
                ),
                const Spacer(),
                Gap(context.height * 0.01),
              ],
            ),
          ),
          trailing: Icon(
            LineIcons.angleRight,
            color: context.mainColor,
          ),
        ),
      ),
    );
  }
}

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
                text: "苦手克服",
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
              icon: LineIcons.editAlt,
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
