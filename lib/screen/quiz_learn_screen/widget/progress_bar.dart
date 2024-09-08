part of '../quiz_learn_screen.dart';

class _QuizItemProgressBar extends HookConsumerWidget {
  const _QuizItemProgressBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(quizLearnScreenProvider.select((s) => s.quizItemList));
    final knowQuizItemList = ref.watch(quizLearnScreenProvider.select((s) => s.knowQuizItemList));
    final unKnowQuizItemList =
        ref.watch(quizLearnScreenProvider.select((s) => s.unKnowQuizItemList));
    final itemIndex = ref.watch(quizLearnScreenProvider.select((s) => s.itemIndex));
    final totalItems =
        quizItemList.length + (knowQuizItemList.length + unKnowQuizItemList.length - itemIndex);
    final currentIndex =
        itemIndex + (knowQuizItemList.length + unKnowQuizItemList.length - itemIndex);
    final isRepeat = ref.watch(quizLearnScreenProvider.select((s) => s.isRepeat));
    final isNotRepeatProgress = totalItems > 0 ? currentIndex / totalItems : 0.0;
    final isRepeatProgress = totalItems > 0 ? knowQuizItemList.length / totalItems : 0.0;
    final progress = isRepeat ? isRepeatProgress : isNotRepeatProgress;

    return Container(
      height: 5.0,
      width: double.infinity,
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
