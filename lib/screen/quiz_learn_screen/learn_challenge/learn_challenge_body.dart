part of '../quiz_learn_screen.dart';

class _LearnChallengeBody extends ConsumerWidget {
  const _LearnChallengeBody(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowLearnTutorial = ref
        .watch(tutorialControllerProvider.select((s) => s.isShowLearnTutorial));
    final isShowTapAnimation = ref
        .watch(tutorialControllerProvider.select((s) => s.isShowTapAnimation));
    final isShowSwipeRightAnimation = ref.watch(
        tutorialControllerProvider.select((s) => s.isShowSwipeRightAnimation));
    final isShowSwipeLeftAnimation = ref.watch(
        tutorialControllerProvider.select((s) => s.isShowSwipeLeftAnimation));

    Future<void>.delayed(Duration.zero, () async {
      if (isShowLearnTutorial) {
        ref
            .read(tutorialControllerProvider.notifier)
            .setIsShowLearnTutorial(false);

        Future.delayed(const Duration(milliseconds: 500), () {
          ref
              .read(tutorialControllerProvider.notifier)
              .setIsShowTapAnimation(true);
          ref.read(tutorialControllerProvider.notifier).showLearnTutorial(
                context: context,
                onClickTarget: (target) {
                  if (target.identify == "learnTarget1-tap") {
                    print("learnTarget1-tap");
                    ref
                        .read(quizLearnScreenProvider.notifier)
                        .setIsAnsView(true);
                    ref
                        .read(tutorialControllerProvider.notifier)
                        .setIsShowTapAnimation(false);
                    ref
                        .read(tutorialControllerProvider.notifier)
                        .setIsShowSwipeRightAnimation(true);
                  } else if (target.identify == "learnTarget1-right") {
                    print("learnTarget1-right");
                    ref
                        .read(tutorialControllerProvider.notifier)
                        .setIsShowSwipeRightAnimation(false);
                    ref
                        .read(tutorialControllerProvider.notifier)
                        .setIsShowSwipeLeftAnimation(true);
                  } else if (target.identify == "learnTarget1-left") {
                    print("learnTarget1-left");
                    ref
                        .read(tutorialControllerProvider.notifier)
                        .setIsShowSwipeLeftAnimation(false);
                  }
                },
                onFinish: () {
                  print('finish');
                },
              );
        });
      }
    });
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _QuizCard(),

            ///知っている・知らないボタン
            _ActionButtons(quiz),

            const Gap(15),

            ///広告
            const AdBanner(),

            ///何周目か確認
            _LapInfoBar(quiz),
          ],
        ),
        if (isShowTapAnimation)
          const AnimationImage(asset: 'assets/animation/tap.json'),
        if (isShowSwipeRightAnimation)
          const AnimationImage(asset: 'assets/animation/swipe_right.json'),
        if (isShowSwipeLeftAnimation)
          const AnimationImage(asset: 'assets/animation/swipe_left.json'),
      ],
    );
  }
}
