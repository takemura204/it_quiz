part of '../study_modal.dart';

class _Footer extends HookConsumerWidget {
  const _Footer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterQuizList = ref.watch(homeStudyModalProvider.select((s) => s.filterQuizList));
    final filterQuizItemList = filterQuizList.expand((x) => x.quizItemList).toList();
    final isResultScreen = ref.watch(homeStudyScreenProvider.select((s) => s.isResultScreen));
    return Container(
      color: context.backgroundColor,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: Column(
        children: [
          TweenAnimationBuilder<int>(
            tween: IntTween(
              end: filterQuizItemList.length, // 現在の長さを終点とする
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
            title: 'この条件で絞り込む',
            onPressed: filterQuizItemList.isNotEmpty
                ? () {
                    ref.read(homeStudyModalProvider.notifier).updateStudyQuizItemList();
                    if (isResultScreen) {
                      Navigator.of(context).pop();
                      ref.read(homeStudyScreenProvider.notifier).setIsResultScreen(false);
                    }

                    ref.read(homeStudyScreenProvider.notifier).setIsFinishView(false);
                    ref.read(homeStudyScreenProvider.notifier).startStopwatch();
                    Navigator.of(context).pop();
                  }
                : null,
          ),
          Gap(context.height * 0.025),
        ],
      ),
    );
  }
}