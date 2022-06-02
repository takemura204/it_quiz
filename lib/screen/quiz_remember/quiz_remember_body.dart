part of 'quiz_remember_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.arguments);

  final QuizRememberScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex =
        ref.watch(quizRememberScreenControllerProvider).quizIndex + 1;
    final lapIndex = ref.watch(quizRememberScreenControllerProvider).lapIndex;

    return Column(
      children: [
        ///問題形式表示
        Card(
          elevation: 1,
          margin: const EdgeInsets.all(0),
          child: Container(
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
                              quizIndex.toString(),
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
        Card(
          elevation: 3,
          margin: const EdgeInsets.all(0),
          child: Container(
            height: context.height * 0.06,
            alignment: Alignment.center,
            color: Colors.white70,
            child: Row(
              children: [
                const Divider(),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 4, 12),
                        child: AutoSizeText(
                          lapIndex.toString(),
                          style: context.texts.subtitle1,
                          minFontSize: 20,
                        ),
                      ),
                      const Text("周目"),
                    ],
                  ),
                ),
                Row(
                  children: const [
                    VerticalDivider(),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Text("知っている"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 4, 12),
                      child: AutoSizeText(
                        ref
                            .watch(quizRememberScreenControllerProvider)
                            .knowRememberQuestions
                            .length
                            .toString(),
                        style: context.texts.bodyText1
                            ?.copyWith(color: Colors.green.shade400),
                        minFontSize: 20,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const VerticalDivider(),
                const Spacer(),
                Row(
                  children: [
                    const Text("知らない"),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
                      child: AutoSizeText(
                        ref
                            .watch(quizRememberScreenControllerProvider)
                            .unKnowRememberQuestions
                            .length
                            .toString(),
                        style: context.texts.bodyText1
                            ?.copyWith(color: Colors.redAccent.shade100),
                        minFontSize: 20,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
