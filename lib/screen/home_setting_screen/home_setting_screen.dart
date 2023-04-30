import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/auth/auth_screen_controller.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';

import '../../view/bar.dart';
import '../../view/button.dart';
import '../../view/dialog.dart';
import '../screen_argument.dart';

part 'home_setting_view.dart';

class HomeSettingScreen extends ConsumerWidget {
  const HomeSettingScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
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
            children: const [
              SettingTitleBar(
                title: "設定",
                onTap: null,
              ),
              SettingListBar(
                title: "通知",
                onTap: null,
              ),
              SettingTitleBar(
                title: "アプリについて",
                onTap: null,
              ),
              SettingListBar(
                title: "お問合せ",
                onTap: null,
              ),
              SettingListBar(
                title: "シェア",
                onTap: null,
              ),
              SettingListBar(
                title: "開発者",
                onTap: null,
              ),
              SettingTitleBar(
                title: "アカウント情報",
                onTap: null,
              ),
              SettingListBar(
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
                      await showDialog<Dialog>(
                          context: context,
                          builder: (context) {
                            return const SignOutDialog();
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
    );
  }
}
