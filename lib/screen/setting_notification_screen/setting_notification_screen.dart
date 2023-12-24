import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../controller/setting_notification/setting_notification_controller.dart';
import '../../view/button_icon/cutom_back_button.dart';

class SettingNotificationScreen extends ConsumerWidget {
  const SettingNotificationScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNotification =
        ref.watch(settingNotificationProvider).isNotification;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("リマインダー設定"),
        leading: CustomBackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('通知設定'),
            SwitchListTile(
              title: const Text("リマインダーを有効にする"),
              value: isNotification,
              onChanged: (bool value) async {
                if (value) {
                  // 通知許可をリクエスト
                  await ref
                      .read(settingNotificationProvider.notifier)
                      .requestPermissions();
                } else {
                  // 設定画面に遷移
                  print('not Setting');
                  // OpenSettings.openNotificationsSettings();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
