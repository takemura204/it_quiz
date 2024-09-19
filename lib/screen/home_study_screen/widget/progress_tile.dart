part of '../home_study_screen.dart';

class _ProgressTile extends ConsumerWidget {
  const _ProgressTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRepeat = ref.watch(homeStudyScreenProvider.select((s) => s.isRepeat));
    final direction = ref.watch(homeStudyScreenProvider.select((s) => s.direction));
    final quizItemList = ref.watch(homeStudyScreenProvider.select((s) => s.quizItemList));
    final knowQuizItemList = ref.watch(homeStudyScreenProvider.select((s) => s.knowQuizItemList));
    final unKnowQuizItemList =
        ref.watch(homeStudyScreenProvider.select((s) => s.unKnowQuizItemList));
    final itemIndex = ref.watch(homeStudyScreenProvider.select((s) => s.itemIndex));
    final totalItems =
        quizItemList.length + (knowQuizItemList.length + unKnowQuizItemList.length - itemIndex);
    final currentIndex =
        isRepeat ? knowQuizItemList.length : knowQuizItemList.length + unKnowQuizItemList.length;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///知らない
        Container(
          height: 30,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: direction == AppinioSwiperDirection.left ? context.incorrectColor : Colors.white,
            border: Border(
              top: BorderSide(color: context.incorrectColor, width: 1.0),
              bottom: BorderSide(color: context.incorrectColor, width: 1.0),
              right: BorderSide(color: context.incorrectColor, width: 1.0),
              left: BorderSide.none,
            ),
            borderRadius: const BorderRadius.horizontal(right: Radius.circular(90)),
          ),
          child: Text(
            direction == AppinioSwiperDirection.left ? '+1' : '${unKnowQuizItemList.length}',
            style: TextStyle(
              color:
                  direction == AppinioSwiperDirection.left ? Colors.white : context.incorrectColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        ///何問目
        Text(
          '$currentIndex / $totalItems',
          style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        ),

        ///知っている
        Container(
          height: 30,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: direction == AppinioSwiperDirection.right ? context.correctColor : Colors.white,
            border: Border(
              top: BorderSide(color: context.correctColor, width: 1.0),
              bottom: BorderSide(color: context.correctColor, width: 1.0),
              right: BorderSide.none,
              left: BorderSide(color: context.correctColor, width: 1.0),
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.zero,
              bottomRight: Radius.zero,
              topLeft: Radius.circular(90),
              bottomLeft: Radius.circular(90),
            ),
          ),
          child: Text(
            direction == AppinioSwiperDirection.right ? '+1' : '${knowQuizItemList.length}',
            style: TextStyle(
              color:
                  direction == AppinioSwiperDirection.right ? Colors.white : context.correctColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
