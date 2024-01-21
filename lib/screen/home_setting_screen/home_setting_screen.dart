import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/auth/auth_controller.dart';
import 'package:kentei_quiz/controller/home_setting/home_setting_controller.dart';
import 'package:kentei_quiz/model/dashboard/dashboard_model.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:kentei_quiz/model/user/user.model.dart';
import 'package:line_icons/line_icons.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../controller/setting_notification/setting_notification_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/notification_time/notification_time.dart';
import '../../view/bar.dart';
import '../../view/bottom_sheet/daily_goal_picker.dart';
import '../../view/bottom_sheet/time_picker.dart';
import '../../view/button/primary_button.dart';
import '../../view/dialog.dart';
import '../screen_argument.dart';

part 'home_setting_view.dart';
part 'setting_about_app.dart';
part 'setting_color.dart';
part 'setting_contact.dart';
part 'setting_daily_goal.dart';
part 'setting_delete_data.dart';
part 'setting_notification.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// プロフィール
            Container(
              color: Colors.white,
              height: context.height * 0.22,
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // スプラッシュ画面などに書き換えても良い
                    return const SizedBox();
                  }
                  if (snapshot.hasData) {
                    // User が null でなない、サインイン済みのホーム画面へ
                    return Column(
                      children: [
                        const SettingTitleBar(
                          title: "アカウント情報(サインイン済み)",
                          onTap: null,
                        ),
                        const UserProfile(),
                        DefaultSettingBar(
                          title: "プロフィール編集",
                          onTap: () => context.showScreen(
                            const ProfileScreenArguments().generateRoute(),
                          ),
                        ),
                      ],
                    );
                  }

                  /// 未サインインのサインイン画面
                  return Container(
                    height: context.height * 0.2,
                    child: Column(
                      children: [
                        const SettingTitleBar(
                          title: "アカウント情報(未サインイン)",
                          onTap: null,
                        ),
                        const UserProfile(),

                        ///ログイン・会員登録ボタン
                        SetAccountButton(
                          onPressed: () => context.showScreen(
                            const AccountCreateStep1ScreenArguments()
                                .generateRoute(),
                          ),
                          text: "新規登録・ログイン",
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SettingTitleBar(title: "設定", onTap: null),
                  const _SettingDailyGoal(),
                  _Divider(),
                  const _SettingThemeColor(),
                  _Divider(),
                  const _SettingNotification(),
                  _Divider(),
                  const SettingTitleBar(title: "サポート", onTap: null),
                  const _SettingContact(),
                  _Divider(),
                  const _SettingReview(),
                  _Divider(),
                  const _SettingAboutApp(),
                  _Divider(),
                  const SettingTitleBar(title: "その他", onTap: null),
                  const _SettingDeleteData(),

                  ///シェア機能も追加したい。
                ],
              ),
            ),

            Container(
              child: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // スプラッシュ画面などに書き換えても良い
                    return const SizedBox();
                  }
                  if (snapshot.hasData) {
                    // User が null でなない、つまりサインイン済みのホーム画面へ
                    return Column(
                      children: [
                        ///アカウント削除
                        const SettingTitleBar(
                          title: "その他",
                          onTap: null,
                        ),
                        DefaultSettingBar(
                          title: "アプリを削除する",
                          onTap: () async {
                            context.showScreen(
                                const AccountDeleteScreenArguments()
                                    .generateRoute());
                          },
                        ),
                        Gap(context.height * 0.025),

                        ///ログアウトボタン
                        SetAccountButton(
                          onPressed: () async {
                            await showDialog(
                                context: context,
                                builder: (context) {
                                  return PrimaryDialog(
                                      onPressed: () {
                                        ref
                                            .read(authProvider.notifier)
                                            .signOut();
                                        Navigator.of(context).pop();
                                      },
                                      title: "ログアウトしますか？",
                                      subWidget: Text(
                                        "ログアウトすると\n一部の機能が制限されます。",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: context.width * 0.04,
                                            color: Colors.black87),
                                        maxLines: 2,
                                      ),
                                      cancelText: "キャンセル",
                                      doneText: "ログアウト");
                                });
                          },
                          text: "ログアウト",
                        ),
                      ],
                    );
                  }

                  // User が null である、つまり未サインインのサインイン画面へ
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
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
