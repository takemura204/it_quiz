import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/premium_detail/premium_detail_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';
import 'package:kentei_quiz/view/button/primary_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/lang/initial_resource.dart';
import '../../view/button/animation_shadow_button.dart';
import '../../view/button/circle_button.dart';
import '../../view/loading.dart';
import '../../view/modals/need_premium_modal/need_premium_modal.dart';

part 'widget/precautions.dart';
part 'widget/premium_content.dart';
part 'widget/premium_content_list.dart';
part 'widget/premium_cta_button.dart';
part 'widget/premium_header.dart';

class PremiumDetailScreen extends ConsumerWidget {
  const PremiumDetailScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(premiumDetailProvider.select((s) => s.isLoading));
    final isShowPurchasedModal =
        ref.watch(premiumDetailProvider.select((s) => s.isShowPurchasedModal));

    Future<void>.delayed(Duration.zero, () async {
      if (isShowPurchasedModal) {
        ref.read(premiumDetailProvider.notifier).setIsShowPurchasedModal(false);
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return PurchasedModal(
                title: "購入ありがとうございます🎉",
                subtitle: "プレミアム特典が利用可能になりました！\nさっそく使ってみましょう！",
                onPressed: () async {
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
          },
        );
      }
    });
    return AbsorbPointer(
      absorbing: isLoading,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: context.backgroundColor,
            body: const Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      _PremiumHeader(),
                      Gap(30),
                      _PremiumContentList(),
                      Gap(30),
                      _Precautions(),
                      Gap(120),
                    ],
                  ),
                ),

                ///購入ボタン
                _CtaButton(),
              ],
            ),
          ),
          Visibility(
            visible: isLoading,
            child: OverLayLoading(),
          ),
        ],
      ),
    );
  }
}
