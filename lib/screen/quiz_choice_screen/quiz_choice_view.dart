part of 'quiz_choice_screen.dart';

///問題形式表示
class _QuizStyleTitle extends ConsumerWidget {
  const _QuizStyleTitle(this.arguments);

  final QuizChoiceScreenArguments arguments;

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

///問題文
class _Question extends ConsumerWidget {
  const _Question(this.arguments);

  final QuizChoiceScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizChoiceScreenControllerProvider).isAnsView;

    return Container(
      height: context.height * 0.40,
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
            child: isAns ? _AnsQuestion(arguments) : _QuizQuestion(arguments),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _AnsQuestion extends ConsumerWidget {
  const _AnsQuestion(this.arguments);
  final QuizChoiceScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizChoiceScreenControllerProvider).quizIndex;
    final isJudge = ref.watch(quizChoiceScreenControllerProvider).isJudge;
    return SubstringHighlight(
      text: arguments.item.choiceQuiz[quizIndex].question,
      term: arguments.item.choiceQuiz[quizIndex].ans,
      textStyle: TextStyle(
        color: context.colors.dark54,
        fontWeight: FontWeight.w500,
        fontSize: 21,
      ),
      textStyleHighlight: TextStyle(
        fontWeight: FontWeight.bold,
        color: isJudge
            ? Colors.green.withOpacity(0.7)
            : context.colors.main50.withOpacity(0.5),
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _QuizQuestion extends ConsumerWidget {
  const _QuizQuestion(this.arguments);
  final QuizChoiceScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizChoiceScreenControllerProvider).quizIndex;

    return SubstringHighlight(
      text: arguments.item.choiceQuiz[quizIndex].question.replaceAll(
          arguments.item.choiceQuiz[quizIndex].ans,
          I18n().hideText(arguments.item.choiceQuiz[quizIndex].ans)),
      term: arguments.item.choiceQuiz[quizIndex].ans,
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
  final QuizChoiceScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex =
        ref.watch(quizChoiceScreenControllerProvider).quizIndex + 1;

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
            arguments.item.choiceQuiz.length.toString(),
            style: context.texts.bodyText1,
            minFontSize: 16,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _SelectAnswer extends ConsumerWidget {
  const _SelectAnswer(this.arguments);
  final QuizChoiceScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnsView = ref.watch(quizChoiceScreenControllerProvider).isAnsView;
    final quizIndex = ref.watch(quizChoiceScreenControllerProvider).quizIndex;
    final choices = ref.watch(quizChoiceScreenControllerProvider).choices;

    return Container(
      width: context.width * 1.0,
      height: context.height * 0.2,
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: [
              ///選択肢1
              GestureDetector(
                onTap: isAnsView
                    ? null
                    : () => ref
                        .read(quizChoiceScreenControllerProvider.notifier)
                        .tapChoiceButton(choices[0]),
                child: Container(
                  width: context.width * 0.5,
                  height: context.height * 0.1,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black45)),
                  alignment: Alignment.center,
                  child: Text(
                    choices[0],
                    style: isAnsView
                        ? TextStyle(
                            fontWeight: FontWeight.w800,
                            color: (choices[0] ==
                                    arguments.item.choiceQuiz[quizIndex].ans)
                                ? Colors.green.withOpacity(0.7)
                                : context.colors.main50.withOpacity(0.5),
                          )
                        : null,
                  ),
                ),
              ),

              ///選択肢2
              GestureDetector(
                onTap: isAnsView
                    ? null
                    : () => ref
                        .read(quizChoiceScreenControllerProvider.notifier)
                        .tapChoiceButton(choices[1]),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black45)),
                  width: context.width * 0.5,
                  height: context.height * 0.1,
                  alignment: Alignment.center,
                  child: Text(
                    choices[1],
                    style: isAnsView
                        ? TextStyle(
                            fontWeight: FontWeight.w800,
                            color: (choices[1] ==
                                    arguments.item.choiceQuiz[quizIndex].ans)
                                ? Colors.green.withOpacity(0.7)
                                : context.colors.main50.withOpacity(0.5),
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              ///選択肢3
              GestureDetector(
                onTap: isAnsView
                    ? null
                    : () => ref
                        .read(quizChoiceScreenControllerProvider.notifier)
                        .tapChoiceButton(choices[2]),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black45)),
                  width: context.width * 0.5,
                  height: context.height * 0.1,
                  alignment: Alignment.center,
                  child: Text(
                    choices[2],
                    style: isAnsView
                        ? TextStyle(
                            fontWeight: FontWeight.w800,
                            color: (choices[2] ==
                                    arguments.item.choiceQuiz[quizIndex].ans)
                                ? Colors.green.withOpacity(0.7)
                                : context.colors.main50.withOpacity(0.5),
                          )
                        : null,
                  ),
                ),
              ),

              ///選択肢4
              GestureDetector(
                onTap: isAnsView
                    ? null
                    : () => ref
                        .read(quizChoiceScreenControllerProvider.notifier)
                        .tapChoiceButton(choices[3]),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.black45)),
                  width: context.width * 0.5,
                  height: context.height * 0.1,
                  alignment: Alignment.center,
                  child: Text(
                    choices[3],
                    style: isAnsView
                        ? TextStyle(
                            fontWeight: FontWeight.w800,
                            color: (choices[3] ==
                                    arguments.item.choiceQuiz[quizIndex].ans)
                                ? Colors.green.withOpacity(0.7)
                                : context.colors.main50.withOpacity(0.5),
                          )
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _JudgeIcon extends ConsumerWidget {
  const _JudgeIcon(this.arguments);
  final QuizChoiceScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isJudge = ref.watch(quizChoiceScreenControllerProvider).isJudge;
    final isAnsView = ref.watch(quizChoiceScreenControllerProvider).isAnsView;

    return isAnsView
        ? Align(
            alignment: Alignment.center,
            child: Container(
              // height: context.height * 1.0,
              width: context.width * 1.0,

              child: isJudge
                  ? Icon(
                      Icons.circle_outlined,
                      color: Colors.green.withOpacity(0.6),
                      size: context.width * 1.0,
                    )
                  : Icon(Icons.clear,
                      color: context.colors.main50.withOpacity(0.6),
                      size: context.width * 1.0),
            ),
          )
        : const SizedBox.shrink();
  }
}
