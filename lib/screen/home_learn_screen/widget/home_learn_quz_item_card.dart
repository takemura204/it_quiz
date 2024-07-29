part of '../home_learn_screen.dart';

class _QuizItemCard extends ConsumerWidget {
  const _QuizItemCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swiperController =
        ref.watch(homeLearnScreenProvider.notifier).swiperController;
    final direction =
        ref.watch(homeLearnScreenProvider.select((s) => s.direction));
    final quizItemList =
        ref.watch(homeLearnScreenProvider.select((s) => s.quizItemList));
    final isAnsView =
        ref.watch(homeLearnScreenProvider.select((s) => s.isAnsView));
    final itemIndex =
        ref.watch(homeLearnScreenProvider.select((s) => s.itemIndex));

    if (quizItemList.isEmpty) {
      return const _SkeletonCard();
    }

    return Expanded(
      child: AppinioSwiper(
        controller: swiperController,
        cardsCount: quizItemList.length,
        loop: true,
        backgroundCardsCount: (itemIndex + 1 == quizItemList.length) ? 0 : 1,
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.02),
        cardsSpacing: 0,
        maxAngle: 90,
        swipeOptions: const AppinioSwipeOptions.symmetric(
            horizontal: true, vertical: false),
        onSwipe: (index, direction) {
          // スワイプが完全に終了した時の処理
          if (direction == AppinioSwiperDirection.left) {
            ref.read(homeLearnScreenProvider.notifier).tapActionButton(false);
          } else if (direction == AppinioSwiperDirection.right) {
            ref.read(homeLearnScreenProvider.notifier).tapActionButton(true);
          }
          HapticFeedback.mediumImpact();
        },
        onSwiping: (direction) {
          ref.read(homeLearnScreenProvider.notifier).setDirection(direction);
        },
        onEnd: () {
          print("All cards swiped");
        },
        onSwipeCancelled: () {
          ref.read(homeLearnScreenProvider.notifier).setDirection(null);
          return;
        },
        cardsBuilder: (BuildContext context, int index) {
          final quizItem = quizItemList[index];
          return GestureDetector(
            onTap: () {
              ref
                  .read(homeLearnScreenProvider.notifier)
                  .setIsAnsView(true); // 画面切り替え
            },
            child: Stack(
              children: [
                Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: direction != null
                          ? direction != AppinioSwiperDirection.right
                              ? context.incorrectColor
                              : context.correctColor
                          : context.secondColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 5, right: 5),
                            child: SaveIconButton(
                              quizItem: quizItem,
                              isShowText: false,
                              size: 35,
                              onTap: () {
                                ref
                                    .read(homeLearnScreenProvider.notifier)
                                    .tapSavedButton(index);
                              },
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),

                      ///問題文
                      _Question(quizItem, isAnsView && itemIndex == index),
                      const Spacer(),

                      ///問題進捗状況
                      _QuizProgress(quizItemList, index),
                      Gap(context.height * 0.01),
                    ],
                  ),
                ),
                if (direction != null)
                  Container(
                    color: direction != AppinioSwiperDirection.right
                        ? context.incorrectColor.withOpacity(0.2)
                        : context.correctColor.withOpacity(0.2),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: context.height * 0.18,
                            height: context.height * 0.18,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              direction == AppinioSwiperDirection.right
                                  ? Icons.thumb_up
                                  : Icons.question_mark_outlined,
                              color: direction != AppinioSwiperDirection.right
                                  ? context.incorrectColor.withOpacity(0.6)
                                  : context.correctColor.withOpacity(0.6),
                              size: context.height * 0.1,
                            ),
                          ),
                          Gap(context.height * 0.01),
                          Text(
                            direction == AppinioSwiperDirection.right
                                ? '知っている'
                                : '知らない',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: direction != AppinioSwiperDirection.right
                                  ? context.incorrectColor.withOpacity(0.8)
                                  : context.correctColor.withOpacity(0.8),
                              fontFamily: 'Hiragino Kaku Gothic ProN',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

///ローディング中のカード
class _SkeletonCard extends ConsumerWidget {
  const _SkeletonCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.02),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: context.height * 0.7,
            width: context.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
