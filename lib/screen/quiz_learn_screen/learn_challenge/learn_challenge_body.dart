part of '../quiz_learn_screen.dart';

class _LearnChallengeBody extends ConsumerWidget {
  const _LearnChallengeBody(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowLearnTutorial = ref
        .watch(tutorialControllerProvider.select((s) => s.isShowLearnTutorial));

    Future<void>.delayed(Duration.zero, () async {
      if (isShowLearnTutorial) {
        ref
            .read(tutorialControllerProvider.notifier)
            .setIsShowLearnTutorial(false);

        Future.delayed(const Duration(milliseconds: 500), () {
          Future<void>.delayed(const Duration(milliseconds: 300), () async {
            ref
                .read(tutorialControllerProvider.notifier)
                .setIsShowTapAnimation(true);
          });

          ref.read(tutorialControllerProvider.notifier).showLearnTutorial(
                context: context,
                onClickTarget: (target) {
                  if (target.identify == "learnTarget1-tap") {
                    ref
                        .read(quizLearnScreenProvider.notifier)
                        .setIsAnsView(true);
                    ref
                        .read(tutorialControllerProvider.notifier)
                        .setIsShowTapAnimation(false);
                    Future<void>.delayed(const Duration(milliseconds: 300),
                        () async {
                      ref
                          .read(tutorialControllerProvider.notifier)
                          .setIsShowSwipeRightAnimation(true);
                    });
                  } else if (target.identify == "learnTarget1-right") {
                    ref
                        .read(tutorialControllerProvider.notifier)
                        .setIsShowSwipeRightAnimation(false);
                    Future<void>.delayed(const Duration(milliseconds: 300),
                        () async {
                      ref
                          .read(tutorialControllerProvider.notifier)
                          .setIsShowSwipeLeftAnimation(true);
                    });
                  } else if (target.identify == "learnTarget1-left") {
                    ref
                        .read(tutorialControllerProvider.notifier)
                        .setIsShowSwipeLeftAnimation(false);
                  } else if (target.identify == "learnTarget2") {
                    // ref
                    //     .read(quizLearnScreenProvider.notifier)
                    //     .tapSavedButton(quiz.quizItemList[quizIndex]);
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
            ///問題
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
      ],
    );
  }
}
