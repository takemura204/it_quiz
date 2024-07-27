part of '../quiz_choice_screen.dart';

///問題文
class _Question extends ConsumerWidget {
  const _Question(this.quizItem);

  final Quiz quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(context.width * 0.02),
      child: _QuizQuestion(quizItem),
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

    return Text(
      quizItemList[quizIndex].question,
      style: const TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w500,
        fontSize: 16,
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
    final quizIndex = ref.watch(quizChoiceScreenProvider).quizIndex;
    final source = quizItemList[quizIndex].source;

    return Row(
      children: [
        Gap(context.width * 0.02),
        Text(
          source != '' ? "出題：$source" : '',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              "${quizIndex + 1}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
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
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Gap(context.width * 0.05),
      ],
    );
  }
}

class _SelectAnswer extends ConsumerWidget {
  const _SelectAnswer(this.quizItem);

  final Quiz quizItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(authModelProvider.select((s) => s.isPremium));
    return Container(
      height: context.height * 0.45,
      width: context.width,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: context.mainColor.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // これで上からの配置
          crossAxisAlignment: CrossAxisAlignment.start, // これも上からの配置
          children: [
            Gap(context.width * 0.05),
            const _SelectChoice(0),
            const _SelectChoice(1),
            const _SelectChoice(2),
            const _SelectChoice(3),
            if (isPremium) const _SkipChoice(),
            Gap(context.width * 0.05),
          ],
        ),
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
        elevation: isTap ? 0 : 2,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: isAnsView && (choices[index] == quizItemList[quizIndex].ans)
                ? 1.5
                : 1,
            color: isAnsView
                ? (choices[index] == quizItemList[quizIndex].ans)
                    ? context.correctColor
                    : context.secondColor
                : context.secondColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(
            vertical: context.width * 0.01, horizontal: context.width * 0.02),
        child: Container(
          decoration: BoxDecoration(
            color: isTap ? context.secondColor.withOpacity(0.25) : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          width: context.width,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              vertical: context.width * 0.03, horizontal: context.width * 0.02),
          child: Text(
            choices[index],
            style: (isTap || (choices[index] == quizItemList[quizIndex].ans)) &&
                    isAnsView
                ? TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: (choices[index] == quizItemList[quizIndex].ans)
                        ? context.correctColor
                        : context.incorrectColor,
                  )
                : const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}

///わかならい
class _SkipChoice extends ConsumerWidget {
  const _SkipChoice();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizChoiceScreenProvider).quizItemList;
    final isAnsView = ref.watch(quizChoiceScreenProvider).isAnsView;
    final quizIndex = ref.watch(quizChoiceScreenProvider).quizIndex;
    const choice = 'わからない';
    final selectAns = ref.watch(quizChoiceScreenProvider).selectAns;
    final isTap = selectAns == choice;

    return GestureDetector(
      onTap: isAnsView
          ? null
          : () =>
              ref.read(quizChoiceScreenProvider.notifier).tapAnsButton(choice),
      child: Card(
        elevation: isTap ? 0 : 2,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width:
                isAnsView && (choice == quizItemList[quizIndex].ans) ? 1.5 : 1,
            color: isAnsView
                ? (choice == quizItemList[quizIndex].ans)
                    ? context.correctColor
                    : context.secondColor
                : context.secondColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.symmetric(
            vertical: context.width * 0.01, horizontal: context.width * 0.02),
        child: Container(
          decoration: BoxDecoration(
            color: isTap ? context.secondColor.withOpacity(0.25) : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          width: context.width,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              vertical: context.width * 0.03, horizontal: context.width * 0.02),
          child: Text(
            choice,
            style:
                (isTap || (choice == quizItemList[quizIndex].ans)) && isAnsView
                    ? TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: (choice == quizItemList[quizIndex].ans)
                            ? context.correctColor
                            : context.incorrectColor,
                      )
                    : const TextStyle(fontSize: 16, color: Colors.black87),
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
              width: context.height * 0.4,
              child: isJudge
                  ? Icon(
                      Icons.circle_outlined,
                      color: Colors.green.withOpacity(0.7),
                      size: context.height * 0.35,
                    )
                  : Icon(
                      Icons.clear,
                      color: Colors.red.withOpacity(0.7),
                      size: context.height * 0.35,
                    ),
            ),
          )
        : const SizedBox.shrink();
  }
}
