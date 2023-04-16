part of 'quiz_choice_screen.dart';

///問題形式表示
class _QuizStyleTitle extends ConsumerWidget {
  const _QuizStyleTitle(this.item);
  final QuizItemState item;

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
                style: context.texts.titleMedium,
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
  const _Question(this.item);

  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizChoiceScreenProvider).isAnsView;

    return Container(
      height: context.height * 0.45,
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
            child: isAns ? _AnsQuestion(item) : _QuizQuestion(item),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _AnsQuestion extends ConsumerWidget {
  const _AnsQuestion(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizChoiceScreenProvider).quizList;
    final quizIndex = ref.watch(quizChoiceScreenProvider).quizIndex;
    final isJudge = ref.watch(quizChoiceScreenProvider).isJudge;
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
        color: isJudge
            ? Colors.green.withOpacity(0.7)
            : context.colors.main50.withOpacity(0.5),
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _QuizQuestion extends ConsumerWidget {
  const _QuizQuestion(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizChoiceScreenProvider).quizList;
    final quizIndex = ref.watch(quizChoiceScreenProvider).quizIndex;

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
        color: context.colors.main50.withOpacity(0.5),
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _QuizProgress extends ConsumerWidget {
  const _QuizProgress(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizChoiceScreenProvider).quizList;
    final quizIndex = ref.watch(quizChoiceScreenProvider).quizIndex + 1;

    return Container(
      height: context.height * 0.05,
      child: Row(
        children: [
          const Spacer(),
          AutoSizeText(
            quizIndex.toString(),
            style: context.texts.titleMedium,
            minFontSize: 22,
          ),
          const Text("/"),
          AutoSizeText(
            quizList.length.toString(),
            style: context.texts.bodyLarge,
            minFontSize: 18,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _SelectAnswer extends ConsumerWidget {
  const _SelectAnswer(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 1.0,
      height: context.height * 0.2,
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            children: const [
              ///選択肢1
              _SelectChoice(0),

              ///選択肢2
              _SelectChoice(1),
            ],
          ),
          Row(
            children: const [
              ///選択肢3
              _SelectChoice(2),

              ///選択肢4
              _SelectChoice(3),
            ],
          ),
        ],
      ),
    );
  }
}

class _SelectChoice extends ConsumerWidget {
  const _SelectChoice(this.index);
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizChoiceScreenProvider).quizList;
    final isAnsView = ref.watch(quizChoiceScreenProvider).isAnsView;
    final quizIndex = ref.watch(quizChoiceScreenProvider).quizIndex;
    final choices = ref.watch(quizChoiceScreenProvider).choices;

    return GestureDetector(
      onTap: isAnsView
          ? null
          : () => ref
              .read(quizChoiceScreenProvider.notifier)
              .tapChoiceButton(choices[index]),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.black45)),
        width: context.width * 0.5,
        height: context.height * 0.1,
        alignment: Alignment.center,
        child: Text(
          choices[index],
          style: isAnsView
              ? TextStyle(
                  fontWeight: (choices[index] == quizList[quizIndex].ans)
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: context.width * 0.05,
                  color: (choices[index] == quizList[quizIndex].ans)
                      ? Colors.green.withOpacity(0.7)
                      : context.colors.main50.withOpacity(0.5),
                )
              : TextStyle(fontSize: context.width * 0.05),
        ),
      ),
    );
  }
}

class _JudgeIcon extends ConsumerWidget {
  const _JudgeIcon(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isJudge = ref.watch(quizChoiceScreenProvider).isJudge;
    final isAnsView = ref.watch(quizChoiceScreenProvider).isAnsView;

    return isAnsView
        ? Align(
            alignment: Alignment.center,
            child: Container(
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
