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
                      const ResultClearCard(),
                      ResultDashboardCard(quizItemList, duration),
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
