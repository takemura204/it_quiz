part of '../quiz_learn_screen.dart';

class _ActionButtons extends ConsumerWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnsView = ref.watch(quizLearnScreenProvider.select((s) => s.isAnsView));
    final direction = ref.watch(quizLearnScreenProvider.select((s) => s.direction));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ///知らない
      CustomCircleButton(
        iconData: Icons.question_mark_outlined,
        iconSize: 35,
        containerSize: !isAnsView ? 80.0 : 80.0,
        containerColor:
            direction == AppinioSwiperDirection.left ? context.incorrectColor : Colors.white,
        iconColor: direction == AppinioSwiperDirection.left ? Colors.white : context.incorrectColor,
        text: I18n().buttonUnKnow,
        onPressed: () {
          ref.read(quizLearnScreenProvider.notifier).setDirection(AppinioSwiperDirection.left);
          ref.read(quizLearnScreenProvider.notifier).swiperController.swipeLeft();
          HapticFeedback.mediumImpact();
        },
      ),
      Gap(context.width * 0.03),

      ///確認する
      CustomCircleButton(
        iconData: Icons.cached_outlined,
        iconSize: 35,
        containerSize: isAnsView ? 80.0 : 80.0,
        containerColor: isAnsView ? context.secondColor : context.mainColor,
        iconColor: Colors.white,
        text: I18n().buttonConfirm,
        onPressed: isAnsView
            ? null
            : () {
                ref.read(quizLearnScreenProvider.notifier).setIsAnsView(true);
                HapticFeedback.mediumImpact();
              },
      ),

      Gap(context.width * 0.03),

      ///知ってる
      CustomCircleButton(
        iconData: Icons.thumb_up,
        iconSize: 35,
        containerSize: !isAnsView ? 80.0 : 80.0,
        containerColor:
            direction == AppinioSwiperDirection.right ? context.correctColor : Colors.white,
        iconColor: direction == AppinioSwiperDirection.right ? Colors.white : context.correctColor,
        text: I18n().buttonKnow,
        onPressed: () {
          ref.read(quizLearnScreenProvider.notifier).setDirection(AppinioSwiperDirection.right);
          ref.read(quizLearnScreenProvider.notifier).swiperController.swipeRight();
          HapticFeedback.mediumImpact();
        },
      ),
    ]);
  }
}
