part of '../quiz_remember_screen.dart';

class _Question extends ConsumerWidget {
  const _Question(this.arguments);

  final QuizRememberScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizRememberScreenControllerProvider).isAnsView;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(child: child, opacity: animation); //スケールアニメーション
      },
      child: isAns ? _AnsQuestion(arguments) : _ConfirmQuestion(arguments),
    );
  }
}

class _ConfirmQuestion extends ConsumerWidget {
  const _ConfirmQuestion(this.arguments);
  final QuizRememberScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.35,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const Spacer(),
          SubstringHighlight(
            text: arguments.item.oneQuestions[2].question,
            term: arguments.item.oneQuestions[2].ans,
            textStyle: TextStyle(
              color: context.colors.dark54,
              fontWeight: FontWeight.w500,
              fontSize: 21,
            ),
            textStyleHighlight: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.colors.main50.withOpacity(0.5),
              decoration: TextDecoration.underline,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _AnsQuestion extends ConsumerWidget {
  const _AnsQuestion(this.arguments);
  final QuizRememberScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.35,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const Spacer(),
          SubstringHighlight(
            text: arguments.item.oneQuestions[2].question.replaceAll(
                arguments.item.oneQuestions[2].ans,
                I18n().hideText(arguments.item.oneQuestions[2].ans)),
            term: arguments.item.oneQuestions[2].ans,
            textStyle: TextStyle(
              color: context.colors.dark54,
              fontWeight: FontWeight.w500,
              fontSize: 21,
            ),
            textStyleHighlight: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.colors.main50.withOpacity(0.5),
              decoration: TextDecoration.underline,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
