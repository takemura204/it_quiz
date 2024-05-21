part of '../quiz_learn_screen.dart';

class _QuizCard extends ConsumerWidget {
  const _QuizCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swiperController =
        ref.watch(quizLearnScreenProvider.notifier).swiperController;
    final direction = ref.watch(quizLearnScreenProvider).direction;
    final quizItemList = ref.watch(quizLearnScreenProvider).quizItemList;
    final isAns = ref.watch(quizLearnScreenProvider).isAnsView;
    final quizIndex = ref.watch(quizLearnScreenProvider).quizIndex;

    if (quizItemList.isEmpty) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.1,
        ),
      );
    }
    final learnTarget1 =
        ref.read(tutorialControllerProvider.notifier).learnTarget1;

    return Expanded(
      key: learnTarget1,
      child: AppinioSwiper(
        controller: swiperController,
        cardsCount: quizItemList.length,
        loop: true,
        backgroundCardsCount: (quizIndex + 1 == quizItemList.length) ? 0 : 1,
        cardsSpacing: 0,
        maxAngle: 90,
        swipeOptions: const AppinioSwipeOptions.symmetric(
            horizontal: true, vertical: false),
        onSwipe: (index, direction) {
          // スワイプが完全に終了した時の処理
          if (direction == AppinioSwiperDirection.left) {
            ref.read(quizLearnScreenProvider.notifier).tapActionButton(false);
          } else if (direction == AppinioSwiperDirection.right) {
            ref.read(quizLearnScreenProvider.notifier).tapActionButton(true);
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
          final quizItem = quizItemList[index];
          return GestureDetector(
            onTap: () {
              ref
                  .read(quizLearnScreenProvider.notifier)
                  .setIsAnsView(true); // 画面切り替え
            },
            child: Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: direction != null
                      ? direction != AppinioSwiperDirection.right
                          ? Colors.red.withOpacity(0.7)
                          : Colors.green.withOpacity(0.7)
                      : Colors.grey.shade300,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: context.width * 0.9,
                alignment: Alignment.center,
                // quizItemを使ってカードの内容を構築
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Column(
                      children: [
                        const Spacer(),

                        ///問題文
                        _Question(quizItem, isAns && quizIndex == index),
                        const Spacer(),

                        ///問題進捗状況
                        _QuizProgress(quizItemList.length, index + 1),
                        Gap(context.height * 0.01),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5, right: 5),
                      child: SaveIconButton(
                        quizItem: quizItem,
                        isShowText: false,
                        size: 40,
                        onTap: () {
                          ref
                              .read(quizLearnScreenProvider.notifier)
                              .tapSavedButton(quizItem);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ActionButtons extends ConsumerWidget {
  const _ActionButtons(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnsView = ref.watch(quizLearnScreenProvider).isAnsView;
    return isAnsView
        ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ///知らない
            CustomCircleButton(
              iconData: Icons.question_mark_outlined,
              iconSize: 40,
              containerWidth: context.width * 0.45,
              containerHeight: 100,
              backgroundColor: context.incorrectColor,
              textColor: Colors.white,
              text: I18n().buttonUnKnow,
              onPressed: () {
                ref
                    .read(quizLearnScreenProvider.notifier)
                    .swiperController
                    .swipeLeft();
                HapticFeedback.mediumImpact();
              },
            ),
            Gap(context.width * 0.02),

            ///知ってる
            CustomCircleButton(
              iconData: Icons.thumb_up,
              iconSize: 45,
              containerWidth: context.width * 0.45,
              containerHeight: 100,
              backgroundColor: context.correctColor,
              textColor: Colors.white,
              text: I18n().buttonKnow,
              onPressed: () {
                ref
                    .read(quizLearnScreenProvider.notifier)
                    .swiperController
                    .swipeRight();
                HapticFeedback.mediumImpact();
              },
            ),
          ])
        :

        ///確認する
        CustomCircleButton(
            iconData: Icons.cached_outlined,
            iconSize: 50,
            containerWidth: context.width * 0.9,
            containerHeight: 100,
            backgroundColor: context.mainColor,
            textColor: isAnsView ? Colors.grey.shade400 : Colors.white,
            text: I18n().buttonConfirm,
            onPressed: () {
              ref.read(quizLearnScreenProvider.notifier).setIsAnsView(true);
              HapticFeedback.mediumImpact();
            },
          );
  }
}

class _Question extends ConsumerWidget {
  const _Question(this.quizItem, this.isAnsView);

  final QuizItem quizItem;
  final bool isAnsView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedSwitcher(
            // アニメーションがおかしい
            duration: const Duration(milliseconds: 0),
            // reverseDuration: const Duration(milliseconds: 100),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(child: child, opacity: animation);
            },
            child:
                isAnsView ? _AnsQuestion(quizItem) : _ConfirmQuestion(quizItem),
          ),
        ],
      ),
    );
  }
}

///穴埋め問題(答え)
class _AnsQuestion extends ConsumerWidget {
  const _AnsQuestion(this.quizItem);

  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubstringHighlight(
      text: quizItem.comment,
      term: quizItem.ans,
      textStyle: const TextStyle(
        fontSize: 21,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
      textStyleHighlight: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: context.mainColor,
        decoration: TextDecoration.underline,
      ),
    );
  }
}

///穴埋め問題
class _ConfirmQuestion extends ConsumerWidget {
  const _ConfirmQuestion(this.quizItem);

  final QuizItem quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubstringHighlight(
      text: quizItem.comment
          .replaceAll(quizItem.ans, I18n().hideText(quizItem.ans)),
      term: quizItem.ans,
      textStyle: const TextStyle(
        fontSize: 21,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
      textStyleHighlight: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: context.mainColor,
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _QuizProgress extends ConsumerWidget {
  const _QuizProgress(this.quizItemLength, this.index);

  final int quizItemLength;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            "$index",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            " / ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            "$quizItemLength",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class _LapInfoBar extends ConsumerWidget {
  const _LapInfoBar(this.item);

  final Quiz item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lapIndex = ref.watch(quizLearnScreenProvider).lapIndex;

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
                          .watch(quizLearnScreenProvider)
                          .unKnowQuizItemList
                          .length
                          .toString(),
                      style: context.texts.titleMedium
                          ?.copyWith(color: Colors.redAccent.shade100),
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
                          .watch(quizLearnScreenProvider)
                          .knowQuizItemList
                          .length
                          .toString(),
                      style: context.texts.titleMedium
                          ?.copyWith(color: Colors.green.shade400),
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
