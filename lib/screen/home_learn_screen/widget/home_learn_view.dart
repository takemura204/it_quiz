part of '../home_learn_screen.dart';

class _ActionButtons extends ConsumerWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnsView = ref.watch(homeLearnScreenProvider).isAnsView;
    return isAnsView
        ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ///知らない
            CustomCircleButton(
              iconData: Icons.question_mark_outlined,
              iconSize: 35,
              containerWidth: context.width * 0.47,
              containerHeight: 100,
              backgroundColor: context.incorrectColor,
              textColor: Colors.white,
              text: I18n().buttonUnKnow,
              onPressed: () {
                ref
                    .read(homeLearnScreenProvider.notifier)
                    .swiperController
                    .swipeLeft();
                HapticFeedback.mediumImpact();
              },
            ),
            Gap(context.width * 0.02),

            ///知ってる
            CustomCircleButton(
              iconData: Icons.thumb_up,
              iconSize: 35,
              containerWidth: context.width * 0.47,
              containerHeight: 100,
              backgroundColor: context.correctColor,
              textColor: Colors.white,
              text: I18n().buttonKnow,
              onPressed: () {
                ref
                    .read(homeLearnScreenProvider.notifier)
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
            iconSize: 35,
            containerWidth: context.width * 0.95,
            containerHeight: 100,
            backgroundColor: context.mainColor,
            textColor: isAnsView ? Colors.grey.shade400 : Colors.white,
            text: I18n().buttonConfirm,
            onPressed: () {
              ref.read(homeLearnScreenProvider.notifier).setIsAnsView(true);
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
      term: quizItem.word,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontFamily: 'Hiragino Kaku Gothic ProN',
      ),
      textStyleHighlight: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: context.mainColor,
        decoration: TextDecoration.underline,
        fontFamily: 'Hiragino Kaku Gothic ProN',
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
          .replaceAll(quizItem.word, I18n().hideText(quizItem.word)),
      term: quizItem.word,
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontFamily: 'Hiragino Kaku Gothic ProN',
      ),
      textStyleHighlight: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: context.mainColor,
        decoration: TextDecoration.underline,
        fontFamily: 'Hiragino Kaku Gothic ProN',
      ),
    );
  }
}

class _QuizProgress extends ConsumerWidget {
  const _QuizProgress(this.quizItemList, this.index);

  final List<QuizItem> quizItemList;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Gap(context.width * 0.02),
          const Text(
            '重要度',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            ' ${I18n().quizImportanceText(quizItemList[index].importance)}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                "${index + 1}",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const Text(
                " / ",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "${quizItemList.length}",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Gap(context.width * 0.05),
        ],
      ),
    );
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
