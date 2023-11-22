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
                  const _QuizResultView(),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _NextActionCard(quiz),
            Gap(context.height * 0.05),
          ],
        ),

      ],
    );
  }
}
