part of 'home_root_screen.dart';

class _BottomNavBar extends ConsumerWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =
        ref.watch<HomeRootScreenState>(homeRootScreenControllerProvider);

    return BottomNavigationBar(
      iconSize: 35,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.list_alt),
          activeIcon: const Icon(Icons.list_alt),
          label: I18n().titleStudy,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.checklist_rtl),
          activeIcon: const Icon(Icons.checklist_rtl),
          label: I18n().titleReview,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.edit_note),
          activeIcon: const Icon(Icons.edit_note),
          label: I18n().titleTest,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle),
          activeIcon: const Icon(Icons.account_circle),
          label: I18n().titleSetting,
        ),
      ],
      currentIndex: state.currentIndex,
      onTap: (index) => ref
          .watch(homeRootScreenControllerProvider.notifier)
          .changeTabIndex(index),
    );
  }
}
