import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/auth/auth_screen_controller.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';

import '../../resource/lang/initial_resource.dart';
import '../../view/bar.dart';
import '../../view/button.dart';
import '../../view/dialog.dart';
import '../screen_argument.dart';

part 'home_setting_view.dart';

class HomeSettingScreen extends ConsumerWidget {
  const HomeSettingScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n().titleSetting),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// プロフィール
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
                        const SettingTitleBar(
                          title: "アカウント情報(サインイン済み)",
                          onTap: null,
                        ),
                        const UserProfile(),
                        SettingListBar(
                          title: "プロフィール編集",
                          onTap: () => context.showScreen(
                            const ProfileScreenArguments().generateRoute(),
                          ),
                        ),
                      ],
                    );
                  }
                  // User が null である、つまり未サインインのサインイン画面へ
                  return Container(
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
                            const LoginScreenArguments().generateRoute(),
                          ),
                          text: "ログイン・新規登録",
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Column(
              children: [
                const SettingTitleBar(
                  title: "設定",
                  onTap: null,
                ),
                SettingListBar(
                  title: "カラーテーマ",
                  onTap: () {
                    context.showScreen(
                      const SettingColorScreenArguments().generateRoute(),
                    );
                  },
                ),
                const SettingListBar(
                  title: "通知",
                  onTap: null,
                ),
                const SettingTitleBar(
                  title: "アプリについて",
                  onTap: null,
                ),
                const SettingListBar(
                  title: "お問合せ",
                  onTap: null,
                ),
                const SettingListBar(
                  title: "シェア",
                  onTap: null,
                ),
                const SettingListBar(
                  title: "開発者",
                  onTap: null,
                ),
                const SettingTitleBar(
                  title: "アカウント情報",
                  onTap: null,
                ),
                const SettingListBar(
                  title: "アプリを削除する",
                  onTap: null,
                ),
              ],
            ),

            const Gap(30),
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
                    return

                        ///ログイン・会員登録ボタン
                        SetAccountButton(
                      onPressed: () async {
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return DialogDefault1(
                                  onPressed: () {
                                    ref
                                        .read(authScreenControllerProvider
                                            .notifier)
                                        .signOut();
                                    Navigator.of(context).pop();
                                  },
                                  title: "ログアウトしますか？",
                                  subTitle: "ログアウトすると\n一部の機能が制限されます。",
                                  cancelText: "キャンセル",
                                  doneText: "ログアウト");
                            });
                      },
                      text: "ログアウト",
                    );
                  }

                  // User が null である、つまり未サインインのサインイン画面へ
                  return const SizedBox();
                },
              ),
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
