import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_study/home_study_screen_controller.dart';
import 'package:kentei_quiz/model/dashboard/dashboard_model.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../controller/auth/auth_controller.dart';
import '../../controller/main/main_screen_controller.dart';
import '../../controller/setting_notification/setting_notification_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz_model.dart';
import '../../untils/enums.dart';
import '../../view/modals/need_tracking_modal.dart';
import '../home_dashboard_screen/home_dashboard_screen.dart';
import '../home_quiz_screen/home_quiz_screen.dart';
import '../home_search_screen/home_search_screen.dart';
import '../home_setting_screen/home_setting_screen.dart';
import '../home_study_screen/home_study_screen.dart';
import '../launch_screen/launch_screen.dart';
import '../screen_argument.dart';

part 'widget/body.dart';
part 'widget/bottom_nav_bar.dart';

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
