import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../button/primary_button.dart';
import '../button/secondory_button.dart';

///プレミアム登録
class NeedPremiumModal extends ConsumerWidget {
  const NeedPremiumModal({
    required this.onPressed,
    required this.title,
    required this.subWidget,
  });

  final VoidCallback onPressed;
  final String title;
  final Widget subWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final premiumCardIndex = Random().nextInt(9) + 1; // 1 から 9 のランダムな数値を生成
    final imagePath = 'assets/image/premium_$premiumCardIndex.svg';
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.05),
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const Gap(15),
              subWidget,
              const Gap(15),
              SvgPicture.asset(
                imagePath,
                width: context.width * 0.4,
                fit: BoxFit.cover,
              ),
              const Gap(20),

              ///ボタン
              PrimaryButton(
                  width: context.width * 0.85,
                  height: 55,
                  text: "プレミアムに登録する",
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
              const Gap(15),
            ],
          ),
        ),
      ),
    );
  }
}
