part of '../home_study_screen.dart';

class _QuizItemCard extends ConsumerWidget {
  const _QuizItemCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swiperController = ref.watch(homeStudyScreenProvider.notifier).swiperController;
    final direction = ref.watch(homeStudyScreenProvider.select((s) => s.direction));
    final quizItemList = ref.watch(homeStudyScreenProvider.select((s) => s.quizItemList));
    final isTutorialDone = ref.watch(homeStudyScreenProvider.select((s) => s.isTutorialDone));
    final isAnsView = ref.watch(homeStudyScreenProvider.select((s) => s.isAnsView));
    final itemIndex = ref.watch(homeStudyScreenProvider.select((s) => s.itemIndex));

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
          // チュートリアルカードが表示されている時
          if (!isTutorialDone) {
            ref.read(homeStudyScreenProvider.notifier).setIsTutorialDone(true);
          }
          // スワイプが完全に終了した時の処理
          if (direction == AppinioSwiperDirection.left) {
            ref.read(homeStudyScreenProvider.notifier).updateHomeLearnQuizItem(false);
          } else if (direction == AppinioSwiperDirection.right) {
            ref.read(homeStudyScreenProvider.notifier).updateHomeLearnQuizItem(true);
          }
          HapticFeedback.mediumImpact();
        },
        onSwiping: (direction) {
          if (!isTutorialDone) {
            ref.read(homeStudyScreenProvider.notifier).setIsTutorialDone(true);
          }
          ref.read(homeStudyScreenProvider.notifier).setDirection(direction);
        },
        onEnd: () {
          print("All cards swiped");
        },
        onSwipeCancelled: () {
          ref.read(homeStudyScreenProvider.notifier).setDirection(null);
          return;
        },
        cardsBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (!isTutorialDone) {
                ref.read(homeStudyScreenProvider.notifier).setIsTutorialDone(true);
              }
              ref.read(homeStudyScreenProvider.notifier).setIsAnsView(true); // 画面切り替え
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
                            _QuizItemCategory(quizItem: quizItemList[index]),
                            const Gap(5),

                            ///重要度
                            _QuizItemImportance(quizItemList[index]),
                            const Gap(5),

                            ///ステータス
                            _QuizItemStatus(quizItem: quizItemList[index]),
                            const Spacer(),

                            ///保存
                            _QuizItemSaveButton(quizItemList, index),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (itemIndex == index && direction != null)
                  _DirectionStatusCard(index: index, itemIndex: itemIndex, direction: direction),
                if (!isTutorialDone) const _QuizItemTutorialCard(),
              ],
            ),
          );
        },
      ),
    );
  }
}

///カテゴリ
class _QuizItemCategory extends ConsumerWidget {
  const _QuizItemCategory({required this.quizItem});

  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizModelProvider.select((s) => s.quizList));
    final categoryName = quizList
        .firstWhere((quiz) => quiz.quizItemList.any((item) => item.quizId == quizItem.quizId))
        .category;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          categoryName,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

///重要度
class _QuizItemImportance extends ConsumerWidget {
  const _QuizItemImportance(this.quizItem);

  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '重要度',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' ${I18n().quizImportanceText(quizItem.importance)}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///ステータス
class _QuizItemStatus extends ConsumerWidget {
  const _QuizItemStatus({required this.quizItem});

  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color iconColor(StatusType statusType) {
      switch (statusType) {
        case StatusType.correct:
          return context.correctColor;
        case StatusType.incorrect:
          return context.incorrectColor;
        case StatusType.learned:
          return context.backgroundColor;
        case StatusType.unlearned:
          return context.secondColor;
        default:
          return context.secondColor;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor(quizItem.status),
                border: Border.all(
                    width: 1,
                    color: iconColor(quizItem.status) == context.backgroundColor
                        ? context.mainColor
                        : iconColor(quizItem.status)),
              ),
            ),
            const Gap(3),
            Text(I18n().quizStatusTypeText(quizItem.status),
                style:
                    context.texts.bodyMedium?.copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
            const Gap(3),
          ],
        ),
      ),
    );
  }
}

///保存ボタン
class _QuizItemSaveButton extends ConsumerWidget {
  const _QuizItemSaveButton(this.quizItemList, this.index);

  final List<QuizItem> quizItemList;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SaveIconButton(
      quizItem: quizItemList[index],
      isShowText: false,
      size: 32,
      onTap: () {
        ref.read(homeStudyScreenProvider.notifier).tapSavedButton(index);
      },
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

/// チュートリアルカード
class _QuizItemTutorialCard extends ConsumerWidget {
  const _QuizItemTutorialCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.85),
      ),
      child: Stack(
        children: [
          // 点線を描画
          Positioned.fill(
            child: CustomPaint(
              painter: DottedLinePainter(isVertical: true),
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: DottedLinePainter(isVertical: false),
            ),
          ),

          // 左上の領域（赤）
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: context.width * 0.48,
              height: context.height * 0.4,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icon/swipe_left.svg',
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    height: 80,
                    width: 80,
                  ),
                  const Text(
                    '左スワイプで\n「知らない」',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          // 右上の領域（青）
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: context.width * 0.48,
              height: context.height * 0.4,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icon/swipe_right.svg',
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    height: 80,
                    width: 80,
                  ),
                  const Text(
                    '右スワイプで\n「知っている」',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // 下の領域（緑）
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: context.width,
              height: context.height * 0.12,
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icon/swipe_tap.svg',
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    height: 70,
                    width: 70,
                  ),
                  const Text(
                    'タップで\n答え表示',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
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
