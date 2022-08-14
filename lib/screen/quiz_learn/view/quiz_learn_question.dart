part of '../quiz_learn_screen.dart';

class _Question extends ConsumerWidget {
  const _Question(this.arguments);

  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizLearnScreenControllerProvider).isAnsView;

    return Container(
      height: context.height * 0.35,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const Spacer(),
          AnimatedSwitcher(
            /// アニメーションがおかしい
            duration: const Duration(milliseconds: 0),

            // reverseDuration: const Duration(milliseconds: 100),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(child: child, opacity: animation);
            },
            child:
                isAns ? _ConfirmQuestion(arguments) : _AnsQuestion(arguments),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _ConfirmQuestion extends ConsumerWidget {
  const _ConfirmQuestion(this.arguments);
  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizLearnScreenControllerProvider).quizIndex;

    return SubstringHighlight(
      text: arguments.item.rememberQuiz[quizIndex].question,
      term: arguments.item.rememberQuiz[quizIndex].ans,
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
    );
  }
}

class _AnsQuestion extends ConsumerWidget {
  const _AnsQuestion(this.arguments);
  final QuizLearnScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizIndex = ref.watch(quizLearnScreenControllerProvider).quizIndex;

    return SubstringHighlight(
      text: arguments.item.rememberQuiz[quizIndex].question.replaceAll(
          arguments.item.rememberQuiz[quizIndex].ans,
          I18n().hideText(arguments.item.rememberQuiz[quizIndex].ans)),
      term: arguments.item.rememberQuiz[quizIndex].ans,
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
    );
  }
}
