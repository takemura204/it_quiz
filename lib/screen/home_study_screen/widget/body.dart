part of '../home_study_screen.dart';

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultView = ref.watch(homeStudyScreenProvider.select((s) => s.isResultView));
    return isResultView ? const _ResultBody() : const _ChallengeBody();
  }
}

class _ChallengeBody extends ConsumerWidget {
  const _ChallengeBody();

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

class _ResultBody extends ConsumerWidget {
  const _ResultBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(homeStudyScreenProvider.select((s) => s.quizItemList));
    final knowQuizItemList = ref.watch(homeStudyScreenProvider.select((s) => s.knowQuizItemList));
    Future<void>.delayed(Duration.zero, () async {});
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
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const ResultClearCard(),
                          ResultDashboardCard(
                            quizItemList: quizItemList,
                            resultQuizItemList: knowQuizItemList,
                            duration: const Duration(seconds: 1),
                          ),
                        ],
                      ),

                      const Gap(20),

                      ///クイズ結果一覧
                      _ResultList(quizItemList: quizItemList),
                      const Gap(15),

                      const AdBanner(height: 270),
                      const Gap(180),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AdBanner(),
          ],
        ),
      ],
    );
  }
}
