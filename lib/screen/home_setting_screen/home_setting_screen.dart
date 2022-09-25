import 'package:flutter/material.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:settings_ui/settings_ui.dart';

class HomeSettingScreen extends StatelessWidget {
  const HomeSettingScreen();

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        ///マイページだよa
        CustomSettingsSection(
          child: Container(
            height: context.height * 0.08,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            color: Colors.blue.shade300,
            child: SettingsTile.navigation(
              leading: const Icon(Icons.account_circle),
              title: const Text('プロフィール'),
              value: const Text('Takemurataiki'),
            ),
          ),
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
