part of '../quiz_learn_screen.dart';

class _LearnResultBody extends ConsumerWidget {
  const _LearnResultBody(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Gap(context.height * 0.01),

                  ///結果カード
                  const LearnResultCard(),
                  ResultDashboardCard(quiz),
                  Gap(context.height * 0.01),

                  Gap(context.height * 0.01),

                  ///クイズ結果一覧
                  const _QuizResultView(),

                  ///広告
                  AdNative(),
                  Gap(context.height * 0.15),
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
