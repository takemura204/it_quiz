part of 'quiz_choice_screen.dart';

class _Body extends ConsumerWidget {
  const _Body(this.arguments);

  final QuizChoiceScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      ],
    );
  }
}
