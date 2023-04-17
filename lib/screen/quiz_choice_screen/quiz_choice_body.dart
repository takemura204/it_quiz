part of 'quiz_choice_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.item);

  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Column(
          children: [
            ///問題形式タイトル
            _QuizStyleTitle(item),
            const Spacer(),

            ///問題画面
            Card(
              elevation: 3,
              child: Container(
                width: context.width * 0.85,
                height: context.height * 0.5,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ///問題文
                    _Question(item),

                    ///進捗状況
                    _QuizProgress(item),
                  ],
                ),
              ),
            ),
            const Spacer(),

            ///選択肢
            _SelectAnswer(item),

            ///広告
            Container(
              height: context.height * 0.07,
              color: Colors.cyan,
              child: Row(
                children: const [
                  Spacer(),
                  Text(
                    "広告入れたい",
                    style: TextStyle(fontSize: 30),
                  ),
                  Spacer(),
                ],
              ),
            )
          ],
        ),
        _JudgeIcon(item),
      ],
    );
  }
}
