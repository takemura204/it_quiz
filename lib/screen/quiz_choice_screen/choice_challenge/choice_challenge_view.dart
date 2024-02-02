part of '../quiz_choice_screen.dart';

///問題文
class _Question extends ConsumerWidget {
  const _Question(this.quizItem);

  final Quiz quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizChoiceScreenProvider).isAnsView;

    return Padding(
      padding: EdgeInsets.all(context.width * 0.02),
      child: AnimatedSwitcher(
        // アニメーションがおかしい
        duration: const Duration(milliseconds: 0),
        // reverseDuration: const Duration(milliseconds: 100),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(child: child, opacity: animation);
        },
        child: isAns ? _AnsQuestion(quizItem) : _QuizQuestion(quizItem),
      ),
    );
  }
}

class _AnsQuestion extends ConsumerWidget {
  const _AnsQuestion(this.quizItem);

  final Quiz quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizChoiceScreenProvider).quizItemList;
    final quizIndex = ref.watch(quizChoiceScreenProvider).quizIndex;
    final isJudge = ref.watch(quizChoiceScreenProvider).isJudge;
    return SubstringHighlight(
      text: quizItemList[quizIndex].question,
      term: quizItemList[quizIndex].ans,
      textStyle: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w500,
        fontSize: context.width * 0.06,
      ),
      textStyleHighlight: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: context.width * 0.06,
        color: isJudge
            ? Colors.green.withOpacity(0.7)
            : Colors.red.withOpacity(0.7),
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _QuizQuestion extends ConsumerWidget {
  const _QuizQuestion(this.quizItem);

  final Quiz quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizChoiceScreenProvider).quizItemList;
    final quizIndex = ref.watch(quizChoiceScreenProvider).quizIndex;

    return SubstringHighlight(
      text: quizItemList[quizIndex].question.replaceAll(
          quizItemList[quizIndex].ans,
          I18n().hideText(quizItemList[quizIndex].ans)),
      term: quizItemList[quizIndex].ans,
      textStyle: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w500,
        fontSize: context.width * 0.06,
      ),
      textStyleHighlight: TextStyle(
        fontWeight: FontWeight.bold,
        color: context.mainColor,
        fontSize: context.width * 0.06,
        decoration: TextDecoration.underline,
      ),
    );
  }
}

class _QuizProgress extends ConsumerWidget {
  const _QuizProgress(this.quizItem);

  final Quiz quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizChoiceScreenProvider).quizItemList;
    final quizIndex = ref.watch(quizChoiceScreenProvider).quizIndex + 1;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            "$quizIndex",
            style: TextStyle(
              fontSize: context.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            " / ",
            style: TextStyle(
              fontSize: context.width * 0.04,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            "${quizItemList.length}",
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

class _SelectAnswer extends ConsumerWidget {
  const _SelectAnswer(this.quizItem);

  final Quiz quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 1.0,
      height: context.height * 0.2,
      alignment: Alignment.center,
      child: const Column(
        children: [
          Row(
            children: [
              ///選択肢1
              _SelectChoice(0),

              ///選択肢2
              _SelectChoice(1),
            ],
          ),
          Row(
            children: [
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

///選択肢
class _SelectChoice extends ConsumerWidget {
  const _SelectChoice(this.index);

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizChoiceScreenProvider).quizItemList;
    final isAnsView = ref.watch(quizChoiceScreenProvider).isAnsView;
    final quizIndex = ref.watch(quizChoiceScreenProvider).quizIndex;
    final choices = ref.watch(quizChoiceScreenProvider).choices;
    final selectAns = ref.watch(quizChoiceScreenProvider).selectAns;
    final isTap = selectAns == choices[index];

    return GestureDetector(
      onTap: isAnsView
          ? null
          : () => ref
              .read(quizChoiceScreenProvider.notifier)
              .tapAnsButton(choices[index]),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.secondColor,
            width: 1,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.black45),
            color: isTap ? context.backgroundColor : Colors.white,
          ),
          width: context.width * 0.5,
          height: context.height * 0.1,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
          child: Text(
            choices[index],
            style: isAnsView
                ? TextStyle(
                    fontWeight: (choices[index] == quizItemList[quizIndex].ans)
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontSize: 18,
                    color: (choices[index] == quizItemList[quizIndex].ans)
                        ? Colors.green.withOpacity(0.7)
                        : Colors.red.withOpacity(0.7),
                  )
                : const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class _JudgeIcon extends ConsumerWidget {
  const _JudgeIcon(this.quizItem);

  final Quiz quizItem;

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
                      color: Colors.green.withOpacity(0.7),
                      size: context.width * 1.0,
                    )
                  : Icon(Icons.clear,
                      color: Colors.red.withOpacity(0.7),
                      size: context.width * 1.0),
            ),
          )
        : const SizedBox.shrink();
  }
}
