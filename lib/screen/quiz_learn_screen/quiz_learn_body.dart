part of 'quiz_learn_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.arguments);

  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ///問題形式表示
        _QuizStyleTitle(arguments),
        const Spacer(),

        ///問題
        Card(
          elevation: 3,
          child: Container(
            width: context.width * 0.85,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: context.height * 0.40,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      ///問題文
                      _Question(arguments),

                      ///問題進捗状況
                      _QuizProgress(arguments),
                    ],
                  ),
                ),
                Divider(height: 1, color: context.colors.dark54),

                ///確認ボタン
                _ConfirmButton(arguments),
              ],
            ),
          ),
        ),
        const Spacer(),

        ///何周目か確認
        _LapInfoBar(arguments),
      ],
    );
  }
}
