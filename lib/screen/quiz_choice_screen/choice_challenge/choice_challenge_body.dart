part of '../quiz_choice_screen.dart';

class ChoiceChallengeBody extends ConsumerWidget {
  const ChoiceChallengeBody(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Column(
          children: [
            const Spacer(),

            ///問題画面
            Card(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: context.mainColor,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: context.width * 0.85,
                height: context.height * 0.5,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ///問題文
                    _Question(quiz),

                    ///進捗状況
                    _QuizProgress(quiz),
                  ],
                ),
              ),
            ),
            const Spacer(),

            ///選択肢
            _SelectAnswer(quiz),

            ///広告
            AdBanner(),
          ],
        ),
        _JudgeIcon(quiz),
      ],
    );
  }
}
