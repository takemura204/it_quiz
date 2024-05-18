import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/tutorial/tutorial_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../button/primary_button.dart';
import '../button/secondory_button.dart';

///チュートリアルモーダル
class TutorialModal extends ConsumerWidget {
  const TutorialModal({required this.mainContext});

  final BuildContext mainContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          margin: EdgeInsets.all(context.width * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(15),
              const Text(
                'インストールありがとうございます！🎉',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const Gap(15),
              const Text(
                'チュートリアルを開始しますか？',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87),
              ),
              const Gap(15),
              SvgPicture.asset(
                'assets/image/about_app.svg',
                width: context.width * 0.8,
                fit: BoxFit.fitWidth,
              ),
              const Gap(20),

              ///ボタン
              PrimaryButton(
                  width: context.width,
                  height: 55,
                  text: "開始する",
                  onPressed: () {
                    Navigator.of(context).pop();
                    ref
                        .read(tutorialControllerProvider.notifier)
                        .setIsShowTarget1(true);
                  }),
              Gap(context.height * 0.01),
              SecondaryButton(
                width: context.width,
                height: 55,
                text: "キャンセル",
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
