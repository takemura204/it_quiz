part of '../quiz_choice_screen.dart';

class _ChoiceList extends ConsumerWidget {
  const _ChoiceList(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(authModelProvider.select((s) => s.isPremium));
    final choices = ref.watch(quizChoiceScreenProvider.select((s) => s.choices));
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
            ...List.generate(choices.length, (index) => _SelectChoice(index)),
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
          : () => ref.read(quizChoiceScreenProvider.notifier).tapAnsButton(choices[index]),
      child: Card(
        elevation: isTap ? 0 : 2,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: isAnsView && (choices[index] == quizItemList[quizIndex].ans) ? 1.5 : 1,
            color: isAnsView
                ? (choices[index] == quizItemList[quizIndex].ans)
                    ? context.correctColor
                    : context.secondColor
                : context.secondColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        margin:
            EdgeInsets.symmetric(vertical: context.width * 0.01, horizontal: context.width * 0.02),
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
            style: (isTap || (choices[index] == quizItemList[quizIndex].ans)) && isAnsView
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
      onTap:
          isAnsView ? null : () => ref.read(quizChoiceScreenProvider.notifier).tapAnsButton(choice),
      child: Card(
        elevation: isTap ? 0 : 2,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: isAnsView && (choice == quizItemList[quizIndex].ans) ? 1.5 : 1,
            color: isAnsView
                ? (choice == quizItemList[quizIndex].ans)
                    ? context.correctColor
                    : context.secondColor
                : context.secondColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        margin:
            EdgeInsets.symmetric(vertical: context.width * 0.01, horizontal: context.width * 0.02),
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
            style: (isTap || (choice == quizItemList[quizIndex].ans)) && isAnsView
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
