import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';
import 'package:line_icons/line_icons.dart';

import '../../controller/setting_color/setting_color_controller.dart';
import '../../view/button_icon/cutom_back_button.dart';
import '../../view/modals/premium_modal.dart';
import '../screen_argument.dart';

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
        leading: CustomBackButton(onPressed: () {
          Navigator.pop(context);
        }),
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
    final themeId = ref.watch(authModelProvider.select((s) => s.themeId));
    final isPremium = ref.watch(authModelProvider.select((s) => s.isPremium));

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.01, vertical: context.width * 0.01),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: colors.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          final _isSelected = index == themeId;

          return GestureDetector(
            onTap: isPremium
                ? () async {
                    ref.read(authModelProvider.notifier).updateThemeId(index);
                  }
                : index == 0
                    ? null
                    : () {
                        showDialog(
                            context: context,
                            builder: (_) => NeedPremiumModal(
                                  title: 'テーマを入手しますか？',
                                  imagePath:
                                      'assets/image/premium/premium_content5_3.png',
                                  subWidget: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: const TextSpan(
                                            style: TextStyle(
                                                color: Colors.black87),
                                            children: [
                                              TextSpan(
                                                text: 'プレミアム特典の支払いは一度きり。\n',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '購入すると、全てのテーマを、自分好みに変更できます。',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    context.showScreen(
                                        const PremiumDetailScreenArguments()
                                            .generateRoute());
                                  },
                                ));
                      },
            child: Card(
              color: isPremium
                  ? Colors.white
                  : index == 0
                      ? Colors.white
                      : Colors.grey.shade200,
              elevation: 1,
              margin: EdgeInsets.symmetric(
                  horizontal: context.width * 0.01,
                  vertical: context.width * 0.01),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: _isSelected ? colors[index] : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ///背景カラー
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),

                      Text(
                        '',
                        style: TextStyle(
                          color: _isSelected ? Colors.black54 : Colors.black54,
                          fontSize: context.width * 0.03,
                        ),
                      ),

                      Container(
                        width: context.width * 0.15,
                        height: context.width * 0.15,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colors[index].shade50,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0,
                              offset: Offset(7, 7),
                            ),
                          ],
                        ),

                        ///ボタンカラー
                        child: Container(
                          height: context.width * 0.05,
                          width: context.width * 0.05,
                          margin: EdgeInsets.all(context.width * 0.01),
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            color: colors[index],
                          ),
                        ),
                      ),

                      const Spacer(),

                      ///テキスト
                      Text(
                        ref
                            .watch(settingColorProvider.notifier)
                            .colorName(index),
                        style: TextStyle(
                          color: _isSelected ? colors[index] : Colors.black54,
                          fontSize: context.width * 0.03,
                          fontWeight:
                              _isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      Gap(context.height * 0.01),
                    ],
                  ),

                  ///チェックアイコン
                  Container(
                    padding: EdgeInsets.all(context.width * 0.01),
                    alignment: Alignment.topRight,
                    child: Icon(
                      // 選択している時、Icons.check_circle、選択していない時、circle_outlinedに変更
                      isPremium
                          ? _isSelected
                              ? Icons.check_circle
                              : Icons.circle_outlined
                          : index == 0
                              ? Icons.check_circle
                              : LineIcons.lock,
                      color: _isSelected ? colors[index] : Colors.grey,
                      size: context.width * 0.06,
                    ),
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
