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
              return _QuizCard(
                quiz: quiz,
                index: index,
              );
            },
            childCount: quizList.length,
          ),
        ),
        const SliverToBoxAdapter(
          child: Gap(80),
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
    final goalScore = quiz.quizItemList.length;
    final currentScore = quiz.quizItemList
        .where((x) => x.status == QuizStatusType.correct)
        .toList()
        .length;
    final correctRate = ((currentScore / goalScore) * 100).round();
    final isPremium = ref.watch(authModelProvider.select((s) => s.isPremium)) ||
        !quiz.isPremium;

    final isShowHomeTutorial = ref
        .watch(tutorialControllerProvider.select((s) => s.isShowHomeTutorial));
    Future<void>.delayed(Duration.zero, () async {
      if (isShowHomeTutorial && index == 0) {
        ref
            .read(tutorialControllerProvider.notifier)
            .setIsShowHomeTutorial(false);
        ref.read(tutorialControllerProvider.notifier).showHomeTutorial(
              context: context,
              onClickTarget: (target) {
                HapticFeedback.lightImpact();
                if (target.identify == "homeTarget1") {
                  ref
                      .read(quizModelProvider.notifier)
                      .setQuizType(QuizStyleType.study);
                  ref.read(quizModelProvider.notifier).tapQuizCard(quiz.id);
                  ref.read(quizModelProvider.notifier).tapQuizIndex(index);
                  ref.read(homeQuizScreenProvider.notifier).setSelectQuiz(quiz);
                  showDialog(
                      context: context, builder: (_) => StudyModal(quiz: quiz));
                } else if (target.identify == "homeTarget5") {
                  ref
                      .read(quizModelProvider.notifier)
                      .setStudyType(StudyType.learn);
                  ref
                      .read(homeQuizScreenProvider.notifier)
                      .setSelectStudyQuiz();
                }
              },
              onFinish: () {
                Navigator.of(context).pop();
                final selectStudyQuiz =
                    ref.read(homeQuizScreenProvider).selectStudyQuiz!;
                context.showScreen(
                  QuizLearnScreenArguments(
                    quiz: selectStudyQuiz,
                  ).generateRoute(),
                );
                ref
                    .read(tutorialControllerProvider.notifier)
                    .setIsShowLearnTutorial(true);
              },
            );
      }
    });

    final homeTarget1 =
        ref.read(tutorialControllerProvider.notifier).homeTarget1;
    return GestureDetector(
      key: index == 0 && quiz.categoryId == 1 ? homeTarget1 : null,
      onTap: () {
        if (isPremium) {
          ref.read(quizModelProvider.notifier).setQuizType(QuizStyleType.study);
          ref.read(quizModelProvider.notifier).tapQuizCard(quiz.id);
          ref.read(quizModelProvider.notifier).tapQuizIndex(index);
          ref.read(homeQuizScreenProvider.notifier).setSelectQuiz(quiz);
          showDialog(context: context, builder: (_) => StudyModal(quiz: quiz));
        } else {
          showDialog(
              context: context,
              builder: (_) => NeedPremiumModal(
                    title: '全てのクイズを解放しますか？',
                    imagePath: 'assets/image/premium/premium_content1.png',
                    subWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style: TextStyle(color: Colors.black87),
                              children: [
                                TextSpan(
                                  text: 'プレミアム特典の支払いは一度きり。\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: '購入すると、全ての問題・クイズが解放されます。',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      context.showScreen(
                          const PremiumDetailScreenArguments().generateRoute());
                    },
                  ));
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

            if (isPremium)
              Card(
                elevation: 0,
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // 全ての辺に一様なボーダーを適用
                    border: Border.all(
                      color: context.secondColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
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
              ),
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

    final isPremium = ref.watch(authModelProvider.select((s) => s.isPremium)) ||
        !quiz.isPremium;
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
    final isPremium = ref.watch(authModelProvider.select((s) => s.isPremium)) ||
        !quiz.isPremium;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quiz.title,
          style: context.texts.titleMedium,
        ),
        const Gap(3),
        Text(
          isPremium ? I18n().quizCorrectRate(correctRate) : '追加購入で解放',
          style: context.texts.bodyMedium,
        ),
      ],
    );
  }
}
