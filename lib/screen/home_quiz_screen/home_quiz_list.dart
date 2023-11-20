part of 'home_quiz_screen.dart';

class _QuizList extends ConsumerWidget {
  const _QuizList({required this.category});

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizModelProvider);
    final quizList =
        state.quizList.where((x) => x.category == category).toList();
    return CustomScrollView(
      controller: ScrollController(),
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final quiz = quizList[index];
              return _QuizCard(quiz: quiz, index: index);
            },
            childCount: quizList.length,
          ),
        ),
      ],
    );
  }
}

///問題一覧
class _QuizCard extends ConsumerWidget {
  const _QuizCard({required this.quiz, required this.index});

  final Quiz quiz;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final correctRate =
        ((quiz.correctNum / quiz.quizItemList.length) * 100).round();
    return GestureDetector(
      onTap: () {
        ref.read(quizModelProvider.notifier).setQuizType(QuizType.study);
        ref.read(quizModelProvider.notifier).tapQuizCard(quiz.id);

        showDialog(
            context: context, builder: (_) => StudyQuizModal(quiz: quiz));
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
        height: context.height * 0.1,
        child: Row(
          children: [
            ///進捗アイコン
            _ProgressIcon(quiz: quiz),
            Gap(context.width * 0.03),

            ///タイトル
            _Title(quiz: quiz, correctRate: correctRate),
            const Spacer(),
            Icon(
              LineIcons.angleRight,
              color: context.mainColor,
            ),
            Gap(context.width * 0.02),
          ],
        ),
      ),
    );
  }
}

///進捗アイコン
class _ProgressIcon extends ConsumerWidget {
  const _ProgressIcon({required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: VerticalDivider(
            color: Colors.grey.shade300,
            thickness: 3,
          ),
        ),
        ProgressCrilcleChart(
          width: context.height * 0.06,
          size: context.height * 0.06,
          goalScore: quiz.quizItemList.length,
          currentScore: quiz.correctNum,
          thickness: 0.1,
          widget: Icon(
            Icons.pets,
            color: quiz.isCompleted ? context.mainColor : Colors.black26,
          ),
        ),
        Expanded(
          child: VerticalDivider(
            color: Colors.grey.shade300,
            thickness: 3,
          ),
        ),
      ],
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title({required this.quiz, required this.correctRate});

  final Quiz quiz;
  final int correctRate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quiz.title,
          style: TextStyle(
            fontSize: context.width * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap(context.height * 0.002),
        Text(
          I18n().quizCorrectRate(correctRate),
          style: TextStyle(
            fontSize: context.width * 0.03,
          ),
        ),
      ],
    );
  }
}
