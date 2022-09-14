import 'package:flutter/material.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:settings_ui/settings_ui.dart';

class HomeSettingScreen extends StatelessWidget {
  const HomeSettingScreen();

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        ///マイページだよa-1
        CustomSettingsSection(
          child: Container(
            height: context.height * 0.08,
            margin: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.blue.shade300,
            child: SettingsTile.navigation(
              leading: Icon(Icons.account_circle),
              title: Text('プロフィール'),
              value: Text('Takemurataiki'),
            ),
          ),
        ),
        SettingsSection(
          title: Text('kentei_quizについて'),
          tiles: [
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Language'),
              value: Text('English'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: true,
              leading: Icon(Icons.format_paint),
              title: Text('Enable custom theme'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.mail_outline),
              title: Text('お問合せ・ご意見・ご要望'),
              onPressed: (_) {},
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.share),
              title: Text('シェア'),
              trailing: Text(''),
              onPressed: (_) {},
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.star),
              title: Text('このアプリについて'),
              onPressed: (_) {},
            ),
          ],
        ),
        SettingsSection(
          title: Text('その他'),
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
