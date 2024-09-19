part of '../home_quiz_screen.dart';

///問題一覧
class _QuizCard extends ConsumerWidget {
  const _QuizCard({required this.quiz, required this.index});

  final Quiz quiz;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalScore = quiz.quizItemList.length;
    final currentScore =
        quiz.quizItemList.where((x) => x.status == StatusType.correct).toList().length;
    final correctRate = ((currentScore / goalScore) * 100).round();
    final isPremium = ref.watch(authModelProvider.select((s) => s.isPremium)) || !quiz.isPremium;
    return GestureDetector(
      onTap: () {
        if (isPremium) {
          ref.read(quizModelProvider.notifier).setQuizType(QuizStyleType.study);
          ref.read(quizModelProvider.notifier).setQuizIndex(index);
          ref.read(homeQuizScreenProvider.notifier).setSelectQuiz(quiz);
          showQuizModal(context, quiz);
        } else {
          showPremiumQuizModal(context);
        }
        HapticFeedback.lightImpact();
      },
      child: Container(
        color: isPremium ? Colors.white : Colors.grey.shade200,
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
        height: 90,
        child: Row(
          children: [
            ///進捗アイコン
            _ProgressIcon(quiz: quiz),
            const Gap(10),

            ///タイトル
            _Title(quiz: quiz, correctRate: correctRate),
            const Spacer(),

            ///問題数
            if (isPremium) _QuizLength(quiz: quiz),
            const Gap(8),
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
    final goalScore = quiz.quizItemList.length;
    final currentScore = quiz.correctNum;
    final isCompleted = quiz.isCompleted;

    final isPremium = ref.watch(authModelProvider.select((s) => s.isPremium)) || !quiz.isPremium;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: VerticalDivider(
            color: isCompleted ? context.mainColor : context.secondColor,
            thickness: 3,
          ),
        ),
        ProgressCrilcleChart(
          width: 50,
          size: 50,
          goalScore: goalScore,
          currentScore: currentScore,
          thickness: 0.1,
          widget: Icon(
            isPremium ? Icons.check : LineIcons.lock,
            color: isCompleted ? context.mainColor : Colors.black26,
            size: 25,
          ),
        ),
        Expanded(
          child: VerticalDivider(
            color: isCompleted ? context.mainColor : context.secondColor,
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
    final isPremium = ref.watch(authModelProvider.select((s) => s.isPremium)) || !quiz.isPremium;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quiz.title,
          style: context.texts.titleSmall,
        ),
        const Gap(5),
        Text(
          isPremium ? I18n().quizCorrectRate(correctRate) : '追加購入で解放',
          style: context.texts.bodyMedium,
        ),
      ],
    );
  }
}

class _QuizLength extends ConsumerWidget {
  const _QuizLength({required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: context.secondColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            children: [
              Text(
                '${quiz.quizItemList.length}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('問'),
            ],
          ),
        ),
      ),
    );
  }
}
