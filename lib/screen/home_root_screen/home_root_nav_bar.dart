part of 'home_root_screen.dart';

class _BottomNavBar extends ConsumerWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =
        ref.watch<HomeRootScreenState>(homeRootScreenControllerProvider);

    return BottomNavigationBar(
      elevation: 300,
      iconSize: 35,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.list_alt_outlined),
          activeIcon: const Icon(Icons.list_alt_outlined),
          label: I18n().titleStudy,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.tips_and_updates_outlined),
          activeIcon: const Icon(Icons.tips_and_updates_outlined),
          label: I18n().titleReview,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.insights_outlined),
          activeIcon: const Icon(Icons.insights_outlined),
          label: I18n().titleTest,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_outline),
          activeIcon: const Icon(Icons.person_outline),
          label: I18n().titleSetting,
        ),
      ],
      currentIndex: state.currentIndex,
      fixedColor: context.colors.main50.withOpacity(0.7),
      onTap: (index) => ref
          .watch(homeRootScreenControllerProvider.notifier)
          .changeTabIndex(index),
    );
  }
}
