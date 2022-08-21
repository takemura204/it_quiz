part of 'quiz_choice_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.arguments);

  final QuizChoiceScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Column(
          children: [
            ///問題形式タイトル
            _QuizStyleTitle(arguments),
            const Spacer(),

            ///問題画面
            Card(
              elevation: 3,
              child: Container(
                width: context.width * 0.85,
                height: context.height * 0.45,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ///問題文
                    _Question(arguments),

                    ///進捗状況
                    _QuizProgress(arguments),
                  ],
                ),
              ),
            ),
            const Spacer(),

            ///選択肢
            _SelectAnswer(arguments),
          ],
        ),
        _JudgeIcon(arguments),
      ],
    );
  }
}
