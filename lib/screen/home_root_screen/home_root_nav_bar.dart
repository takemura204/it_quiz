part of 'home_root_screen.dart';

class _BottomNavBar extends ConsumerWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch<HomeRootScreenState>(homeScreenControllerProvider);

    return BottomNavigationBar(
      iconSize: 22,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(
            DefaultIcons.ic_home,
          ),
          activeIcon: const Icon(
            DefaultIcons.ic_home_solid,
          ),
          label: I18n().labelHomeCampaigns,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            DefaultIcons.ic_search,
          ),
          activeIcon: const Icon(
            DefaultIcons.ic_search_solid,
          ),
          label: I18n().labelHomeSearch,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            DefaultIcons.ic_home,
          ),
          activeIcon: const Icon(
            DefaultIcons.ic_home_solid,
          ),
          label: I18n().labelHomeCampaigns,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            DefaultIcons.ic_heart,
          ),
          activeIcon: const Icon(
            DefaultIcons.ic_heart_solid,
          ),
          label: I18n().labelHomeClips,
        ),
      ],
      currentIndex: state.currentIndex,
      onTap: (index) => ref
          .watch(homeScreenControllerProvider.notifier)
          .changeTabIndex(index),
    );
  }
}
