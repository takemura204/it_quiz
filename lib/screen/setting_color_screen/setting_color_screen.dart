import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';

import '../../controller/setting_color/setting_color_controller.dart';
import '../../resource/color_resource.dart';
import '../../view/button.dart';

class SettingColorScreen extends ConsumerWidget {
  const SettingColorScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("カラーテーマ"),
        leading: CustomBackButton(iconSize: 25, onPressed: () {}),
      ),
      body: const SingleChildScrollView(
        child: SkinCards(),
      ),
    );
  }
}

class SkinCards extends ConsumerWidget {
  const SkinCards();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(settingColorProvider.notifier);
    final selectedThemeId = ref.watch(settingColorProvider);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.width * 0.02),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: AppColor.colors.length, // 色の数に変更
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          final isSelected = index == selectedThemeId;

          return GestureDetector(
            onTap: () async {
              // 選択したカードの色を設定し、端末に保存します。
              await controller.setTheme(index);
              await controller.setThemeId(index);
            },
            child: Card(
              elevation: 3,
              color: AppColor.colors[index], // 選択する色に変更
              margin: EdgeInsets.symmetric(
                  horizontal: context.width * 0.02,
                  vertical: context.width * 0.02),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(context.width * 0.02),
                    alignment: Alignment.topRight,
                    child: Icon(
                      // 選択している時、Icons.check_circle、選択していない時、circle_outlinedに変更
                      isSelected ? Icons.check_circle : Icons.circle_outlined,
                      color: Colors.red,
                      size: context.width * 0.1,
                    ),
                  ),
                  Column(
                    children: [
                      const Spacer(),
                      Text(
                        skinCardName(index),
                        style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

String skinCardName(int themeId) {
  switch (themeId) {
    case 0:
      return "デフォルト";
    case 1:
      return "レッド";
    case 2:
      return "ブルー";
    case 3:
      return "グリーン";
    case 4:
      return "イエロー";
    case 5:
      return "オレンジ";
    case 6:
      return "ブラック";
    case 7:
      return "パープル";
    default:
      return '';
  }
}
