part of 'quiz_one_question_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.arguments);

  final QuizOneQuestionScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
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
                ///問題文
                Container(
                  height: context.height * 0.45,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: AutoSizeText(
                          oneQuestions[2].question,
                          style: context.texts.bodyText1,
                          minFontSize: 20,
                        ),
                      ),
                      const Spacer(),

                      ///問題数と進行度
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            const Spacer(),
                            AutoSizeText(
                              "0",
                              style: context.texts.subtitle1,
                              minFontSize: 20,
                            ),
                            Text("/"),
                            AutoSizeText(
                              oneQuestions.length.toString(),
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
                GestureDetector(
                  onTap: () {
                    print("a");
                  },
                  child: Container(
                    width: context.height * 0.85,
                    height: context.height * 0.1,
                    color: context.colors.orange100.withOpacity(0.2),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      I18n().buttonConfirm,
                      style: context.texts.subtitle1,
                      minFontSize: 16,
                    ),
                  ),
                ),
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
