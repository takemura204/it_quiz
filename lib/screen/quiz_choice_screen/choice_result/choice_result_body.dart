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
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Gap(5),

                  if (correctNum == quizItemList.length)
                    const ResultPerfectCard()
                  else if (correctNum >= quizItemList.length * 0.6)
                    const ResultGoodCard()
                  else
                    const ResultTryCard(),

                  ResultDashboardCard(quizItemList, duration),

                  Gap(context.height * 0.01),

                  ///正解した問題リスト
                  const _QuizResultView(),

                  ///広告
                  AdNative(),
                  Gap(context.height * 0.2),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _NextActionCard(quiz),

            ///広告
            AdBanner(),
          ],
        ),
      ],
    );
  }
}
