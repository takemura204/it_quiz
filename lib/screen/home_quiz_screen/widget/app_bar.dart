part of '../home_quiz_screen.dart';

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar({required this.categoryList, required this.tabController});

  final List<String> categoryList;
  final TabController tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(homeQuizScreenProvider).tabIndex;
    return AppBar(
      title: Text(I18n().titleQuiz),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + kTextTabBarHeight),
        child: TabBar(
          tabAlignment: TabAlignment.center,
          controller: tabController,
          onTap: (index) {
            ref.read(homeQuizScreenProvider.notifier).setTabIndex(index);
            HapticFeedback.lightImpact();
          },
          isScrollable: true,
          labelColor: context.mainColor,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          tabs: List.generate(
            categoryList.length,
            (index) => Tab(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  categoryList[index],
                  style: TextStyle(
                    fontWeight: index == tabIndex ? FontWeight.bold : FontWeight.normal,
                    fontSize: 16,
                  ),
                  maxLines: 2, // テキストが多い場合に 2 行まで表示を許可
                  overflow: TextOverflow.ellipsis, // 2 行を超えるテキストは省略記号で表示
                ),
              ),
            ),
          ),
        ),
      ),
      shape: Border(bottom: BorderSide(color: context.mainColor, width: 0)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + kTextTabBarHeight); // 高さを適切に設定
}
