part of '../quiz_learn_screen.dart';

class _QuizItemCard extends ConsumerWidget {
  const _QuizItemCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swiperController = ref.watch(quizLearnScreenProvider.notifier).swiperController;
    final direction = ref.watch(quizLearnScreenProvider.select((s) => s.direction));
    final quizItemList = ref.watch(quizLearnScreenProvider.select((s) => s.quizItemList));

    final isAnsView = ref.watch(quizLearnScreenProvider.select((s) => s.isAnsView));
    final itemIndex = ref.watch(quizLearnScreenProvider.select((s) => s.itemIndex));

    if (quizItemList.isEmpty) {
      return const _SkeletonCard();
    }

    return Expanded(
      child: AppinioSwiper(
        controller: swiperController,
        cardsCount: quizItemList.length,
        loop: true,
        backgroundCardsCount: (itemIndex + 1 == quizItemList.length) ? 0 : 1,
        padding:
            EdgeInsets.symmetric(horizontal: context.width * 0.02, vertical: context.width * 0.02),
        cardsSpacing: 0,
        maxAngle: 90,
        swipeOptions: const AppinioSwipeOptions.symmetric(horizontal: true, vertical: false),
        onSwipe: (index, direction) {
          // スワイプが完全に終了した時の処理
          if (direction == AppinioSwiperDirection.left) {
            ref.read(quizLearnScreenProvider.notifier).updateHomeLearnQuizItem(false);
          } else if (direction == AppinioSwiperDirection.right) {
            ref.read(quizLearnScreenProvider.notifier).updateHomeLearnQuizItem(true);
          }
          HapticFeedback.mediumImpact();
        },
        onSwiping: (direction) {
          ref.read(quizLearnScreenProvider.notifier).setDirection(direction);
        },
        onEnd: () {
          print("All cards swiped");
        },
        onSwipeCancelled: () {
          ref.read(quizLearnScreenProvider.notifier).setDirection(null);
          return;
        },
        cardsBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTapDown: (details) {
              ref.read(quizLearnScreenProvider.notifier).setIsAnsView(true);
              HapticFeedback.lightImpact();
            },
            child: Stack(
              children: [
                Card(
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: context.secondColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Gap(20),

                        ///問題文
                        _Question(
                            quizItem: quizItemList[index],
                            isAnsView: isAnsView && itemIndex == index),

                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///カテゴリ
                            CategoryTag(quizItem: quizItemList[index]),
                            const Gap(5),

                            ///重要度
                            ImportanceTag(quizItem: quizItemList[index]),
                            const Gap(5),

                            ///ステータス
                            StatusTag(quizItem: quizItemList[index]),
                            const Spacer(),

                            ///保存
                            SaveIconButton(
                              quizItem: quizItemList[index],
                              isShowText: false,
                              size: 32,
                              onTap: () {
                                ref.read(quizLearnScreenProvider.notifier).tapSavedButton(index);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (itemIndex == index && direction != null)
                  _DirectionStatusCard(index: index, itemIndex: itemIndex, direction: direction),
              ],
            ),
          );
        },
      ),
    );
  }
}

///スワイプ中のカード
class _DirectionStatusCard extends ConsumerWidget {
  const _DirectionStatusCard(
      {required this.index, required this.itemIndex, required this.direction});

  final int index;
  final int itemIndex;
  final AppinioSwiperDirection direction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: itemIndex == index
              ? direction != AppinioSwiperDirection.right
                  ? context.incorrectColor
                  : context.correctColor
              : context.secondColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
        color: direction != AppinioSwiperDirection.right
            ? context.incorrectColor.withOpacity(0.2)
            : context.correctColor.withOpacity(0.2),
      ),
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
              direction == AppinioSwiperDirection.right ? '知っている' : '知らない',
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
        padding:
            EdgeInsets.symmetric(horizontal: context.width * 0.02, vertical: context.width * 0.02),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: context.height * 0.7,
            width: context.width * 0.95,
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
