import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';

import '../../controller/setting_color/setting_color_controller.dart';
import '../../view/button.dart';

///カラーテーマ選択
class SettingColorScreen extends ConsumerWidget {
  const SettingColorScreen();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("テーマ変更"),
        leading: CustomBackButton(iconSize: 25, onPressed: () {}),
      ),
      body: const SingleChildScrollView(
        child: _ColorCards(),
      ),
    );
  }
}

class _ColorCards extends ConsumerWidget {
  const _ColorCards();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = ref.watch(settingColorProvider.notifier).colors;
    final themeId = ref.watch(settingColorProvider).themeId;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.width * 0.02),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: colors.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          final _isSelected = index == themeId;

          return GestureDetector(
            onTap: () async {
              await ref.read(settingColorProvider.notifier).setTheme(index);
              await ref.read(settingColorProvider.notifier).setThemeId(index);
            },
            child: Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(
                  horizontal: context.width * 0.02,
                  vertical: context.width * 0.02),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: _isSelected ? colors[index] : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  ///チェックアイコン
                  Container(
                    padding: EdgeInsets.all(context.width * 0.01),
                    alignment: Alignment.topRight,
                    child: Icon(
                      // 選択している時、Icons.check_circle、選択していない時、circle_outlinedに変更
                      _isSelected ? Icons.check_circle : Icons.circle_outlined,
                      color: _isSelected ? colors[index] : Colors.grey,
                      size: context.width * 0.08,
                    ),
                  ),

                  ///背景カラー
                  Container(
                    width: context.width * 0.21,
                    height: context.width * 0.21,
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: colors[index].shade50,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 0, //ぼかし
                          offset: Offset(13, 13), // 1
                        ),
                      ],
                    ),

                    ///ボタンカラー
                    child: Container(
                      height: context.width * 0.07,
                      width: context.width * 0.07,
                      margin: EdgeInsets.all(context.width * 0.02),
                      decoration: ShapeDecoration(
                        shape: const CircleBorder(),
                        color: colors[index].shade600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Gap(10),

                  ///テキスト
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      ref.watch(settingColorProvider.notifier).colorName(index),
                      style: TextStyle(
                        color: _isSelected ? Colors.black54 : Colors.grey,
                        fontSize: context.width * 0.04,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
