part of '../quiz_choice_screen.dart';

class _ChoiceResultBody extends ConsumerWidget {
  const _ChoiceResultBody(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizChoiceScreenProvider).quizItemList;
    final correctNum = quizItemList.where((x) => x.isJudge).toList().length;
    final controller = ref.watch(quizChoiceScreenProvider);
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
                  if (correctNum == quizItemList.length)
                    const ResultPerfectCard()
                  else if (correctNum >= quizItemList.length * 0.6)
                    const ResultGoodCard()
                  else
                    const ResultTryCard(),

                  ResultDashboardCard(quizItemList, duration),

                  const Gap(15),

                  ///正解した問題リスト
                  const _QuizResultView(),

                  if (!isPremium) const AdBanner(height: 270),
                  const Gap(200),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const AdBanner(),
            _NextActionCard(quiz),
          ],
        ),
      ],
    );
  }
}
