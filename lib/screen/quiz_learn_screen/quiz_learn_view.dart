part of 'quiz_learn_screen.dart';

///問題形式表示
class _QuizStyleTitle extends ConsumerWidget {
  const _QuizStyleTitle(this.item);

  final QuizItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(0),
      child: Container(
        height: context.height * 0.05,
        color: context.colors.main10,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                item.title,
                style: context.texts.subtitle1,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _Question extends ConsumerWidget {
  const _Question(this.item);

  final QuizItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizLearnScreenControllerProvider).isAnsView;

    return Container(
      height: context.height * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const Spacer(),
          const Gap(20),
          AnimatedSwitcher(
            /// アニメーションがおかしい
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
  final QuizItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizLearnScreenControllerProvider).quizIndex;
    final quizList = ref.watch(quizLearnScreenControllerProvider).quizList;

    return SubstringHighlight(
      text: quizList[quizIndex].question,
      term: quizList[quizIndex].ans,
      textStyle: TextStyle(
        color: context.colors.dark54,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      ),
      textStyleHighlight: TextStyle(
        fontWeight: FontWeight.bold,
        color: context.colors.main50.withOpacity(0.5),
        decoration: TextDecoration.underline,
      ),
    );
  }
}

///穴埋め問題
class _ConfirmQuestion extends ConsumerWidget {
  const _ConfirmQuestion(this.item);
  final QuizItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizLearnScreenControllerProvider).quizIndex;
    final quizList = ref.watch(quizLearnScreenControllerProvider).quizList;
    return SubstringHighlight(
      text: quizList[quizIndex].question.replaceAll(
          quizList[quizIndex].ans, I18n().hideText(quizList[quizIndex].ans)),
      term: quizList[quizIndex].ans,
      textStyle: TextStyle(
        color: context.colors.dark54,
        fontWeight: FontWeight.w500,
        fontSize: 24,
      ),
      textStyleHighlight: TextStyle(
        fontWeight: FontWeight.bold,
        color: context.colors.main50.withOpacity(0.8),
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _QuizProgress extends ConsumerWidget {
  const _QuizProgress(this.item);
  final QuizItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex =
        ref.watch(quizLearnScreenControllerProvider).quizIndex + 1;
    final quizList = ref.watch(quizLearnScreenControllerProvider).quizList;
    return Container(
      height: context.height * 0.05,
      child: Row(
        children: [
          const Spacer(),
          Text(
            quizIndex.toString(),
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            "/" + quizList.length.toString(),
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _ConfirmButton extends ConsumerWidget {
  const _ConfirmButton(this.item);

  final QuizItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizLearnScreenControllerProvider).isAnsView;
    final quizList = ref.watch(quizLearnScreenControllerProvider).quizList;
    return isAns
        ? Row(
            ///知らない
            children: [
              GestureDetector(
                onTap: () => ref
                    .read(quizLearnScreenControllerProvider.notifier)
                    .tapUnKnownButton(),
                child: Container(
                  width: context.width * 0.42,
                  height: context.height * 0.1,
                  color: context.colors.orange100.withOpacity(0.1),
                  alignment: Alignment.center,
                  child: Text(
                    I18n().buttonUnKnow,
                    style: TextStyle(fontSize: 20, color: Colors.red.shade400),
                  ),
                ),
              ),

              ///境界線
              Container(
                height: context.height * 0.1,
                width: context.height * 0.002,
                color: context.colors.dark12,
              ),

              ///知ってる
              GestureDetector(
                onTap: () {
                  ref
                      .read(quizLearnScreenControllerProvider.notifier)
                      .tapKnownButton();
                  //「知っている」が全てになった時結果画面に遷移
                  if (ref
                          .watch(quizLearnScreenControllerProvider)
                          .knowRememberQuestions
                          .length ==
                      quizList.length) {
                    // context.showScreen(QuizLearnResultScreenArguments(
                    //   item: arguments.item,
                    //   quizStyle: I18n().styleLeanQuiz,
                    // ).generateRoute());
                  }
                },
                child: Container(
                  width: context.width * 0.42,
                  height: context.height * 0.1,
                  color: context.colors.orange100.withOpacity(0.1),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    I18n().buttonKnow,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green.shade400),
                    minFontSize: 16,
                  ),
                ),
              ),
            ],
          )

        ///確認する
        : GestureDetector(
            onTap: () => ref
                .read(quizLearnScreenControllerProvider.notifier)
                .tapConfirmButton(),
            child: Container(
              width: context.height * 0.85,
              height: context.height * 0.1,
              color: context.colors.orange100.withOpacity(0.1),
              alignment: Alignment.center,
              child: Text(
                I18n().buttonConfirm,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          );
  }
}

class _LapInfoBar extends ConsumerWidget {
  const _LapInfoBar(this.item);
  final QuizItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lapIndex = ref.watch(quizLearnScreenControllerProvider).lapIndex;

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
                    style: context.texts.subtitle1,
                    minFontSize: 20,
                  ),
                ),
                const Text(
                  "周目",
                ),
              ],
            ),
            Row(
              children: const [
                VerticalDivider(),
              ],
            ),
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
                        .watch(quizLearnScreenControllerProvider)
                        .knowRememberQuestions
                        .length
                        .toString(),
                    style: context.texts.subtitle1
                        ?.copyWith(color: Colors.green.shade400),
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
                const Text("知らない", style: TextStyle(fontSize: 14)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: AutoSizeText(
                    ref
                        .watch(quizLearnScreenControllerProvider)
                        .unKnowRememberQuestions
                        .length
                        .toString(),
                    style: context.texts.subtitle1
                        ?.copyWith(color: Colors.redAccent.shade100),
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
