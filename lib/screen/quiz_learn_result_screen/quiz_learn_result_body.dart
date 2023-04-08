part of 'quiz_learn_result_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.item);

  final QuizItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _QuizResultView(item),
            ],
          ),
        ),
      ],
    );
  }
}
