part of 'quiz_true_false_result_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.arguments);

  final QuizTrueFalseScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ///正答率
              _AnsRateView(arguments),

              ///間違えた問題リスト
              _UnKnowQuestionsView(arguments),

              ///正解した問題リスト
              _KnowQuestionsView(arguments),
            ],
          ),
        ),
      ],
    );
  }
}
