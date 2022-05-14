part of 'quiz_remember_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.arguments);

  final QuizRememberScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizRememberScreenControllerProvider).isAnsView;

    return Column(
      children: [
        ///問題形式表示
        Container(
          height: context.height * 0.05,
          color: context.colors.main10,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  arguments.quizStyle,
                  style: context.texts.subtitle1,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        const Spacer(),

        ///問題画面
        Card(
          elevation: 3,
          child: Container(
            width: context.width * 0.85,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: context.height * 0.45,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const Spacer(),

                      ///問題文
                      _Question(arguments),

                      ///問題数と進行数
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            const Spacer(),
                            AutoSizeText(
                              "0",
                              style: context.texts.subtitle1,
                              minFontSize: 20,
                            ),
                            const Text("/"),
                            AutoSizeText(
                              rememberQuiz1.length.toString(),
                              style: context.texts.bodyText1,
                              minFontSize: 16,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
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

        ///知っている、知らないの問題判別
        Container(
          height: context.height * 0.07,
          alignment: Alignment.center,
          color: context.colors.main10,
          child: Row(
            children: const [
              Text("何周目"),
              VerticalDivider(),
              Spacer(),
              Text("知っている"),
              Spacer(),
              VerticalDivider(),
              Spacer(),
              Text("知らない"),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
