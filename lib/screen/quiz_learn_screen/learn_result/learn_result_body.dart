part of '../quiz_learn_screen.dart';

class _LearnResultBody extends ConsumerWidget {
  const _LearnResultBody(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizLearnScreenProvider).quizItemList;
    final controller = ref.watch(quizLearnScreenProvider);
    final duration = controller.duration;
    final isPremium = ref.watch(authModelProvider.select((s) => s.isPremium));
    final learnResultTarget1 =
        ref.read(tutorialControllerProvider.notifier).learnResultTarget1;
    final isShowLearnResultTutorial = ref.read(
        tutorialControllerProvider.select((s) => s.isShowLearnResultTutorial));
    Future<void>.delayed(Duration.zero, () async {
      if (isShowLearnResultTutorial) {
        ref
            .read(tutorialControllerProvider.notifier)
            .setIsShowLearnResultTutorial(false);

        Future.delayed(const Duration(milliseconds: 500), () {
          ref.read(tutorialControllerProvider.notifier).showLearnResultTutorial(
                context: context,
                onClickTarget: (target) {
                  HapticFeedback.lightImpact();
                  if (target.identify == "learnResultTarget1") {
                  } else if (target.identify == "learnResultTarget2") {
                    Future.delayed(const Duration(milliseconds: 1500), () {});
                  }
                },
                onFinish: () {
                  Navigator.pop(context);
                  ref
                      .read(quizLearnScreenProvider.notifier)
                      .updateHistoryQuiz();

                  ref.read(quizLearnScreenProvider.notifier).tapClearButton();
                  ref
                      .read(tutorialControllerProvider.notifier)
                      .setIsTutorialRestart(false);
                },
              );
        });
      }
    });
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ///結果カード
                  Column(
                    children: [
                      Column(
                        key: learnResultTarget1,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ResultClearCard(),
                          ResultDashboardCard(quizItemList, duration),
                        ],
                      ),

                      const Gap(15),

                      ///クイズ結果一覧
                      const _QuizResultView(),
                      const Gap(15),

                      if (!isPremium) const AdBanner(height: 270),
                      const Gap(180),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AdBanner(),
            _NextActionCard(),
          ],
        ),
      ],
    );
  }
}
