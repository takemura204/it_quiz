part of '../quiz_choice_screen.dart';

class _ChoiceResultBody extends ConsumerWidget {
  const _ChoiceResultBody(this.quiz);

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
                  const Gap(5),

                  ///正解した問題リスト
                  const _QuizResultView(),
                ],
              ),
            ),
          ],
        ),
        _NextActionCard(quiz),
      ],
    );
  }
}
