part of '../quiz_result_screen.dart';

class _ResultHeaderCard extends ConsumerWidget {
  const _ResultHeaderCard(this.quizItemList);

  final List<QuizItem> quizItemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studyType = ref.watch(quizModelProvider.select((s) => s.studyType));
    final correctLength = quizItemList.where((x) => x.status == StatusType.correct).toList().length;
    Widget _resultCardWidget(StudyType studyType) {
      switch (studyType) {
        case StudyType.study:
        case StudyType.learn:
          return const _ResultClearCard();
        case StudyType.choice:
          if (correctLength == quizItemList.length)
            return const _ResultPerfectCard();
          else if (correctLength >= quizItemList.length * 0.6)
            return const _ResultGoodCard();
          else
            return const _ResultTryCard();
        default:
          return const _ResultClearCard();
      }
    }

    return _resultCardWidget(studyType);
  }
}

class _ResultClearCard extends ConsumerWidget {
  const _ResultClearCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: context.mainColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      alignment: Alignment.center,
      child: const FadeInAnimation(
        animateDirection: AnimateDirection.left,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CLEAR!!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Gap(5),
                  Text(
                    ' 毎日の学習が成長の１歩です！',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: 120,
            ),
          ],
        ),
      ),
    );
  }
}

class _ResultPerfectCard extends ConsumerWidget {
  const _ResultPerfectCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: context.mainColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: const FadeInAnimation(
        animateDirection: AnimateDirection.top,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PREFECT!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    '完璧です！全問正解を達成しました！',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                    size: 100,
                  ),
                  Icon(
                    Icons.circle_outlined,
                    color: Colors.white,
                    size: 50,
                  ),
                ],
              ),
            ),
            Gap(5),
          ],
        ),
      ),
    );
  }
}

class _ResultGoodCard extends ConsumerWidget {
  const _ResultGoodCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: context.mainColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: const FadeInAnimation(
        animateDirection: AnimateDirection.left,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GOOD!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    'いい感じですね！その調子です！',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.circle_outlined,
                color: Colors.white,
                size: 100,
              ),
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}

class _ResultTryCard extends ConsumerWidget {
  const _ResultTryCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: context.mainColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: FadeInAnimation(
        animateDirection: AnimateDirection.bottom,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(context.width * 0.05),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NICE TRY!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.width * 0.1,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    'もう少しで合格です！頑張っていきましょう！',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.width * 0.03,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.thumb_up,
                color: Colors.white,
                size: context.height * 0.085,
              ),
            ),
            Gap(context.width * 0.05),
          ],
        ),
      ),
    );
  }
}
