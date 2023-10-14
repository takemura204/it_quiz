part of 'home_root_screen.dart';

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =
        ref.watch<HomeRootScreenState>(homeRootScreenControllerProvider);

    return IndexedStack(
      sizing: StackFit.expand,
      index: state.currentIndex,
      children: const [
        HomeQuizScreen(),
        HomeSearchScreen(),
        HomeDashboardScreen(),
        HomeSettingScreen(),
      ],
    );
  }
}

class _BottomNavBar extends ConsumerWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeRootScreenControllerProvider);

    return BottomNavigationBar(
        elevation: 300,
        iconSize: 35,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(LineIcons.list),
            activeIcon: const Icon(LineIcons.list),
            label: I18n().titleStudy,
          ),
          BottomNavigationBarItem(
            icon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(math.pi),
              child: const Icon(LineIcons.search),
            ),
            activeIcon: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(math.pi),
              child: const Icon(LineIcons.search),
            ),
            label: I18n().titleSearch,
          ),
          BottomNavigationBarItem(
            icon: const Icon(LineIcons.barChartAlt),
            activeIcon: const Icon(LineIcons.barChartAlt),
            label: I18n().titleDashboard,
          ),
          BottomNavigationBarItem(
            icon: const Icon(LineIcons.user),
            activeIcon: const Icon(LineIcons.user),
            label: I18n().titleSetting,
          ),
        ],
        currentIndex: state.currentIndex,
        fixedColor: context.mainColor,
        onTap: (index) async {
          ref
              .watch(homeRootScreenControllerProvider.notifier)
              .changeTabIndex(index);

          if (index == 1) {
            // ref.read(homeSearchScreenProvider.notifier).initState();
          } else if (index == 2) {
            ref.read(dashboardAnalyticsProvider.notifier).initState();
            ref.read(dashboardModelProvider.notifier).initState();
          } else if (index == 3) {
            ref.read(authProvider.notifier).initState();
          }
        });
  }
}
