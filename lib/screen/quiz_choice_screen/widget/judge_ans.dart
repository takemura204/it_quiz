part of '../quiz_choice_screen.dart';

class _JudgeAns extends ConsumerWidget {
  const _JudgeAns(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isJudge = ref.watch(quizChoiceScreenProvider).isJudge;
    final isAnsView = ref.watch(quizChoiceScreenProvider).isAnsView;

    return isAnsView
        ? Align(
            alignment: Alignment.center,
            child: Container(
              width: context.height * 0.4,
              child: isJudge
                  ? Icon(
                      Icons.circle_outlined,
                      color: Colors.green.withOpacity(0.7),
                      size: context.height * 0.35,
                    )
                  : Icon(
                      Icons.clear,
                      color: Colors.red.withOpacity(0.7),
                      size: context.height * 0.35,
                    ),
            ),
          )
        : const SizedBox.shrink();
  }
}
