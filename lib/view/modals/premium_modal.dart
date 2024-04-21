import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../button/primary_button.dart';
import '../button/secondory_button.dart';

///プレミアム登録
class NeedPremiumModal extends HookWidget {
  const NeedPremiumModal(
      {required this.title, required this.subtitle, required this.onPressed});

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
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(context.height * 0.01),

            ///タイトル
            Text(
              "$title",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(context.height * 0.02),

            ///サブタイトル
            Text(
              "$subtitle",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),

            Gap(context.height * 0.025),

            ///ボタン
            PrimaryButton(
                width: context.width * 0.85,
                height: 55,
                text: "Stockrプレミアムに登録する",
                onPressed: onPressed),
            Gap(context.height * 0.01),
            SecondaryButton(
              width: context.width * 0.85,
              height: 55,
              text: "キャンセル",
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Gap(context.height * 0.01),
          ],
        ),
      ),
    );
  }
}

///プレミアム購入完了モーダル
class PurchasedModal extends HookWidget {
  const PurchasedModal(
      {required this.title, required this.subtitle, required this.onPressed});

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
        padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(context.height * 0.01),

            ///タイトル
            Text(
              "$title",
              style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
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
