part of '../quiz_choice_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Gap(context.height * 0.01),

        ///問題画面
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              _QuizItemCard(quiz),
              _JudgeAns(quiz),
            ],
          ),
        ),

        Gap(context.height * 0.01),

        ///選択肢
        _ChoiceList(quiz),

        const AdBanner(),
      ],
    );
  }
}
