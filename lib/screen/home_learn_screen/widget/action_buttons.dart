part of '../home_learn_screen.dart';

class _ActionButtons extends ConsumerWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnsView =
        ref.watch(homeLearnScreenProvider.select((s) => s.isAnsView));
    final direction =
        ref.watch(homeLearnScreenProvider.select((s) => s.direction));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ///知らない
      CustomCircleButton(
        iconData: Icons.question_mark_outlined,
        iconSize: 35,
        containerSize: !isAnsView ? 80.0 : 80.0,
        containerColor: direction == AppinioSwiperDirection.left
            ? context.incorrectColor
            : Colors.white,
        iconColor: direction == AppinioSwiperDirection.left
            ? Colors.white
            : context.incorrectColor,
        text: I18n().buttonUnKnow,
        onPressed: () {
          ref
              .read(homeLearnScreenProvider.notifier)
              .setDirection(AppinioSwiperDirection.left);
          ref
              .read(homeLearnScreenProvider.notifier)
              .swiperController
              .swipeLeft();
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
                ref.read(homeLearnScreenProvider.notifier).setIsAnsView(true);
                HapticFeedback.mediumImpact();
              },
      ),

      Gap(context.width * 0.03),

      ///知ってる
      CustomCircleButton(
        iconData: Icons.thumb_up,
        iconSize: 35,
        containerSize: !isAnsView ? 80.0 : 80.0,
        containerColor: direction == AppinioSwiperDirection.right
            ? context.correctColor
            : Colors.white,
        iconColor: direction == AppinioSwiperDirection.right
            ? Colors.white
            : context.correctColor,
        text: I18n().buttonKnow,
        onPressed: () {
          ref
              .read(homeLearnScreenProvider.notifier)
              .setDirection(AppinioSwiperDirection.right);
          ref
              .read(homeLearnScreenProvider.notifier)
              .swiperController
              .swipeRight();
          HapticFeedback.mediumImpact();
        },
      ),
    ]);
  }
}

class _LapInfoBar extends ConsumerWidget {
  const _LapInfoBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lapIndex = ref.watch(homeLearnScreenProvider).lapIndex;

    return Card(
      elevation: 1,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Row(
            children: [
              const Divider(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
                    child: AutoSizeText(
                      lapIndex.toString(),
                      style: context.texts.titleMedium,
                      minFontSize: 20,
                    ),
                  ),
                  const Text(
                    "周目",
                  ),
                ],
              ),
              const Row(
                children: [
                  VerticalDivider(),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const Text("知らない", style: TextStyle(fontSize: 14)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: AutoSizeText(
                      ref
                          .watch(homeLearnScreenProvider)
                          .unKnowQuizItemList
                          .length
                          .toString(),
                      style: context.texts.titleMedium
                          ?.copyWith(color: context.incorrectColor),
                      minFontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const VerticalDivider(),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    "知っている",
                    style: TextStyle(fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: AutoSizeText(
                      ref
                          .watch(homeLearnScreenProvider)
                          .knowQuizItemList
                          .length
                          .toString(),
                      style: context.texts.titleMedium
                          ?.copyWith(color: context.correctColor),
                      minFontSize: 20,
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
