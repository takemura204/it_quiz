import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:kentei_quiz/view/button.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../view/bar.dart';

part 'home_setting_view.dart';

class HomeSettingScreen extends StatelessWidget {
  const HomeSettingScreen();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          /// プロフィール
          UserProfile(),
          Gap(10),

          SettingTitleBar(
            title: "アカウント情報",
            onTap: null,
          ),

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
        ],
      ),
    );

    SettingsList(
      sections: [
        // ///マイページ
        // CustomSettingsSection(
        //   child: SettingsTile.navigation(
        //     leading: const Icon(Icons.account_circle),
        //     title: const Text('プロフィール'),
        //     value: const Text('Takemurataiki'),
        //   ),
        // ),
        ///基本情報(ゲスト)
        SettingsSection(
          title: const Text('アカウント情報(ゲスト)'),
          tiles: [
            //会員登録
            SettingsTile.navigation(
              leading: const Icon(Icons.language),
              title: const Text('新規登録'),
              onPressed: (_) {
                context.showScreen(
                    const CreateAccountScreenArguments().generateRoute());
              },
            ),
            //ログイン
            SettingsTile.navigation(
              leading: const Icon(Icons.star),
              title: const Text('ログイン'),
              onPressed: (_) {
                context
                    .showScreen(const LoginScreenArguments().generateRoute());
              },
            ),
          ],
        ),

        ///基本情報(ログイン済み)
        SettingsSection(
          title: const Text('アカウント情報(ログイン済み)'),
          tiles: [
            SettingsTile.navigation(
              leading: const Icon(Icons.language),
              title: const Text('アカウント情報'),
            ),
          ],
        ),
        SettingsSection(
          title: const Text('kentei_quizについて'),
          tiles: [
            SettingsTile.navigation(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              value: const Text('English'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: true,
              leading: const Icon(Icons.format_paint),
              title: const Text('Enable custom theme'),
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.mail_outline),
              title: const Text('お問合せ・ご意見・ご要望'),
              onPressed: (_) {},
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.share),
              title: const Text('シェア'),
              trailing: const Text(''),
              onPressed: (_) {},
            ),
            SettingsTile.navigation(
              leading: const Icon(Icons.star),
              title: const Text('このアプリについて'),
              onPressed: (_) {},
            ),

            ///
            SettingsTile.navigation(
              leading: const Icon(Icons.star),
              title: const Text('ログイン画面に遷移'),
              onPressed: (_) {
                context
                    .showScreen(const LoginScreenArguments().generateRoute());
              },
            ),
          ],
        ),
        SettingsSection(
          title: const Text('その他'),
          tiles: [
            SettingsTile.navigation(
              leading: Icon(
                Icons.delete,
                color: context.colors.primary.withOpacity(0.6),
              ),
              title: Text(
                'アカウントを削除する',
                style: TextStyle(
                  color: context.colors.primary.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
