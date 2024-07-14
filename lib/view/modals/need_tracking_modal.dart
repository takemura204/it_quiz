import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/main/main_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/button/primary_button.dart';

import '../../controller/setting_notification/setting_notification_controller.dart';

///トラッキングモーダル
class NeedTrackingModal extends ConsumerWidget {
  const NeedTrackingModal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(context.width * 0.02),
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: context.width * 1,
          padding: EdgeInsets.all(context.width * 0.01),
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
                '広告カスタマイズ設定のお願い',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              const Gap(15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
                child: RichText(
                  textAlign: TextAlign.start,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '本アプリを快適にご利用いただくために、より適切な広告を表示するために次に表示される画面で「許可」の選択のご協力をお願いたします。',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Gap(20),
              SvgPicture.asset(
                'assets/image/need_app_tracking.svg',
                width: context.width * 0.7,
                fit: BoxFit.fitWidth,
              ),
              const Gap(20),

              ///ボタン
              PrimaryButton(
                width: context.width,
                height: 60,
                title: "次へ",
                onPressed: () async {
                  await ref
                      .read(mainScreenControllerProvider.notifier)
                      .initAppTrackingTransparency();
                  Navigator.of(context).pop();

                  // トラッキング許可が終了したらinitStateを実行
                  await ref
                      .read(settingNotificationProvider.notifier)
                      .initState();
                },
              ),

              const Gap(5),
            ],
          ),
        ),
      ),
    );
  }
}
