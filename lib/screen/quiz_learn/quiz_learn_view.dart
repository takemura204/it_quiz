part of 'quiz_learn_screen.dart';

///問題形式表示
class _QuizStyleTitle extends ConsumerWidget {
  const _QuizStyleTitle(this.arguments);

  final QuizLearnScreenArguments arguments;

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
                arguments.quizStyle,
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
  const _Question(this.arguments);

  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizLearnScreenControllerProvider).isAnsView;

    return Container(
      height: context.height * 0.35,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const Spacer(),
          AnimatedSwitcher(
            /// アニメーションがおかしい
            duration: const Duration(milliseconds: 0),

            // reverseDuration: const Duration(milliseconds: 100),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(child: child, opacity: animation);
            },
            child:
                isAns ? _ConfirmQuestion(arguments) : _AnsQuestion(arguments),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _ConfirmQuestion extends ConsumerWidget {
  const _ConfirmQuestion(this.arguments);
  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizLearnScreenControllerProvider).quizIndex;

    return SubstringHighlight(
      text: arguments.item.learnQuiz[quizIndex].question,
      term: arguments.item.learnQuiz[quizIndex].ans,
      textStyle: TextStyle(
        color: context.colors.dark54,
        fontWeight: FontWeight.w500,
        fontSize: 21,
      ),
      textStyleHighlight: TextStyle(
        fontWeight: FontWeight.bold,
        color: context.colors.main50.withOpacity(0.5),
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _AnsQuestion extends ConsumerWidget {
  const _AnsQuestion(this.arguments);
  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizLearnScreenControllerProvider).quizIndex;

    return SubstringHighlight(
      text: arguments.item.learnQuiz[quizIndex].question.replaceAll(
          arguments.item.learnQuiz[quizIndex].ans,
          I18n().hideText(arguments.item.learnQuiz[quizIndex].ans)),
      term: arguments.item.learnQuiz[quizIndex].ans,
      textStyle: TextStyle(
        color: context.colors.dark54,
        fontWeight: FontWeight.w500,
        fontSize: 21,
      ),
      textStyleHighlight: TextStyle(
        fontWeight: FontWeight.bold,
        color: context.colors.main50.withOpacity(0.5),
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _QuizProgress extends ConsumerWidget {
  const _QuizProgress(this.arguments);
  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex =
        ref.watch(quizLearnScreenControllerProvider).quizIndex + 1;

    return Container(
      height: context.height * 0.05,
      child: Row(
        children: [
          const Spacer(),
          AutoSizeText(
            quizIndex.toString(),
            style: context.texts.subtitle1,
            minFontSize: 20,
          ),
          const Text("/"),
          AutoSizeText(
            arguments.item.learnQuiz.length.toString(),
            style: context.texts.bodyText1,
            minFontSize: 16,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _ConfirmButton extends ConsumerWidget {
  const _ConfirmButton(this.arguments);

  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizLearnScreenControllerProvider).isAnsView;

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
                  child: AutoSizeText(
                    I18n().buttonUnKnow,
                    style: context.texts.bodyText1
                        ?.copyWith(color: Colors.redAccent.shade100),
                    minFontSize: 18,
                  ),
                ),
              ),

              ///境界線
              Container(
                height: context.height * 0.1,
                width: context.height * 0.002,
                color: context.colors.dark12,
              ),

              ///知っている
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
                      arguments.item.learnQuiz.length) {
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
                    style: context.texts.bodyText1
                        ?.copyWith(color: Colors.green.shade400),
                    minFontSize: 16,
                  ),
                ),
              ),
            ],
          )
        : GestureDetector(
            onTap: () => ref
                .read(quizLearnScreenControllerProvider.notifier)
                .tapConfirmButton(),
            child: Container(
              width: context.height * 0.85,
              height: context.height * 0.1,
              color: context.colors.orange100.withOpacity(0.1),
              alignment: Alignment.center,
              child: AutoSizeText(
                I18n().buttonConfirm,
                style: context.texts.subtitle1,
                minFontSize: 16,
              ),
            ),
          );
  }
}

class _LapInfoBar extends ConsumerWidget {
  const _LapInfoBar(this.arguments);
  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lapIndex = ref.watch(quizLearnScreenControllerProvider).lapIndex;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(0),
      child: Container(
        height: context.height * 0.06,
        alignment: Alignment.center,
        color: Colors.white70,
        child: Row(
          children: [
            const Divider(),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 4, 12),
                    child: AutoSizeText(
                      lapIndex.toString(),
                      style: context.texts.subtitle1,
                      minFontSize: 20,
                    ),
                  ),
                  const Text("周目"),
                ],
              ),
            ),
            Row(
              children: const [
                VerticalDivider(),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Text("知っている"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 4, 12),
                  child: AutoSizeText(
                    ref
                        .watch(quizLearnScreenControllerProvider)
                        .knowRememberQuestions
                        .length
                        .toString(),
                    style: context.texts.bodyText1
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
                const Text("知らない"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
                  child: AutoSizeText(
                    ref
                        .watch(quizLearnScreenControllerProvider)
                        .unKnowRememberQuestions
                        .length
                        .toString(),
                    style: context.texts.bodyText1
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
