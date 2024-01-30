import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../../controller/admob/admob_controller.dart';

class AdInterstitial extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adMobController = ref.read(adMobProvider.notifier);

    return FutureBuilder<InterstitialAd?>(
      future: adMobController.createNewInterstitialAd(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          snapshot.data!.show();
          return Container(); // 広告の表示を試みたことを示すダミーのウィジェットを返す
        } else if (snapshot.connectionState == ConnectionState.done &&
            !snapshot.hasData) {
          // 広告のロードに失敗した場合
          return Container(); // 広告のロードに失敗したことを示すダミーのウィジェットを返す
        } else {
          // 広告がロード中の場合
          return Container(
              height: context.height,
              color: context.backgroundColor,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const Gap(15),
                  Text(
                    '結果分析中...',
                    style: context.texts.bodyMedium,
                  ),
                ],
              ));
        }
      },
    );
  }
}
