import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../button/animation_shadow_button.dart';

///プレミアム登録
class NeedPremiumModal extends ConsumerWidget {
  const NeedPremiumModal({
    required this.onPressed,
    required this.title,
    required this.imagePath,
    required this.subWidget,
  });

  final VoidCallback onPressed;
  final String title;
  final String imagePath;
  final Widget subWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.03),
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: context.width * 1,
          padding: EdgeInsets.all(context.width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(15),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const Gap(15),
              subWidget,
              const Gap(15),
              if (imagePath.contains('.png'))
                Image.asset(imagePath)
              else if (imagePath.contains('.svg'))
                SvgPicture.asset(
                  imagePath,
                  width: context.height * 0.2,
                  fit: BoxFit.fitHeight,
                ),
              const Gap(25),

              const Text(
                '＼　他にもたくさんの特典付き！　／',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              const Gap(8),

              ///ボタン
              AnimatedShadowButton(
                width: context.width,
                height: 60,
                title: "プレミアム特典を見る！",
                onPressed: onPressed,
              ),
              TextButton(
                child: const Text(
                  "キャンセル",
                  style:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black54),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///プレミアム購入完了モーダル
class PurchasedDoneModal extends HookWidget {
  const PurchasedDoneModal({required this.title, required this.subtitle, required this.onPressed});

  final String title;
  final String subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding:
            EdgeInsets.symmetric(horizontal: context.width * 0.02, vertical: context.width * 0.02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(context.height * 0.01),

            ///タイトル
            Text(
              "$title",
              style:
                  const TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            Gap(context.height * 0.02),

            ///サブタイトル
            Text(
              "$subtitle",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.normal,
              ),
            ),

            Gap(context.height * 0.02),
            Icon(
              Icons.check_circle_outline,
              color: context.mainColor,
              size: context.height * 0.12,
            ),

            Gap(context.height * 0.025),

            ///ボタン
            GestureDetector(
              onTap: onPressed,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: context.width,
                height: 51,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "閉じる",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Gap(context.height * 0.01),
          ],
        ),
      ),
    );
  }
}
