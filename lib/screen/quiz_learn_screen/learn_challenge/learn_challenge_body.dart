part of '../quiz_learn_screen.dart';

class _LearnChallengeBody extends ConsumerWidget {
  const _LearnChallengeBody(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ///クイズカード
        const _QuizCard(),

        ///知っている・知らないボタン
        _ActionButtons(quiz),

        const Gap(15),

        ///何周目か確認
        _LapInfoBar(quiz),

        ///広告
        AdBanner(),
      ],
    );
  }
}
