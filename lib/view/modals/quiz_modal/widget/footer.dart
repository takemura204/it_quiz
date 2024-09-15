part of '../quiz_modal.dart';

class _Footer extends HookConsumerWidget {
  const _Footer({required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterQuizItemList = ref.watch(homeQuizModalProvider.select((s) => s.filterQuizItemList));
    final quizItemCount = ref.watch(homeQuizModalProvider.select((s) => s.quizItemCount));
    final selectedStatusList = ref.watch(homeQuizModalProvider.select((s) => s.selectedStatusList));
    final selectedImportanceList =
        ref.watch(homeQuizModalProvider.select((s) => s.selectedImportanceList));
    final isSaved = ref.watch(homeQuizModalProvider.select((s) => s.isSaved));
    final isWeak = ref.watch(homeQuizModalProvider.select((s) => s.isWeak));
    final studyType = ref.watch(homeQuizModalProvider.select((s) => s.selectedStudyType));
    return Container(
      color: context.backgroundColor,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: Column(
        children: [
          TweenAnimationBuilder<int>(
            tween: IntTween(
              end: filterQuizItemList.length,
            ),
            duration: const Duration(milliseconds: 300), // アニメーションの長さを調整します
            builder: (context, value, child) => RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(color: Colors.black87),
                children: [
                  TextSpan(
                    text: '$value',
                    style: TextStyle(
                        fontSize: 16, color: context.mainColor, fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: ' 問に絞り込み中',
                    style:
                        TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const Gap(10),
          PrimaryButton(
            width: context.width * 1,
            height: 60,
            title: 'この条件でクイズ開始',
            onPressed: filterQuizItemList.isNotEmpty
                ? () {
                    ref.read(homeQuizModalProvider.notifier).updateFilterQuizList();
                    ref.read(homeQuizScreenProvider.notifier).setStudyQuizLength(quizItemCount);
                    ref
                        .read(homeQuizScreenProvider.notifier)
                        .setSelectedStatusList(selectedStatusList);
                    ref
                        .read(homeQuizScreenProvider.notifier)
                        .setSelectedImportanceList(selectedImportanceList);
                    ref.read(homeQuizScreenProvider.notifier).setIsSaved(isSaved);
                    ref.read(homeQuizScreenProvider.notifier).setIsWeak(isWeak);
                    Navigator.of(context).pop();
                    if (studyType == StudyType.choice) {
                      context.showScreen(QuizChoiceScreenArguments(
                        quiz: quiz.copyWith(quizItemList: filterQuizItemList),
                      ).generateRoute());
                    } else {
                      context.showScreen(QuizLearnScreenArguments(
                        quiz: quiz.copyWith(quizItemList: filterQuizItemList),
                      ).generateRoute());
                    }
                  }
                : null,
          ),
          Gap(context.height * 0.025),
        ],
      ),
    );
  }
}
