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

    return Expanded(
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
              elevation: 2,
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
                child: Column(
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      ///知らない
      children: [
        CustomCircleButton(
          iconData: Icons.question_mark_outlined,
          iconSize: context.width * 0.1,
          containerWidth: context.width * 0.25,
          containerHeight: context.width * 0.25,
          backgroundColor: Colors.red.withOpacity(0.7),
          textColor: Colors.white,
          text: I18n().buttonUnKnow,
          onPressed: () {
            ref
                .read(quizLearnScreenProvider.notifier)
                .swiperController
                .swipeLeft();
          },
        ),

        Gap(context.width * 0.1),

        ///知ってる
        CustomCircleButton(
          iconData: Icons.thumb_up,
          iconSize: context.width * 0.1,
          containerWidth: context.width * 0.25,
          containerHeight: context.width * 0.25,
          backgroundColor: Colors.green.withOpacity(0.7),
          textColor: Colors.white,
          text: I18n().buttonKnow,
          onPressed: () {
            ref
                .read(quizLearnScreenProvider.notifier)
                .swiperController
                .swipeRight();
          },
        ),
      ],
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
      text: quizItem.question,
      term: quizItem.ans,
      textStyle: TextStyle(
        fontSize: context.width * 0.06,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
      textStyleHighlight: TextStyle(
        fontSize: context.width * 0.06,
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
      text: quizItem.question
          .replaceAll(quizItem.ans, I18n().hideText(quizItem.ans)),
      term: quizItem.ans,
      textStyle: TextStyle(
        fontSize: context.width * 0.06,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
      textStyleHighlight: TextStyle(
        fontSize: context.width * 0.06,
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
        children: [
          Text(
            "$index",
            style: TextStyle(
              fontSize: context.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "/$quizItemLength",
            style: TextStyle(
              fontSize: context.width * 0.05,
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
      elevation: 3,
      margin: const EdgeInsets.all(0),
      child: Container(
        height: context.height * 0.05,
        alignment: Alignment.center,
        color: Colors.white70,
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
    );
  }
}
