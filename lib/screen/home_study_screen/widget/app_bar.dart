part of '../home_study_screen.dart';

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.watch(authModelProvider.select((s) => s.isPremium));
    final isShowTutorial = ref.watch(homeStudyScreenProvider.select((s) => s.isShowTutorial));
    final quizList = ref.watch(quizModelProvider.notifier).getQuizList();
    final quizItemList = quizList.expand((x) => x.quizItemList).toList();
    final filterQuizList = ref.watch(homeStudyModalProvider.select((s) => s.filterQuizList));
    final filterQuizItemList = filterQuizList.expand((x) => x.quizItemList).toList();
    final isFiltered = quizItemList.length == filterQuizItemList.length;
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(I18n().titleAppName),
          const Gap(5),
          if (isPremium) const _PremiumLabel(),
        ],
      ),
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

///プレミアム購入時
class _PremiumLabel extends ConsumerWidget {
  const _PremiumLabel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: context.accentColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Text(
          'PREMIUM',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
