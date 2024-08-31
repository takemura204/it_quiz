part of '../home_study_screen.dart';

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowTutorial = ref.watch(homeStudyScreenProvider.select((s) => s.isShowTutorial));
    final quizList = ref.watch(homeStudyScreenProvider.notifier).getQuizList();
    final quizItemList = quizList.expand((x) => x.quizItemList).toList();
    final filterQuizList = ref.watch(homeStudyModalProvider.select((s) => s.filterQuizList));
    final filterQuizItemList = filterQuizList.expand((x) => x.quizItemList).toList();
    final isFiltered = quizItemList.length == filterQuizItemList.length;
    return AppBar(
      title: Text(I18n().titleStudy),
      centerTitle: true,
      actions: [
        Container(
          child: IconButton(
            iconSize: 32,
            padding: EdgeInsets.zero,
            onPressed: () {
              ref.read(homeStudyScreenProvider.notifier).setIsShowTutorial(!isShowTutorial);
              HapticFeedback.lightImpact();
            },
            icon: const Icon(
              LineIcons.questionCircle,
              size: 32,
              color: Colors.black54,
            ),
          ),
        ),
        IconButton(
          onPressed: () async {
            showStudyModal(context);
            HapticFeedback.lightImpact();
          },
          icon: Icon(
            LineIcons.horizontalSliders,
            size: 32,
            color: isFiltered ? Colors.black54 : context.mainColor,
          ),
        ),
        Gap(context.width * 0.01),
      ],
      shape: Border(bottom: BorderSide(color: context.mainColor, width: 0)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
