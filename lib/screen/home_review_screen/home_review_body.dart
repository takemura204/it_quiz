part of 'home_review_screen.dart';

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(homeReviewScreenControllerProvider).quizList;
    return Column(
      children: [
        ///一問一答から復習
        if (quizList.isEmpty)
          const _NullQuizButton()
        else
          const _LearnQuizButton(),

        ///選択問題から復習
        if (quizList.isEmpty)
          const _NullQuizButton()
        else
          const _ChoiceQuizButton(),

        ///○×問題から復習
        if (quizList.isEmpty)
          const _NullQuizButton()
        else
          const _TrueFalseQuizButton(),
      ],
    );
  }
}
