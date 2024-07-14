part of 'home_quiz_screen.dart';

class _QuizList extends ConsumerWidget {
  const _QuizList({required this.category});

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizModelProvider);
    final quizList =
        state.quizList.where((x) => x.category == category).toList();
    final historyQuizList =
        state.historyQuizList.where((x) => x.category == category).toList();

    return CustomScrollView(
      controller: ScrollController(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
                vertical: context.width * 0.04),
            child: historyQuizList.isNotEmpty
                ? AnimatedShadowButton(
                    width: context.width,
                    height: 65,
                    title: "前回の続きから",
                    subtitle: '${historyQuizList.last.title}',
                    onPressed: () {
                      final lastQuizId = historyQuizList.last.id;
                      final index =
                          quizList.indexWhere((quiz) => quiz.id == lastQuizId);

                      if (index != -1) {
                        final quiz = quizList[index];
                        ref
                            .read(quizModelProvider.notifier)
                            .setQuizType(QuizStyleType.study);
                        ref
                            .read(quizModelProvider.notifier)
                            .tapQuizIndex(index);
                        ref
                            .read(homeQuizScreenProvider.notifier)
                            .setSelectQuiz(quiz);

                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                          builder: (_) => StudyModal(quiz: quiz),
                        );
                      }
                    },
                  )
                : AnimatedShadowButton(
                    width: context.width,
                    height: 65,
                    title: "はじめる",
                    subtitle: '${quizList.first.title}',
                    onPressed: () {
                      final quiz = quizList.first;
                      ref
                          .read(quizModelProvider.notifier)
                          .setQuizType(QuizStyleType.study);
                      ref.read(quizModelProvider.notifier).tapQuizIndex(0);
                      ref
                          .read(homeQuizScreenProvider.notifier)
                          .setSelectQuiz(quiz);

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        builder: (_) => StudyModal(quiz: quiz),
                      );
                    },
                  ),
          ),
        ),
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
                  ref.read(quizModelProvider.notifier).tapQuizIndex(index);
                  ref.read(homeQuizScreenProvider.notifier).setSelectQuiz(quiz);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                    builder: (_) => StudyModal(quiz: quiz),
                  );
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
          ref.read(quizModelProvider.notifier).tapQuizIndex(index);
          ref.read(homeQuizScreenProvider.notifier).setSelectQuiz(quiz);
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            builder: (_) => StudyModal(quiz: quiz),
          );
        } else {
          showDialog(
              context: context,
              builder: (_) => NeedPremiumModal(
                    title: '用語・クイズを解放しますか？',
                    imagePath: 'assets/image/premium/premium_content1.png',
                    subWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(color: Colors.black87),
                              children: [
                                const TextSpan(
                                  text: 'プレミアム特典を購入すると、\n',
                                ),
                                TextSpan(
                                  text: '850',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: context.accentColor,
                                    fontSize: 20,
                                  ),
                                ),
                                const TextSpan(
                                  text: '以上の用語・クイズが',
                                ),
                                TextSpan(
                                  text: '全て',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: context.accentColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const TextSpan(
                                  text: '解放されます。',
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
