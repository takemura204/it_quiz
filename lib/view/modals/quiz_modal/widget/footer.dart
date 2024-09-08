part of '../quiz_modal.dart';

class _Footer extends HookConsumerWidget {
  const _Footer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterQuizItemList = ref.watch(homeQuizModalProvider.select((s) => s.filterQuizItemList));
    final isResultView = ref.watch(homeStudyScreenProvider.select((s) => s.isResultView));
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
            title: 'この条件でクイズを開始',
            onPressed: filterQuizItemList.isNotEmpty
                ? () {
                    ref.read(homeQuizModalProvider.notifier).updateStudyQuizItemList();
                    if (isResultView) {
                      Navigator.of(context).pop();
                      ref.read(homeStudyScreenProvider.notifier).setIsResultView(false);
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
