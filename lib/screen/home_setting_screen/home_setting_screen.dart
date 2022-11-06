import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';
import 'package:kentei_quiz/view/button.dart';

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
          SettingListBar(
            title: "プロフィール設定",
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
    );
  }
}
