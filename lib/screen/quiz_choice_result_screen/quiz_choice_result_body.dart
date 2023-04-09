part of 'quiz_choice_result_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.item);

  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ///正解した問題リスト
              _QuizResultView(item),
            ],
          ),
        ),
      ],
    );
  }
}
