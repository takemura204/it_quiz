part of '../home_search_screen.dart';

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar({required this.isSavedFilter});

  final bool isSavedFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizModelProvider.notifier).getQuizList();
    final quizItemList = quizList.expand((x) => x.quizItemList).toList();
    final filterQuizList = ref.watch(homeSearchModalProvider.select((s) => s.filterQuizList));
    final filterQuizItemList = filterQuizList.expand((x) => x.quizItemList).toList();
    final isFiltered = quizItemList.length == filterQuizItemList.length;
    return AppBar(
      title: Text(I18n().titleSearch),
      centerTitle: true,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () async {
            showSearchModal(context);
            HapticFeedback.lightImpact();
          },
          icon: Icon(
            LineIcons.horizontalSliders,
            size: 32,
            color: isFiltered ? Colors.black54 : context.mainColor,
          ),
        ),
        const Gap(3),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
