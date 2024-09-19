part of '../main_screen.dart';

class _BottomNavBar extends ConsumerWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTabIndex =
        ref.watch(mainScreenControllerProvider.select((s) => s.currentTabIndex));

    return BottomNavigationBar(
        iconSize: 35,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/swipe_cards.svg',
              width: 35,
              height: 35,
              colorFilter: const ColorFilter.mode(Colors.black38, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icon/swipe_cards_active.svg',
              width: 35,
              height: 35,
              colorFilter: ColorFilter.mode(context.mainColor, BlendMode.srcIn),
            ),
            label: I18n().titleStudy,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/list.svg',
              width: 35,
              height: 35,
              colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icon/list.svg',
              width: 35,
              height: 35,
              colorFilter: ColorFilter.mode(context.mainColor, BlendMode.srcIn),
            ),
            label: I18n().titleQuiz,
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
            icon: const Icon(LineIcons.cog),
            activeIcon: const Icon(LineIcons.cog),
            label: I18n().titleSetting,
          ),
        ],
        currentIndex: currentTabIndex,
        fixedColor: context.mainColor,
        onTap: (index) async {
          ref.read(mainScreenControllerProvider.notifier).setTabIndex(index);
          if (index != 0) {
            ref.read(homeStudyScreenProvider.notifier).stopwatch.stop();
          }
          if (index == 0) {
            ref.read(quizModelProvider.notifier).setStudyType(StudyType.study);
          }
          if (index == 3) {
            ref.read(dashboardModelProvider.notifier).initState();
          }
          if (index == 4) {
            ref.read(authProvider.notifier).initState();
            final isShowTrackingModal = ref.read(mainScreenControllerProvider).isShowTrackingModal;
            if (!isShowTrackingModal) {
              ref.read(settingNotificationProvider.notifier).initState();
            }
          }
          HapticFeedback.lightImpact();
        });
  }
}
