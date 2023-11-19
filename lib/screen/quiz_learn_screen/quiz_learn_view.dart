part of 'quiz_learn_screen.dart';

class _QuizCard extends ConsumerWidget {
  const _QuizCard(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swiperController =
        ref.watch(quizLearnScreenProvider.notifier).swiperController;
    return Expanded(
      child: AppinioSwiper(
          controller: swiperController, // スワイプを制御するコントローラー
          cardsCount: quiz.quizItemList.length, // カードの数
          onSwiping: ref
              .read(quizLearnScreenProvider.notifier)
              .swipeOnCard, // スワイプ中の処理
          cardsBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 2,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: context.width * 0.9,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    _Question(quiz),

                    const Spacer(),

                    ///問題進捗状況
                    _QuizProgress(quiz),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class _Question extends ConsumerWidget {
  const _Question(this.item);

  final Quiz item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizLearnScreenProvider).isAnsView;

    return Container(
      height: context.height * 0.45,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      child: Column(
        children: [
          const Spacer(),
          AnimatedSwitcher(
            // アニメーションがおかしい
            duration: const Duration(milliseconds: 0),
            // reverseDuration: const Duration(milliseconds: 100),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(child: child, opacity: animation);
            },
            child: isAns ? _AnsQuestion(item) : _ConfirmQuestion(item),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

///穴埋め問題(答え)
class _AnsQuestion extends ConsumerWidget {
  const _AnsQuestion(this.item);

  final Quiz item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizLearnScreenProvider).quizIndex;
    final quizItemList = ref.watch(quizLearnScreenProvider).quizItemList;

    return SubstringHighlight(
      text: quizItemList[quizIndex].question,
      term: quizItemList[quizIndex].ans,
      textStyle: TextStyle(
        fontSize: context.width * 0.06,
        color: Colors.black54,
        fontWeight: FontWeight.w500,
      ),
      textStyleHighlight: TextStyle(
        fontSize: context.width * 0.06,
        fontWeight: FontWeight.bold,
        color: Colors.green.withOpacity(0.7),
        decoration: TextDecoration.underline,
      ),
    );
  }
}

///穴埋め問題
class _ConfirmQuestion extends ConsumerWidget {
  const _ConfirmQuestion(this.item);

  final Quiz item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizLearnScreenProvider).quizIndex;
    final quizItemList = ref.watch(quizLearnScreenProvider).quizItemList;
    return SubstringHighlight(
      text: quizItemList[quizIndex].question.replaceAll(
          quizItemList[quizIndex].ans,
          I18n().hideText(quizItemList[quizIndex].ans)),
      term: quizItemList[quizIndex].ans,
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
  const _QuizProgress(this.item);

  final Quiz item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizLearnScreenProvider).quizIndex + 1;
    final quizItemList = ref.watch(quizLearnScreenProvider).quizItemList;
    return Container(
      height: context.height * 0.05,
      child: Row(
        children: [
          const Spacer(),
          Text(
            quizIndex.toString(),
            style: TextStyle(
              fontSize: context.width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "/" + quizItemList.length.toString(),
            style: TextStyle(
              fontSize: context.width * 0.05,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _ActionButtons extends ConsumerWidget {
  const _ActionButtons(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizLearnScreenProvider).isAnsView;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,

      ///知らない
      children: [
        CustomCircleButton(
          iconData: Icons.question_mark_outlined,
          iconSize: context.width * 0.1,
          containerWidth: context.width * 0.25,
          containerHeight: context.width * 0.25,
          backgroundColor: Colors.red.shade400,
          textColor: Colors.white,
          text: '知らない',
          onPressed: () {
            ref.read(quizLearnScreenProvider.notifier).tapIsKnowButton(false);
          },
        ),

        ///確認する
        GestureDetector(
          onTap: () =>
              ref.read(quizLearnScreenProvider.notifier).tapConfirmButton(),
          child: Container(
            width: context.width * 0.35,
            height: context.width * 0.25,
            color: Colors.white,
            alignment: Alignment.center,
            child: Text(
              I18n().buttonConfirm,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),

        ///知ってる
        CustomCircleButton(
          iconData: Icons.thumb_up,
          iconSize: context.width * 0.1,
          containerWidth: context.width * 0.25,
          containerHeight: context.width * 0.25,
          backgroundColor: Colors.green.shade400,
          textColor: Colors.white,
          text: I18n().buttonKnow,
          onPressed: () {
            ref.read(quizLearnScreenProvider.notifier).tapIsKnowButton(true);
          },
        ),
      ],
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
