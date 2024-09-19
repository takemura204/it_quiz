part of '../quiz_choice_screen.dart';

class _QuizItemCard extends ConsumerWidget {
  const _QuizItemCard(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: context.secondColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: context.width * 0.97,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Gap(context.height * 0.01),
            const Spacer(),

            ///問題文
            _Question(quiz),

            const Spacer(),

            ///過去問
            _QuizProgress(quiz),
            Gap(context.height * 0.01),
          ],
        ),
      ),
    );
  }
}

///問題文
class _Question extends ConsumerWidget {
  const _Question(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizChoiceScreenProvider).quizIndex;

    return Padding(
      padding: EdgeInsets.all(context.width * 0.02),
      child: Text(
        quiz.quizItemList[quizIndex].question,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _QuizProgress extends ConsumerWidget {
  const _QuizProgress(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizChoiceScreenProvider).quizIndex;
    final source = quiz.quizItemList[quizIndex].source;

    return Row(
      children: [
        Gap(context.width * 0.02),
        Text(
          source != '' ? "出題：$source" : '',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              "${quizIndex + 1}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const Text(
              " / ",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              "${quiz.quizItemList.length}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Gap(context.width * 0.05),
      ],
    );
  }
}
