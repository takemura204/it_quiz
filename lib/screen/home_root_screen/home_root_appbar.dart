part of 'home_root_screen.dart';

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch<HomeRootScreenState>(homeScreenControllerProvider);

    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      title: IndexedStack(
        alignment: Alignment.center,
        children: [
          Text(I18n().titleStudy),
          Text(I18n().titleReview),
          Text(I18n().titleTest),
          Text(I18n().titleSetting),
        ],
        index: state.currentIndex,
      ),
      // actions: [
      //   IndexedStack(
      //     children: [
      //       IconButton(
      //         iconSize: 28,
      //         padding:
      //             const EdgeInsets.only(top: 14, right: 8, left: 8, bottom: 8),
      //         onPressed: () async {
      //           // context.read<AppController>(appControllerProvider.notifier).showScreen(const SearchProgramScreenArguments());
      //         },
      //         icon: const Icon(Icons.search),
      //       ),
      //       const SizedBox.shrink(),
      //       const SizedBox.shrink(),
      //       const SizedBox.shrink(),
      //     ],
      //     index: state.currentIndex,
      //   )
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
