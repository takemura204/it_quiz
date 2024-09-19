part of '../quiz_learn_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///プログレスバー
        _QuizItemProgressBar(),
        Gap(10),

        ///何周目か確認
        _ProgressTile(),

        ///問題
        _QuizItemCard(),

        ///知っている・知らないボタン
        _ActionButtons(),

        Gap(15),

        ///広告
        AdBanner(),
      ],
    );
  }
}
