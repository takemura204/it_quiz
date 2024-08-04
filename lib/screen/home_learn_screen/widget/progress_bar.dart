part of '../home_learn_screen.dart';

class _QuizItemProgressBar extends HookConsumerWidget {
  const _QuizItemProgressBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(homeLearnScreenProvider.select((s) => s.quizItemList));
    final knowQuizItemList = ref.watch(homeLearnScreenProvider.select((s) => s.knowQuizItemList));
    final unKnowQuizItemList =
        ref.watch(homeLearnScreenProvider.select((s) => s.unKnowQuizItemList));
    final itemIndex = ref.watch(homeLearnScreenProvider.select((s) => s.itemIndex));
    final totalItems = quizItemList.length + knowQuizItemList.length + unKnowQuizItemList.length;
    final currentIndex = itemIndex + knowQuizItemList.length + unKnowQuizItemList.length;
    final progress = currentIndex / totalItems;

    return Container(
      height: 5.0,
      decoration: BoxDecoration(
        color: context.secondColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: context.width * progress,
          decoration: BoxDecoration(
            color: context.mainColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
