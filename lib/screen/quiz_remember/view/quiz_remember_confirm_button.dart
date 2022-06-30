part of '../quiz_remember_screen.dart';

class _ConfirmButtonView extends ConsumerWidget {
  const _ConfirmButtonView(this.arguments);

  final QuizRememberScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAns = ref.watch(quizRememberScreenControllerProvider).isAnsView;

    return isAns
        ? Row(
            ///知らない
            children: [
              GestureDetector(
                onTap: () => ref
                    .read(quizRememberScreenControllerProvider.notifier)
                    .tapUnKnownButton(arguments),
                child: Container(
                  width: context.width * 0.42,
                  height: context.height * 0.1,
                  color: context.colors.orange100.withOpacity(0.1),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    I18n().buttonUnKnow,
                    style: context.texts.bodyText1
                        ?.copyWith(color: Colors.redAccent.shade100),
                    minFontSize: 18,
                  ),
                ),
              ),

              ///境界線
              Container(
                height: context.height * 0.1,
                width: context.height * 0.002,
                color: context.colors.dark12,
              ),

              ///知っている
              GestureDetector(
                onTap: () {
                  ref
                      .read(quizRememberScreenControllerProvider.notifier)
                      .tapKnownButton(arguments);
                  //「知っている」が全てになった時結果画面に遷移
                  if (ref
                          .watch(quizRememberScreenControllerProvider)
                          .knowRememberQuestions
                          .length ==
                      arguments.item.rememberQuiz.length) {
                    context.showScreen(QuizResultScreenArguments(
                      item: arguments.item,
                      quizStyle: I18n().studyOneQuestion,
                    ).generateRoute());
                  }
                },
                child: Container(
                  width: context.width * 0.42,
                  height: context.height * 0.1,
                  color: context.colors.orange100.withOpacity(0.1),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    I18n().buttonKnow,
                    style: context.texts.bodyText1
                        ?.copyWith(color: Colors.green.shade400),
                    minFontSize: 16,
                  ),
                ),
              ),
            ],
          )
        : GestureDetector(
            onTap: () => ref
                .read(quizRememberScreenControllerProvider.notifier)
                .tapConfirmButton(),
            child: Container(
              width: context.height * 0.85,
              height: context.height * 0.1,
              color: context.colors.orange100.withOpacity(0.1),
              alignment: Alignment.center,
              child: AutoSizeText(
                I18n().buttonConfirm,
                style: context.texts.subtitle1,
                minFontSize: 16,
              ),
            ),
          );
  }
}
