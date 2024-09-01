part of '../quiz_result_screen.dart';

class NextActionButtons extends HookConsumerWidget {
  const NextActionButtons(this.quizItemList);

  final List<QuizItem> quizItemList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResultView = ref.watch(homeStudyScreenProvider.select((s) => s.isResultView));
    return Container(
      color: context.backgroundColor,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      width: context.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(10),
          Expanded(
            child: DefaultVerticalButton(
              width: context.width * 0.45,
              height: 85,
              text: "もう一度",
              icon: LineIcons.alternateRedo,
              onPressed: () async {
                ref.read(homeStudyScreenProvider.notifier).restartStudyQuiz();
                if (isResultView) {
                  ref.read(homeStudyScreenProvider.notifier).setIsResultView(false);
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
          const Gap(10),
          Expanded(
            child: PrimaryVerticalButton(
              width: context.width * 0.45,
              height: 85,
              title: "条件を変更",
              icon: LineIcons.horizontalSliders,
              onPressed: () {
                showStudyModal(context);
              },
            ),
          ),
          const Gap(10),
        ],
      ),
    );
  }
}

class DefaultVerticalButton extends HookConsumerWidget {
  const DefaultVerticalButton({
    required this.width,
    required this.height,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final double width;
  final double height;
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height,
      // width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          side: BorderSide(
            color: onPressed == null ? Colors.white10 : context.mainColor,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: onPressed == null ? Colors.grey.shade500 : context.mainColor,
                size: height * 0.45,
              ),
            SizedBox(width: icon != null ? 6.0 : 0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: onPressed == null ? Colors.grey.shade500 : context.mainColor,
                fontWeight: FontWeight.bold,
                fontSize: height < context.height * 0.05 ? 14 : 16,
              ),
            ),
          ],
        ),
        onPressed: onPressed == null
            ? null
            : () {
                onPressed!();
                HapticFeedback.lightImpact();
              },
      ),
    );
  }
}

class PrimaryVerticalButton extends HookConsumerWidget {
  const PrimaryVerticalButton({
    required this.width,
    required this.height,
    required this.title,
    this.subTitle,
    this.icon,
    required this.onPressed,
  });

  final double width;
  final double height;
  final String title;
  final String? subTitle;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: context.mainColor,
          elevation: 0,
          padding: const EdgeInsets.all(3.0),
          alignment: Alignment.center,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: Colors.white,
                size: height * 0.45,
              ),
            SizedBox(width: icon != null ? 8.0 : 0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: height <= 5 ? 14 : 16,
              ),
            ),
          ],
        ),
        onPressed: onPressed == null
            ? null
            : () {
                onPressed!();
                HapticFeedback.lightImpact();
              },
      ),
    );
  }
}
