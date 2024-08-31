part of '../home_study_screen.dart';

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
        _StudyItemCard(),

        ///知っている・知らないボタン
        _ActionButtons(),

        Gap(15),

        ///広告
        AdBanner(),
      ],
    );
  }
}

class _FinishBody extends ConsumerWidget {
  const _FinishBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(homeStudyScreenProvider.select((s) => s.quizItemList));
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(30),
            const Spacer(),
            Container(
              height: context.height * 0.2,
              child: AnimationImage(
                asset: 'assets/animation/done.json',
                isRepeat: false,
              ),
            ),
            const Spacer(),
            const Text(
              'おつかれさまです🎉🎉\n覚えたい用語を学習できました！！',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const Gap(10),
            const Text(
              '条件を変えて、より多くの用語を覚えましょう',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(10),
                Expanded(
                  child: DefaultVerticalButton(
                      width: context.width * 0.45,
                      height: 85,
                      text: "もう一度",
                      icon: LineIcons.alternateRedo,
                      onPressed: () {
                        ref.read(homeStudyScreenProvider.notifier).restartStudyQuiz();
                      }),
                ),
                const Gap(10),
                Expanded(
                  child: PrimaryVerticalButton(
                    width: context.width * 0.45,
                    height: 85,
                    title: "条件を変更",
                    icon: LineIcons.horizontalSliders,
                    onPressed: () {
                      showStudyModal(context);
                    },
                  ),
                ),
                const Gap(10),
              ],
            ),
            const Gap(10),
            TextButton(
              onPressed: () {
                context.showScreen(
                  QuizResultScreenArguments(quizItemList: quizItemList).generateRoute(),
                );
              },
              child: const Text(
                '結果を確認',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black54,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const Spacer(),
            const Gap(60),
          ],
        ),

        ///広告
        const Column(
          children: [
            AnimationImage(
              asset: 'assets/animation/confetti.json',
              isColor: false,
            ),
            Spacer(),
            AdBanner(),
          ],
        ),
      ],
    );
  }
}
