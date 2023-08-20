part of 'home_quiz_screen.dart';

///問題一覧
class _QuizStudyCard extends ConsumerWidget {
  const _QuizStudyCard({required this.quiz, required this.index});

  final Quiz quiz;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizModelProvider).quizList[index];
    return GestureDetector(
      onTap: () {
        ref.read(quizModelProvider.notifier).setQuizType(QuizType.study);
        ref.read(quizModelProvider.notifier).tapQuizItemBar(index);
        showDialog(
            context: context, builder: (_) => StudyQuizModal(quiz: quiz));
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.01, vertical: context.height * 0.001),
        child: ListTile(
          contentPadding: EdgeInsets.only(
              left: context.width * 0.02,
              top: 1.0,
              bottom: 1.0,
              right: context.width * 0.02),
          title: Container(
            child: Text(
              quiz.title,
              style: TextStyle(fontSize: context.width * 0.04),
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
            Icons.arrow_forward_ios,
            color: context.mainColor,
          ),
        ),
      ),
    );
  }
}
