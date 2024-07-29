part of '../home_learn_screen.dart';

class _HomeLearnBody extends ConsumerWidget {
  const _HomeLearnBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ///問題
        _QuizItemCard(),

        ///知っている・知らないボタン
        _ActionButtons(),

        Gap(15),

        ///広告
        AdBanner(),

        ///何周目か確認
        // _LapInfoBar(),
      ],
    );
  }
}
