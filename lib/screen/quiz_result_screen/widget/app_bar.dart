part of '../quiz_result_screen.dart';

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studyType = ref.watch(quizModelProvider.select((s) => s.studyType));

    void onTapClearButton(StudyType studyType) {
      switch (studyType) {
        case StudyType.study:
          ref.read(homeStudyScreenProvider.notifier).setIsResultScreen(false);
          ref.read(mainScreenControllerProvider.notifier).setIsShowInAppReview();
          return;
        case StudyType.learn:
          ref.read(mainScreenControllerProvider.notifier).setIsShowInAppReview();
          return;
        case StudyType.choice:
          ref.read(quizChoiceScreenProvider.notifier).resetScreen();
          ref.read(mainScreenControllerProvider.notifier).setIsShowInAppReview();
          return;
        default:
          return;
      }
    }

    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text("結果"),
      actions: [
        ClearButton(
            iconSize: 30,
            onPressed: () {
              onTapClearButton(studyType);
              Navigator.of(context).pop();
            }),
        Gap(context.width * 0.02),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
