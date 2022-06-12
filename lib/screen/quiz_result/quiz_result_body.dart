part of 'quiz_result_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.arguments);

  final QuizResultScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _AnsRateView(arguments),
              _UnKnowQuestionsView(arguments),
              _KnowQuestionsView(arguments),
            ],
          ),
        ),
      ],
    );
  }
}
