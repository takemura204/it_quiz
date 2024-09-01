part of '../quiz_result_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.quizItemList, this.duration);

  final List<QuizItem> quizItemList;
  final Duration duration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final knowQuizItemList = ref.watch(homeStudyScreenProvider.select((s) => s.knowQuizItemList));
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ResultClearCard(),
                      ResultDashboardCard(
                        quizItemList: quizItemList,
                        resultQuizItemList: knowQuizItemList,
                        duration: duration,
                      ),
                    ],
                  ),

                  const Gap(20),

                  ///クイズ結果一覧
                  _ResultItemList(quizItemList: quizItemList, knowQuizItemList: knowQuizItemList),
                  const Gap(15),

                  const AdBanner(height: 270),
                  const Gap(200),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NextActionButtons(quizItemList),
            const AdBanner(),
          ],
        ),
      ],
    );
  }
}
