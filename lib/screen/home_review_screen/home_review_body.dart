part of 'home_review_screen.dart';

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final learnList = ref.watch(homeReviewScreenControllerProvider).learnList;
    final choiceList = ref.watch(homeReviewScreenControllerProvider).choiceList;
    final trueFalseList =
        ref.watch(homeReviewScreenControllerProvider).trueFalseList;
    return Column(
      children: [
        ///一問一答から復習
        if (learnList.isEmpty)
          const _NullQuizButton()
        else
          const _LearnQuizButton(),

        ///選択問題から復習
        if (choiceList.isEmpty)
          const _NullQuizButton()
        else
          const _ChoiceQuizButton(),

        ///○×問題から復習
        if (trueFalseList.isEmpty)
          const _NullQuizButton()
        else
          const _TrueFalseQuizButton(),
      ],
    );
  }
}
