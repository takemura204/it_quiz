import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/auth/auth_controller.dart';
import 'package:kentei_quiz/controller/home_setting/home_setting_controller.dart';
import 'package:kentei_quiz/model/dashboard/dashboard_model.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';
import 'package:kentei_quiz/view/card/need_notification_card.dart';
import 'package:kentei_quiz/view/card/need_premium_card.dart';
import 'package:line_icons/line_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/setting_notification/setting_notification_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/notification_time/notification_time.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/bar.dart';
import '../../view/bottom_sheet/daily_goal_picker.dart';
import '../../view/bottom_sheet/time_picker.dart';
import '../../view/modals/dialog.dart';
import '../screen_argument.dart';

part 'home_setting_view.dart';
part 'setting_about_app.dart';
part 'setting_color.dart';
part 'setting_contact.dart';
part 'setting_daily_goal.dart';
part 'setting_delete_data.dart';
part 'setting_notification.dart';
part 'setting_premium.dart';
part 'setting_profile.dart';
part 'setting_review.dart';

class HomeSettingScreen extends ConsumerWidget {
  const HomeSettingScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n().titleSetting),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SettingTitleBar(title: "アカウント情報", onTap: null),
                  const _SettingProfile(),
                  _Divider(),
                  const _SettingPremium(),
                  _Divider(),
                  const NeedPremiumCard(),
                  const SettingTitleBar(title: "カスタム", onTap: null),
                  const _SettingThemeColor(),
                  _Divider(),
                  const _SettingDailyGoal(),
                  _Divider(),
                  const _SettingNotification(),
                  _Divider(),
                  const NeedNotificationCard(),

                  const SettingTitleBar(title: "サポート", onTap: null),
                  // const _SettingTutorial(),
                  // _Divider(),
                  const _SettingContact(),
                  _Divider(),
                  const _SettingReview(),
                  _Divider(),
                  const _SettingAboutApp(),
                  _Divider(),
                  const AdBanner(height: 270),
                  const SettingTitleBar(title: "その他", onTap: null),
                  const _SettingDeleteData(),
                  Container(
                    height: 60,
                    color: context.backgroundColor,
                  ),

                  ///開発用
                  GestureDetector(
                    onLongPress: () {
                      ref.read(authModelProvider.notifier).updateIsPremium(false);
                    },
                    child: Container(
                      height: 40,
                      color: context.backgroundColor,
                    ),
                  ),

                  ///シェア機能も追加したい。
                ],
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AdBanner(),
            ],
          ),
        ],
      ),
    );
  }
}

class _Divider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: const Divider(height: 1),
    );
  }
}
