import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_dashboard/home_dashboard_screen_controller.dart';
import 'package:kentei_quiz/controller/home_quiz/home_quiz_screen_controller.dart';
import 'package:kentei_quiz/controller/home_study/home_study_screen_controller.dart';
import 'package:kentei_quiz/model/dashboard/dashboard_model.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../controller/auth/auth_controller.dart';
import '../../controller/home_search/home_search_screen_controller.dart';
import '../../controller/main/main_screen_controller.dart';
import '../../controller/setting_notification/setting_notification_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz_model.dart';
import '../../view/modals/need_tracking_modal.dart';
import '../home_dashboard_screen/home_dashboard_screen.dart';
import '../home_quiz_screen/home_quiz_screen.dart';
import '../home_search_screen/home_search_screen.dart';
import '../home_setting_screen/home_setting_screen.dart';
import '../home_study_screen/home_study_screen.dart';
import '../launch_screen/launch_screen.dart';
import '../screen_argument.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShowTrackingModal =
        ref.watch(mainScreenControllerProvider.select((s) => s.isShowTrackingModal));
    final isShowPremiumDetailScreen =
        ref.watch(mainScreenControllerProvider.select((s) => s.isShowPremiumDetailScreen));
    final currentTabIndex =
        ref.watch(mainScreenControllerProvider.select((s) => s.currentTabIndex));

    Future<void>.delayed(Duration.zero, () async {
      // //チュートリアルモーダル表示
      // if (isShowTutorialModal) {
      //   ref.read(mainScreenControllerProvider.notifier).setIsShowTutorialModal(false);
      //   await showDialog(
      //     barrierDismissible: false,
      //     context: context,
      //     builder: (BuildContext context) {
      //       return TutorialModal(mainContext: context);
      //     },
      //   );
      // }
      //トラッキングモーダル表示
      if (isShowTrackingModal && currentTabIndex == 3) {
        ref.read(mainScreenControllerProvider.notifier).setIsShowTrackingModal(false);
        if (Platform.isIOS)
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return const NeedTrackingModal();
            },
          );
      }
      //プレミアム画面表示
      if (isShowPremiumDetailScreen) {
        ref.read(mainScreenControllerProvider.notifier).setIsShowPremiumDetailScreen(false);
        Future<void>.delayed(const Duration(milliseconds: 750), () async {
          context.showScreen(const PremiumDetailScreenArguments().generateRoute());
        });
      }
    });
    return const Scaffold(
      body: _Body(),
      bottomNavigationBar: _BottomNavBar(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizModelProvider.select((s) => s.quizList));
    if (quizList.isEmpty) {
      return LaunchScreen();
    }
    final currentTabIndex =
        ref.watch(mainScreenControllerProvider.select((s) => s.currentTabIndex));

    return IndexedStack(
      sizing: StackFit.expand,
      index: currentTabIndex,
      children: const [
        HomeStudyScreen(),
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
              colorFilter: const ColorFilter.mode(Colors.black45, BlendMode.srcIn),
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
            icon: const Icon(LineIcons.list),
            activeIcon: const Icon(LineIcons.list),
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
          if (index != 1) {
            ref.read(homeStudyScreenProvider.notifier).stopwatch.stop();
          }
          if (index == 2) {
            ref.read(homeSearchScreenProvider.notifier).initFilterQuiz();
          }
          if (index == 3) {
            ref.read(dashboardModelProvider.notifier).initState();
            ref.read(homeDashboardScreenProvider.notifier).initState();
            ref.read(homeQuizScreenProvider.notifier).initCategoryList();
          }
          if (index == 4) {
            ref.read(authProvider.notifier).initState();
            final isShowTrackingModal = ref.read(mainScreenControllerProvider).isShowTrackingModal;
            if (!isShowTrackingModal) {
              ref.read(settingNotificationProvider.notifier).initState();
            }
          }
        });
  }
}
